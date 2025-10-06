# quizzo

A Flutter-based quiz application.

## Pre-Commit/Pre-Push Checklist

**IMPORTANT:** Before pushing to `main` branch or creating a Pull Request, run these commands locally to ensure CI checks will pass:

### 1. Run Static Analysis
```bash
flutter analyze
```
This checks for code issues, warnings, and infos. All issues must be resolved.

### 2. Run Tests
```bash
flutter test
```
All tests must pass. Currently we have **202 unit tests** across **10 test files**.

**Test Coverage:** Comprehensive coverage of all ViewModels, Services, Utilities, and Models. See [docs/TESTING.md](docs/TESTING.md) for details.

### 3. Get Dependencies
```bash
flutter pub get
```
Ensure all dependencies are up to date.

### 4. Complete Pre-Push Script (Recommended)

**Option A: Use the provided scripts**
```bash
# Windows (PowerShell)
.\pre-push-check.ps1

# Windows (CMD)
pre-push-check.bat

# Linux/Mac
./pre-push-check.sh
```

**Option B: Manual one-liner**
```bash
# Windows (PowerShell)
flutter analyze ; if ($?) { flutter test }

# Linux/Mac
flutter analyze && flutter test
```

### Optional: Install Pre-Commit Hook

Create `.git/hooks/pre-commit` (Linux/Mac) or `.git/hooks/pre-commit.bat` (Windows):

**Linux/Mac:**
```bash
#!/bin/sh
echo "Running pre-commit checks..."
flutter analyze && flutter test
```

Make it executable:
```bash
chmod +x .git/hooks/pre-commit
```

**Windows (PowerShell):**
```powershell
# Create .git/hooks/pre-commit
flutter analyze
if ($LASTEXITCODE -ne 0) { exit 1 }
flutter test
if ($LASTEXITCODE -ne 0) { exit 1 }
```

## CI/CD Workflows

This project has the following GitHub Actions workflows:

- **Flutter Build & Test** (`.github/workflows/dart.yml`) - Runs on every push/PR to main
  - Installs dependencies
  - Runs static analysis
  - Runs tests

- **Code Coverage** (`.github/workflows/code-coverage.yml`) - Generates test coverage reports
- **Dependency Check** (`.github/workflows/dependency-check.yml`) - Checks for outdated dependencies
- **Performance Tests** (`.github/workflows/performance-tests.yml`) - Runs performance benchmarks

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
