#!/bin/bash

# Generate documentation
rm -rf docs && mkdir docs && swift package --allow-writing-to-directory docs generate-documentation --target BanglaKit --transform-for-static-hosting --hosting-base-path bangla.swift --output-path docs && touch docs/.nojekyll && echo '<!DOCTYPE html><html><head><meta http-equiv="refresh" content="0;url=documentation/banglakit/"></head></html>' > docs/index.html
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

# Cleanup empty directories
find . -type d -empty -delete

# Push to gh-pages branch
git push origin gh-pages

# Switch back to previous branch
git checkout -

# Print success message
echo "Documentation updated and pushed to gh-pages branch"
