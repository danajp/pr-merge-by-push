#!/usr/bin/env bash

set -euo pipefail

DATE="$(date --iso-8601=s)"
BRANCH="change-datetime-$DATE"
FILE="datetime-$DATE"

git checkout main
git pull origin main
git checkout -b "$BRANCH"

date > "$FILE"

git add "$FILE"
git commit -m "Add $FILE with current timestamp"

git push -u origin "$BRANCH"

gh pr create \
  --title "Add $FILE" \
  --body "Automated PR: adds a file containing the current date/time."
