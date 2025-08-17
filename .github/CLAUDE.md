# Claude Code – Repo Guide (cognitive-os-evo)

## 🎯 Goal
- Issue/コメントの **`/claude`** をトリガーに、**まず動くPR** を素早く作る。
- 成果物は **`/artifacts/`**、必要最小限の設計メモは **`/canvas/`** に置く。

## 🪶 Light Rules（このリポでの基本姿勢）
1. **最優先**：動作する成果物を `/artifacts` に出す（小さく速く）
2. 設計メモは **最小限**（必要なときだけ `/canvas`）
3. 変更は **小さなブランチ → PR** にまとめる

## 🔔 Trigger & Input
- トリガーは **Issue コメントに含まれる `/claude`**
- 続くテキストが Claude への具体的指示
- 既存の Issue タイトル・本文・他コメントも参考に理解

## 🔧 実装ルール
- 文字コードは UTF-8 / 行末 LF 推奨（Windowsでも差分最小を優先）
- スクリプトや生成物には **最小の実行例** を `artifacts/README.md` か該当ファイル先頭に記す
- 大規模依存や環境変更は避け、**最小の追加**で達成する
- 破壊的変更・機微情報の取り込みは禁止（Secrets/Keysは参照のみ）
- 迷う点は実装を止めず **PR の Notes に明記**

## 🗣️ 言語
- 既定は **日本語**。コード/設定コメントは英語でも可。PR説明は日本語メインで簡潔に。

## 🧰 例：最小タスク
> `/claude`  
> Add `/artifacts/hello.md` with "Hello, Cognitive OS Evo!" and one-line note about Light Rules.

この場合：
- ブランチ: `feat/add-hello-artifact`
- 追加: `artifacts/hello.md`（内容 + 1行ノート）
- PR タイトル: `feat: add hello world artifact`
- PR 説明に Summary/Changes/Notes/Next を記載