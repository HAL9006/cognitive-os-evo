# Email Automation Phase 17.4 - Minimal SMTP Implementation

## 導入経緯
- CognitiveOS Hub統合に伴い、メール自動化機能を本リポジトリに導入
- `/email` コメントトリガーとActionsからの手動実行に対応
- Gmail等のSMTP経由での安全な通知システム確立

## 実装内容

### ワークフロー: `email-min.yml`
- **トリガー1:** Issue コメントで `/email` 投稿時
- **トリガー2:** Actions画面からの手動実行（workflow_dispatch）
- **セキュリティ:** Repository Secretsで認証情報を管理

### 必要なRepository Secrets
- `SMTP_HOST` - SMTPサーバー（例: smtp.gmail.com）
- `SMTP_PORT` - ポート番号（Gmail推奨: 465）
- `SMTP_USERNAME` - メールアドレス
- `SMTP_PASSWORD` - アプリパスワード（Gmailの場合）
- `EMAIL_FROM` - 送信者アドレス
- `EMAIL_TO_DEFAULT` - デフォルト受信者

## Gmail設定推奨値
```
SMTP_HOST: smtp.gmail.com
SMTP_PORT: 465
secure: true
```

## テスト方法
1. **手動テスト:** Actions → "Minimal Email via SMTP" → Run workflow
2. **自動テスト:** 任意のIssueに `/email` コメント投稿

## セキュリティ考慮
- SSL/TLS暗号化通信（secure: true）
- 認証情報の完全秘匿化
- ログからの機密情報除外

---
*Phase 17.4 - 2025-08-18*