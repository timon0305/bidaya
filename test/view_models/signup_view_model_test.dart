import 'package:flutter_test/flutter_test.dart';
import 'package:quizzo/view_models/auth_view_model/sign_up_view_model.dart';

void main() {
  group('SignupViewModel Tests', () {
    late SignupViewModel viewModel;

    setUp(() {
      viewModel = SignupViewModel();
    });

    tearDown(() {
      viewModel.dispose();
    });

    group('Initialization', () {
      test('should initialize with default values', () {
        expect(viewModel.currentStep, 0);
        expect(viewModel.accountType, isEmpty);
        expect(viewModel.otpControllers, isEmpty);
        expect(viewModel.selectedGender, isNull);
        expect(viewModel.selectedCategories, isEmpty);
        expect(viewModel.showPassword, true);
        expect(viewModel.showConfirmPassword, true);
        expect(viewModel.isLoading, false);
        expect(viewModel.isNurseryLoading, false);
        expect(viewModel.isCheckPhone, false);
        expect(viewModel.isCreatingUser, false);
        expect(viewModel.nurseryLogo, isNull);
      });

      test('should initialize with correct nursery features', () {
        expect(viewModel.nurseryFeatures.length, 13);
        expect(viewModel.nurseryFeatures.contains('Meals'), true);
        expect(viewModel.nurseryFeatures.contains('Swimming Pools'), true);
        expect(viewModel.nurseryFeatures.contains('Montessori'), true);
        expect(viewModel.nurseryFeatures.contains('Art'), true);
      });

      test('text controllers should be empty initially', () {
        expect(viewModel.nameController.text, isEmpty);
        expect(viewModel.phoneController.text, isEmpty);
        expect(viewModel.dobController.text, isEmpty);
        expect(viewModel.nurseryNameController.text, isEmpty);
        expect(viewModel.nurseryEmailController.text, isEmpty);
        expect(viewModel.nurseryAddressController.text, isEmpty);
        expect(viewModel.nurseryPhoneController.text, isEmpty);
        expect(viewModel.passwordController.text, isEmpty);
        expect(viewModel.confirmPasswordController.text, isEmpty);
      });
    });

    group('Account Type Management', () {
      test('should update account type', () {
        expect(viewModel.accountType, isEmpty);

        viewModel.accountType = 'Parent';
        expect(viewModel.accountType, 'Parent');

        viewModel.accountType = 'Teacher';
        expect(viewModel.accountType, 'Teacher');

        viewModel.accountType = 'Nursery Owner';
        expect(viewModel.accountType, 'Nursery Owner');
      });

      test('should update account type and advance step', () {
        expect(viewModel.accountType, isEmpty);
        expect(viewModel.currentStep, 0);

        viewModel.accountType = 'Parent';
        expect(viewModel.accountType, 'Parent');
      });
    });

    group('Gender Management', () {
      test('should change gender', () {
        expect(viewModel.selectedGender, isNull);

        viewModel.changeGender('Male');
        expect(viewModel.selectedGender, 'Male');

        viewModel.changeGender('Female');
        expect(viewModel.selectedGender, 'Female');
      });
    });

    group('OTP Management', () {
      test('should update OTP', () {
        expect(viewModel.otpControllers, isEmpty);

        viewModel.updateOtp('1234');
        expect(viewModel.otpControllers, '1234');

        viewModel.updateOtp('5678');
        expect(viewModel.otpControllers, '5678');
      });
    });

    group('Nursery Feature Selection', () {
      test('should add nursery feature when selected', () {
        expect(viewModel.selectedCategories.isEmpty, true);

        viewModel.selectNurseryFeature('Meals', true);
        expect(viewModel.selectedCategories.contains('Meals'), true);
        expect(viewModel.selectedCategories.length, 1);
      });

      test('should remove nursery feature when deselected', () {
        viewModel.selectNurseryFeature('Meals', true);
        expect(viewModel.selectedCategories.contains('Meals'), true);

        viewModel.selectNurseryFeature('Meals', false);
        expect(viewModel.selectedCategories.contains('Meals'), false);
        expect(viewModel.selectedCategories.isEmpty, true);
      });

      test('should handle multiple feature selections', () {
        viewModel.selectNurseryFeature('Meals', true);
        viewModel.selectNurseryFeature('Swimming Pools', true);
        viewModel.selectNurseryFeature('Montessori', true);

        expect(viewModel.selectedCategories.length, 3);
        expect(viewModel.selectedCategories.contains('Meals'), true);
        expect(viewModel.selectedCategories.contains('Swimming Pools'), true);
        expect(viewModel.selectedCategories.contains('Montessori'), true);
      });

      test('should toggle features on and off', () {
        viewModel.selectNurseryFeature('Meals', true);
        viewModel.selectNurseryFeature('Swimming Pools', true);

        expect(viewModel.selectedCategories.length, 2);

        viewModel.selectNurseryFeature('Meals', false);

        expect(viewModel.selectedCategories.length, 1);
        expect(viewModel.selectedCategories.contains('Swimming Pools'), true);
        expect(viewModel.selectedCategories.contains('Meals'), false);
      });
    });

    group('Password Visibility', () {
      test('should toggle password visibility', () {
        expect(viewModel.showPassword, true);

        viewModel.showHidePasswordVisibility();
        expect(viewModel.showPassword, false);

        viewModel.showHidePasswordVisibility();
        expect(viewModel.showPassword, true);
      });

      test('should toggle confirm password visibility', () {
        expect(viewModel.showConfirmPassword, true);

        viewModel.showHideConfirmPasswordVisibility();
        expect(viewModel.showConfirmPassword, false);

        viewModel.showHideConfirmPasswordVisibility();
        expect(viewModel.showConfirmPassword, true);
      });

      test('should toggle both passwords independently', () {
        expect(viewModel.showPassword, true);
        expect(viewModel.showConfirmPassword, true);

        viewModel.showHidePasswordVisibility();
        expect(viewModel.showPassword, false);
        expect(viewModel.showConfirmPassword, true);

        viewModel.showHideConfirmPasswordVisibility();
        expect(viewModel.showPassword, false);
        expect(viewModel.showConfirmPassword, false);
      });
    });

    group('Text Controllers', () {
      test('should update name controller', () {
        viewModel.nameController.text = 'John Doe';
        expect(viewModel.nameController.text, 'John Doe');
      });

      test('should update phone controller', () {
        viewModel.phoneController.text = '01234567890';
        expect(viewModel.phoneController.text, '01234567890');
      });

      test('should update dob controller', () {
        viewModel.dobController.text = '2000-01-01';
        expect(viewModel.dobController.text, '2000-01-01');
      });

      test('should update nursery controllers', () {
        viewModel.nurseryNameController.text = 'Test Nursery';
        expect(viewModel.nurseryNameController.text, 'Test Nursery');

        viewModel.nurseryEmailController.text = 'test@nursery.com';
        expect(viewModel.nurseryEmailController.text, 'test@nursery.com');

        viewModel.nurseryAddressController.text = '123 Street';
        expect(viewModel.nurseryAddressController.text, '123 Street');

        viewModel.nurseryPhoneController.text = '01234567890';
        expect(viewModel.nurseryPhoneController.text, '01234567890');
      });

      test('should update password controllers', () {
        viewModel.passwordController.text = 'Password123!';
        expect(viewModel.passwordController.text, 'Password123!');

        viewModel.confirmPasswordController.text = 'Password123!';
        expect(viewModel.confirmPasswordController.text, 'Password123!');
      });
    });

    group('Clear Function', () {
      test('should clear all controllers and reset state', () {
        // Set some values
        viewModel.nameController.text = 'John Doe';
        viewModel.phoneController.text = '01234567890';
        viewModel.dobController.text = '2000-01-01';
        viewModel.nurseryNameController.text = 'Test Nursery';
        viewModel.nurseryEmailController.text = 'test@nursery.com';
        viewModel.passwordController.text = 'Password123!';
        viewModel.accountType = 'Parent';
        viewModel.selectedGender = 'Male';
        viewModel.selectedCategories.add('Meals');
        viewModel.currentStep = 3;

        // Clear
        viewModel.clear();

        // Verify all cleared
        expect(viewModel.nameController.text, isEmpty);
        expect(viewModel.phoneController.text, isEmpty);
        expect(viewModel.dobController.text, isEmpty);
        expect(viewModel.nurseryNameController.text, isEmpty);
        expect(viewModel.nurseryEmailController.text, isEmpty);
        expect(viewModel.passwordController.text, isEmpty);
        expect(viewModel.accountType, isEmpty);
        expect(viewModel.selectedGender, isNull);
        expect(viewModel.selectedCategories.isEmpty, true);
        expect(viewModel.currentStep, 0);
        expect(viewModel.nurseryLogo, isNull);
      });

      test('should reset loading states when cleared', () {
        viewModel.isLoading = true;
        viewModel.isNurseryLoading = true;
        viewModel.isCheckPhone = true;

        viewModel.clear();

        expect(viewModel.isLoading, false);
        expect(viewModel.isNurseryLoading, false);
        expect(viewModel.isCheckPhone, false);
      });
    });

    group('Step Navigation', () {
      test('should update current step value', () {
        expect(viewModel.currentStep, 0);

        viewModel.currentStep = 1;
        expect(viewModel.currentStep, 1);

        viewModel.currentStep = 3;
        expect(viewModel.currentStep, 3);
      });
    });

    group('Loading States', () {
      test('should manage loading states', () {
        expect(viewModel.isLoading, false);
        viewModel.isLoading = true;
        expect(viewModel.isLoading, true);

        expect(viewModel.isNurseryLoading, false);
        viewModel.isNurseryLoading = true;
        expect(viewModel.isNurseryLoading, true);

        expect(viewModel.isCheckPhone, false);
        viewModel.isCheckPhone = true;
        expect(viewModel.isCheckPhone, true);

        expect(viewModel.isCreatingUser, false);
        viewModel.isCreatingUser = true;
        expect(viewModel.isCreatingUser, true);
      });
    });

    group('City and Country Selection', () {
      test('should update selected city', () {
        expect(viewModel.selectedCity, isNull);

        viewModel.selectedCity = 'Cairo';
        expect(viewModel.selectedCity, 'Cairo');

        viewModel.selectedCity = 'Alexandria';
        expect(viewModel.selectedCity, 'Alexandria');
      });

      test('should update selected country', () {
        expect(viewModel.selectedCountry, isNull);

        viewModel.selectedCountry = 'Egypt';
        expect(viewModel.selectedCountry, 'Egypt');

        viewModel.selectedCountry = 'UAE';
        expect(viewModel.selectedCountry, 'UAE');
      });
    });
  });
}
