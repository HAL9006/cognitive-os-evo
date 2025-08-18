#!/usr/bin/env bash
set -euo pipefail

FROM=""
TO=""
SUBJECT=""
BODY=""

while [[ $# -gt 0 ]]; do
  case "$1" in
    --from) FROM="$2"; shift 2;;
    --to) TO="$2"; shift 2;;
    --subject) SUBJECT="$2"; shift 2;;
    --body) BODY="$2"; shift 2;;
    *) echo "Unknown arg: $1"; exit 1;;
  esac
done

mkdir -p reports/outbox
ts=$(date +"%Y%m%d_%H%M%S")
safe_subject=$(echo -n "${SUBJECT:-no-subject}" | tr -cd '[:alnum:]_-.' | cut -c1-60)
file="reports/outbox/${ts}_${safe_subject}.eml"

{
  echo "From: ${FROM:-no-reply@example.com}"
  echo "To: ${TO:-recipient@example.com}"
  echo "Subject: ${SUBJECT:-no-subject}"
  echo "Date: $(date -R)"
  echo "MIME-Version: 1.0"
  echo "Content-Type: text/plain; charset=UTF-8"
  echo
  echo "${BODY:-Hello from SAFE dummy run.}"
} > "$file"

echo "[SAFE] Email written to $file"