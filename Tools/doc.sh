#!/bin/bash

# Generate documentation
swift package --allow-writing-to-directory docs generate-documentation --target BanglaKit --output-path docs

# Create and switch to gh-pages branch
if git show-ref --verify --quiet refs/heads/gh-pages; then
    git checkout gh-pages
else
    git checkout --orphan gh-pages
    git rm -rf .
fi

# Copy docs to root and clean up
cp -r docs/* .
rm -rf docs

# Add and commit changes
git add .
git commit -m "Update documentation"

# Push to gh-pages branch
git push origin gh-pages

# Switch back to previous branch
git checkout -