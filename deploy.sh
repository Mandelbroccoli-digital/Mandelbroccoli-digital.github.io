#!/usr/bin/env bash
# Deploy OWL_6055 services hub to GitHub Pages (USER page).
# PREREQ: gh auth login  (done)
set -e

cd "$(dirname "$0")"

# Derive the authenticated username — repo MUST be <user>.github.io for a user page
USER="$(gh api user --jq .login)"
REPO="${USER}.github.io"
MSG="OWL_6055 services hub — initial deploy"

echo "==> deploying as $USER  ->  repo: $REPO"

if [ ! -d .git ]; then
  git init -q
  git branch -M main
fi
git add -A
git commit -q -m "$MSG" || echo "(nothing new to commit)"

if gh repo view "$REPO" >/dev/null 2>&1; then
  echo "==> repo exists — pushing"
  git remote -v | grep -q "origin" || git remote add origin "https://github.com/$USER/$REPO.git"
  git push -u origin main
else
  echo "==> creating repo + pushing"
  gh repo create "$REPO" --public --description "OWL_6055 — Private AI & Automation services hub" --source . --remote origin --push
fi

# Enable GitHub Pages on branch main / root via API (no manual web toggle)
echo "==> enabling Pages"
gh api -X POST "/repos/$USER/$REPO/pages" \
  -f "source[branch]=main" \
  -f "source[path]=/" >/dev/null 2>&1 && echo "    Pages API: requested" \
  || echo "    Pages API: already enabled or pending (check Settings > Pages)"

echo ""
echo "LIVE (after GH builds, ~1-10 min): https://$REPO"
echo "You can also add a custom domain later (Settings > Pages > Custom domain)."
