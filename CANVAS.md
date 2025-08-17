# canvasOS v2 (Canvas Light)

## 目的
Artifacts-first を補助するための「最小の設計キャンバス」。重い様式を排し、PR作成速度を落とさない。

## 原則
1) 成果物は /artifacts に先行  
2) 設計は /canvas に最小だけ（1ファイル運用を基本に）  
3) 分業原則を守る（設計＝通常チャット／実装＝Claude）

## 構成
- `/canvas/00-index.md` - 入口（目的・リンク集）
- `/canvas/plan.md` - 直近計画（短文・更新継続）
- `/canvas/decisions/` - ADR（超短決定ログ）
- `/canvas/glossary.md` - 最小用語集
- `/canvas/templates/` - テンプレート

## 運用
- 計画は plan.md 1枚更新を基本とする
- 重要決定のみ ADR 追加
- 様式よりも速度を優先