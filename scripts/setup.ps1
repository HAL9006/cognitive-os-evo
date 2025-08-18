param(
    [switch]$DryRun = $true,   # 既定: 確認のみ
    [switch]$Force = $false    # 実行する場合のみ -Force
)
Write-Host "📁 ClaudeCode ファイル整理システム" -ForegroundColor Cyan

# 触らない（安全領域）
$excludeDirs = @(".git", ".github", "node_modules", "venv", ".venv", "dist", "build")

# ルール定義（既存を壊さない・新規整理に有効）
$rules = @(
    @{ Pattern = "*.yml";  Target = ".github/workflows" },
    @{ Pattern = "*.yaml"; Target = ".github/workflows" },
    @{ Pattern = "*.py";   Target = "src" },
    @{ Pattern = "*test*"; Target = "tests" },
    @{ Pattern = "*.md";   Target = "docs" },
    @{ Pattern = "*.json"; Target = "config" },
    @{ Pattern = "*.ps1";  Target = "scripts" }
)

function Get-CandidateFiles {
    param([string]$pattern)
    Get-ChildItem -Path . -Recurse -Include $pattern -File -ErrorAction SilentlyContinue |
      Where-Object {
        $rel = $_.FullName.Substring((Get-Location).Path.Length)
        -not ($excludeDirs | ForEach-Object { $rel -match "(\\|/)$($_)(\\|/)" })
      }
}

if ($DryRun -and -not $Force) {
    Write-Host "`n📋 DryRun: 以下の整理を実行予定" -ForegroundColor Yellow
    foreach ($rule in $rules) {
        $files = Get-CandidateFiles -pattern $rule.Pattern
        foreach ($file in $files) {
            Write-Host ("  - {0} → {1}" -f $file.FullName.Replace((Get-Location).Path+'\',''), $rule.Target) -ForegroundColor Gray
        }
    }
    Write-Host "`n実行するには: .\scripts\setup.ps1 -Force" -ForegroundColor Green
    exit 0
}

foreach ($rule in $rules) {
    $targetDir = $rule.Target
    if (-not (Test-Path $targetDir)) {
        New-Item -ItemType Directory -Path $targetDir | Out-Null
        Write-Host "📂 $targetDir を作成" -ForegroundColor Cyan
    }
    $files = Get-CandidateFiles -pattern $rule.Pattern
    foreach ($file in $files) {
        $relName = $file.Name
        $dest = Join-Path $targetDir $relName
        try {
            Move-Item -LiteralPath $file.FullName -Destination $dest -Force
            Write-Host "✅ $relName → $targetDir" -ForegroundColor Green
        } catch {
            Write-Host "⚠️ 移動失敗: $relName => $targetDir ($($_.Exception.Message))" -ForegroundColor Yellow
        }
    }
}

Write-Host "`n🎉 整理完了！" -ForegroundColor Magenta