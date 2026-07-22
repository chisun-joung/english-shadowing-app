#!/usr/bin/env bash
set -euo pipefail

if [ "$#" -ne 2 ]; then
  echo "Usage: ./deploy.sh GITHUB_USERNAME REPOSITORY_NAME"
  exit 1
fi

USER_NAME="$1"
REPOSITORY="$2"

cd "$(dirname "$0")"

if ! command -v git >/dev/null 2>&1; then
  echo "Git is not installed."
  exit 1
fi

[ -d .git ] || git init
git branch -M main
git add .

if git rev-parse --verify HEAD >/dev/null 2>&1; then
  if [ -n "$(git status --porcelain)" ]; then
    git commit -m "Update English shadowing app"
  fi
else
  git commit -m "Deploy English shadowing app"
fi

REMOTE_URL="https://github.com/${USER_NAME}/${REPOSITORY}.git"
if git remote get-url origin >/dev/null 2>&1; then
  git remote set-url origin "$REMOTE_URL"
else
  git remote add origin "$REMOTE_URL"
fi

git push -u origin main

echo "Expected URL: https://${USER_NAME}.github.io/${REPOSITORY}/"
