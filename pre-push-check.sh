#!/bin/bash
# Pre-push check script for Linux/Mac
# Run this before pushing to main or creating a PR

echo "======================================"
echo "Running Pre-Push Checks..."
echo "======================================"

echo ""
echo "1/2 Running static analysis..."
flutter analyze
if [ $? -ne 0 ]; then
    echo "❌ Analysis failed!"
    exit 1
fi
echo "✅ Analysis passed"

echo ""
echo "2/2 Running tests..."
flutter test
if [ $? -ne 0 ]; then
    echo "❌ Tests failed!"
    exit 1
fi
echo "✅ Tests passed"

echo ""
echo "======================================"
echo "✅ All checks passed! Safe to push."
echo "======================================"
