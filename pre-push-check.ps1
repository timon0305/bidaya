# Pre-push check script for Windows (PowerShell)
# Run this before pushing to main or creating a PR

Write-Host "======================================" -ForegroundColor Cyan
Write-Host "Running Pre-Push Checks..." -ForegroundColor Cyan
Write-Host "======================================" -ForegroundColor Cyan

Write-Host ""
Write-Host "1/2 Running static analysis..." -ForegroundColor Yellow
flutter analyze
if ($LASTEXITCODE -ne 0) {
    Write-Host "❌ Analysis failed!" -ForegroundColor Red
    exit 1
}
Write-Host "✅ Analysis passed" -ForegroundColor Green

Write-Host ""
Write-Host "2/2 Running tests..." -ForegroundColor Yellow
flutter test
if ($LASTEXITCODE -ne 0) {
    Write-Host "❌ Tests failed!" -ForegroundColor Red
    exit 1
}
Write-Host "✅ Tests passed" -ForegroundColor Green

Write-Host ""
Write-Host "======================================" -ForegroundColor Cyan
Write-Host "✅ All checks passed! Safe to push." -ForegroundColor Green
Write-Host "======================================" -ForegroundColor Cyan
