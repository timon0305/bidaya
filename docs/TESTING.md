# Testing Guide

## Current Test Coverage

**Current Status:**
- Total Tests: **80 passing** ✅
- Files with Tests: **6 ViewModels**
- Total Files in Project: ~103
- Current Coverage: Improving (ViewModels fully covered)
- Target Coverage: 70%

## Test Files

### ViewModel Tests (All Covered ✅)

1. **test/widget_test.dart** - AuthViewModel (13 tests)
   - Password visibility toggles
   - Form field management
   - Step navigation logic
   - User role management
   - Category selection
   - Text controller management

2. **test/view_models/dashboard_view_model_test.dart** - DashboardViewModel (5 tests)
   - Admin/Staff/Parent menu lists
   - Nursery state management

3. **test/view_models/setting_view_model_test.dart** - SettingViewModel (6 tests)
   - Permission toggles for attendance, gallery, kids, inventory
   - Settings state management

4. **test/view_models/kids_view_model_test.dart** - KidContactViewModel (17 tests)
   - Parent contacts management
   - Emergency contacts management
   - Medicines tracking
   - Allergies tracking
   - Authorization toggles

5. **test/view_models/quick_action_view_model_test.dart** - QuickActionViewModel (14 tests)
   - Title selection management
   - Independent title tracking
   - Edge cases (special chars, unicode, long strings)

6. **test/view_models/signup_view_model_test.dart** - SignupViewModel (25 tests)
   - Account type management
   - Gender selection
   - OTP management
   - Nursery feature selection
   - Password visibility toggles
   - Text controller management
   - Loading states
   - Clear/reset functionality
   - City and country selection

## Why Coverage is Low

The project has ~103 files but only 3 have tests. To reach 70% coverage, you need to test:

**Priority Files to Test:**
- All ViewModels (6 files)
- Service layer files
- Utility functions
- Models with business logic

**Files to SKIP testing:**
- UI/View files (difficult to test, low value)
- Generated files (*.g.dart, *.freezed.dart)
- Main.dart
- Constants and assets files

## Improving Coverage

### Strategy 1: All ViewModels Tested ✅
All ViewModels now have comprehensive test coverage:
```
lib/view_models/
├── auth_view_model/auth_view_model.dart ✅ (13 tests)
├── auth_view_model/sign_up_view_model.dart ✅ (25 tests)
├── dashboard_view_model/dashboard_view_model.dart ✅ (5 tests)
├── dashboard_view_model/quick_action_view_model.dart ✅ (14 tests)
├── setting_view_model/setting_view_model.dart ✅ (6 tests)
└── kids_view_model/kids_view_model.dart ✅ (17 tests)
```

### Next Priority: Services & Utilities
To further improve coverage, focus on:
- **Validation Services** - Easy to test, pure functions
- **Utility Functions** - String helpers, formatters, etc.
- **Models** - Data models with business logic
