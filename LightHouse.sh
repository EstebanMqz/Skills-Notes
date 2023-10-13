#!/bin/bash
# Regex shell script to execute a Google Lighthouse Audit for the HTML file in the cwd for the git remote repository.

html=$(find . -name "*.html" -print -quit | sed 's/^.\///')

if [ -z "$html" ]; then
  echo "Error: No HTML file found in the repository."
  exit 1
fi

remote_url=$(git config --get remote.origin.url | sed 's/\.git//')"/blob/main/$html"

start "https://googlechrome.github.io/lighthouse/viewer/?psiurl=https://htmlpreview.github.io/?"$remote_url