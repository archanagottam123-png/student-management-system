#!/bin/bash
echo "===== GitHub Push ====="
echo ""
echo "Enter your GitHub token and press Enter"
echo "(nothing will show as you type - that is normal)"
echo ""
read -s TOKEN
echo ""

if [ -z "$TOKEN" ]; then
  echo "No token entered. Exiting."
  exit 1
fi

echo "Logging into GitHub CLI..."
echo "$TOKEN" | gh auth login --with-token

if [ $? -ne 0 ]; then
  echo "Login failed - check your token has 'repo' scope"
  exit 1
fi

echo "Login successful!"
echo ""

git remote remove origin 2>/dev/null
git remote add origin https://github.com/archanagottam123-png/student-management-system.git

gh auth setup-git

echo "Pushing to GitHub..."
git push -u origin main

if [ $? -eq 0 ]; then
  echo ""
  echo "============================================"
  echo "SUCCESS! Project is now on GitHub!"
  echo "https://github.com/archanagottam123-png/student-management-system"
  echo "============================================"
else
  echo "Push failed."
fi
