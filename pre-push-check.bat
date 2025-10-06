@echo off
REM Pre-push check script for Windows (CMD)
REM Run this before pushing to main or creating a PR

echo ======================================
echo Running Pre-Push Checks...
echo ======================================

echo.
echo 1/2 Running static analysis...
call flutter analyze
if %errorlevel% neq 0 (
    echo X Analysis failed!
    exit /b 1
)
echo √ Analysis passed

echo.
echo 2/2 Running tests...
call flutter test
if %errorlevel% neq 0 (
    echo X Tests failed!
    exit /b 1
)
echo √ Tests passed

echo.
echo ======================================
echo √ All checks passed! Safe to push.
echo ======================================
