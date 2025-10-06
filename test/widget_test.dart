import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:quizzo/view_models/auth_view_model/auth_view_model.dart';

void main() {
  group('AuthViewModel Tests', () {
    late AuthViewModel authViewModel;

    setUp(() {
      authViewModel = AuthViewModel();
    });

    tearDown(() {
      authViewModel.dispose();
    });

    test('should initialize with default values', () {
      expect(authViewModel.accountType, isEmpty);
      expect(authViewModel.currentStep, 0);
      expect(authViewModel.selectedCategories, isEmpty);
      expect(authViewModel.showPassword, true);
      expect(authViewModel.showConfirmPassword, true);
      expect(authViewModel.isRememberMe, true);
    });

    test('should toggle password visibility', () {
      expect(authViewModel.showPassword, true);
      authViewModel.showHidePasswordVisibility();
      expect(authViewModel.showPassword, false);
      authViewModel.showHidePasswordVisibility();
      expect(authViewModel.showPassword, true);
    });

    test('should toggle confirm password visibility', () {
      expect(authViewModel.showConfirmPassword, true);
      authViewModel.showHideConfirmPasswordVisibility();
      expect(authViewModel.showConfirmPassword, false);
      authViewModel.showHideConfirmPasswordVisibility();
      expect(authViewModel.showConfirmPassword, true);
    });

    test('should toggle login password visibility', () {
      expect(authViewModel.showLoginPassword, true);
      authViewModel.showHideLoginPasswordVisibility();
      expect(authViewModel.showLoginPassword, false);
      authViewModel.showHideLoginPasswordVisibility();
      expect(authViewModel.showLoginPassword, true);
    });

    test('should update remember me value', () {
      expect(authViewModel.isRememberMe, true);
      authViewModel.isRememberMeValue(false);
      expect(authViewModel.isRememberMe, false);
      authViewModel.isRememberMeValue(true);
      expect(authViewModel.isRememberMe, true);
    });

    test('should change gender', () {
      expect(authViewModel.selectedGender, isNull);
      authViewModel.changeGender('Male');
      expect(authViewModel.selectedGender, 'Male');
      authViewModel.changeGender('Female');
      expect(authViewModel.selectedGender, 'Female');
    });

    test('should toggle category selection', () {
      expect(authViewModel.selectedCategories.isEmpty, true);

      authViewModel.onToggleChip('Swimming Pools', true);
      expect(authViewModel.selectedCategories.contains('Swimming Pools'), true);
      expect(authViewModel.selectedCategories.length, 1);

      authViewModel.onToggleChip('Meals', true);
      expect(authViewModel.selectedCategories.length, 2);
      expect(authViewModel.selectedCategories.contains('Meals'), true);

      authViewModel.onToggleChip('Swimming Pools', false);
      expect(authViewModel.selectedCategories.contains('Swimming Pools'), false);
      expect(authViewModel.selectedCategories.length, 1);
    });

    test('should have correct nursery features list', () {
      expect(authViewModel.nurseryFeatures.length, 13);
      expect(authViewModel.nurseryFeatures.contains('Meals'), true);
      expect(authViewModel.nurseryFeatures.contains('Swimming Pools'), true);
      expect(authViewModel.nurseryFeatures.contains('Montessori'), true);
    });

    test('should update account type', () {
      expect(authViewModel.accountType, isEmpty);

      authViewModel.accountType = 'Nursery Owner';
      expect(authViewModel.accountType, 'Nursery Owner');

      authViewModel.accountType = 'Parent';
      expect(authViewModel.accountType, 'Parent');

      authViewModel.accountType = 'Teacher';
      expect(authViewModel.accountType, 'Teacher');
    });

    test('should update current step', () {
      expect(authViewModel.currentStep, 0);

      authViewModel.currentStep = 1;
      expect(authViewModel.currentStep, 1);

      authViewModel.currentStep = 3;
      expect(authViewModel.currentStep, 3);
    });

    test('should update user role without navigation', () {
      expect(authViewModel.userRole, 'Admin');

      authViewModel.userRole = 'Teacher';
      expect(authViewModel.userRole, 'Teacher');

      authViewModel.userRole = 'Parent';
      expect(authViewModel.userRole, 'Parent');
    });

    test('text controllers should be empty initially', () {
      expect(authViewModel.nameController.text, isEmpty);
      expect(authViewModel.emailController.text, isEmpty);
      expect(authViewModel.phoneController.text, isEmpty);
      expect(authViewModel.addressController.text, isEmpty);
      expect(authViewModel.dobController.text, isEmpty);
      expect(authViewModel.passwordTextController.text, isEmpty);
      expect(authViewModel.confirmPasswordTextController.text, isEmpty);
      expect(authViewModel.loginPhoneTextController.text, isEmpty);
      expect(authViewModel.loginPasswordTextController.text, isEmpty);
    });

    test('should update text controller values', () {
      authViewModel.nameController.text = 'John Doe';
      expect(authViewModel.nameController.text, 'John Doe');

      authViewModel.emailController.text = 'john@example.com';
      expect(authViewModel.emailController.text, 'john@example.com');

      authViewModel.phoneController.text = '01234567890';
      expect(authViewModel.phoneController.text, '01234567890');
    });
  });
}
