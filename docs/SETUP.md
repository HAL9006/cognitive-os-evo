# Setup / 整理スクリプトの使い方

このリポジトリには、ファイルを標準配置に整える PowerShell スクリプトがあります。

## 使い方（Windows PowerShell）

### まず DryRun（確認のみ）
```powershell
.\scripts\setup.ps1
```

### 実際に整理を実行
```powershell
.\scripts\setup.ps1 -Force
```

## 整理ルール

| ファイル種類 | 移動先フォルダ |
|--------------|----------------|
| `*.yml`, `*.yaml` | `.github/workflows` |
| `*.py` | `src` |
| `*test*` | `tests` |
| `*.md` | `docs` |
| `*.json` | `config` |
| `*.ps1` | `scripts` |

## 安全機能

- **DryRun既定**: `-Force` なしでは確認のみ
- **除外フォルダ**: `.git`, `.github`, `node_modules`, `venv`, `dist`, `build` は触らない
- **既存ファイル保護**: 同名ファイルは上書き

## 使用例

```powershell
# プロジェクトをクローン/作成後
cd your-project
.\scripts\setup.ps1          # 何が移動されるか確認
.\scripts\setup.ps1 -Force   # 実際に整理実行
```

## 注意点

- Windows PowerShell 5.1+ 推奨
- 実行前に重要ファイルのバックアップを推奨
- git管理下では事前に `git status` で確認