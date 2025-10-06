import 'package:flutter_test/flutter_test.dart';
import 'package:quizzo/service/validation_service/validation_service.dart';

void main() {
  group('AuthValidationService', () {
    group('Email Validation', () {
      test('should return true for valid emails', () {
        expect(AuthValidationService.isValidEmail('test@example.com'), true);
        expect(AuthValidationService.isValidEmail('user.name@domain.co'), true);
        expect(
          AuthValidationService.isValidEmail('user+tag@example.com'),
          true,
        );
        expect(
          AuthValidationService.isValidEmail('first.last@sub.domain.com'),
          true,
        );
      });

      test('should return false for invalid emails', () {
        expect(AuthValidationService.isValidEmail(''), false);
        expect(AuthValidationService.isValidEmail('invalid'), false);
        expect(AuthValidationService.isValidEmail('@example.com'), false);
        expect(AuthValidationService.isValidEmail('user@'), false);
        expect(AuthValidationService.isValidEmail('user@domain'), false);
        expect(AuthValidationService.isValidEmail('user domain@test.com'), false);
      });
    });

    group('Phone Validation', () {
      test('should return true for valid phone numbers', () {
        expect(AuthValidationService.isValidPhone('1234567'), true);
        expect(AuthValidationService.isValidPhone('01234567890'), true);
        expect(AuthValidationService.isValidPhone('+201234567890'), true);
        expect(AuthValidationService.isValidPhone('123456789012345'), true);
      });

      test('should return false for invalid phone numbers', () {
        expect(AuthValidationService.isValidPhone(''), false);
        expect(AuthValidationService.isValidPhone('123456'), false);
        expect(AuthValidationService.isValidPhone('1234567890123456'), false);
        expect(AuthValidationService.isValidPhone('abc1234567'), false);
        expect(AuthValidationService.isValidPhone('123 456 7890'), false);
      });
    });

    group('OTP Validation', () {
      test('should return true for valid OTP', () {
        expect(AuthValidationService.isValidOtp('123456'), true);
        expect(AuthValidationService.isValidOtp('000000'), true);
        expect(AuthValidationService.isValidOtp('999999'), true);
      });

      test('should return false for invalid OTP', () {
        expect(AuthValidationService.isValidOtp(''), false);
        expect(AuthValidationService.isValidOtp('12345'), false);
        expect(AuthValidationService.isValidOtp('1234567'), false);
        expect(AuthValidationService.isValidOtp('12345a'), false);
        expect(AuthValidationService.isValidOtp('abcdef'), false);
      });

      test('should throw exception for null OTP', () {
        expect(
          () => AuthValidationService.validateOtp(null),
          throwsA(isA<ValidationException>()),
        );
      });

      test('should throw exception for empty OTP', () {
        expect(
          () => AuthValidationService.validateOtp(''),
          throwsA(isA<ValidationException>()),
        );
      });

      test('should throw exception for invalid OTP length', () {
        expect(
          () => AuthValidationService.validateOtp('12345'),
          throwsA(isA<ValidationException>()),
        );
        expect(
          () => AuthValidationService.validateOtp('1234567'),
          throwsA(isA<ValidationException>()),
        );
      });

      test('should throw exception for non-numeric OTP', () {
        expect(
          () => AuthValidationService.validateOtp('12345a'),
          throwsA(isA<ValidationException>()),
        );
      });
    });

    group('Recovery Key Validation', () {
      test('should return true for valid recovery keys', () {
        expect(
          AuthValidationService.isValidRecoveryKey('abcd-1234-efab-5678'),
          true,
        );
        expect(
          AuthValidationService.isValidRecoveryKey('ABCD-1234-EFAB-5678'),
          true,
        );
        expect(
          AuthValidationService.isValidRecoveryKey('0000-0000-0000-0000'),
          true,
        );
      });

      test('should return false for invalid recovery keys', () {
        expect(AuthValidationService.isValidRecoveryKey(''), false);
        expect(
          AuthValidationService.isValidRecoveryKey('abcd-1234-efab'),
          false,
        );
        expect(
          AuthValidationService.isValidRecoveryKey('abcd-1234-efab-567'),
          false,
        );
        expect(
          AuthValidationService.isValidRecoveryKey('abcd12345678efab'),
          false,
        );
        expect(
          AuthValidationService.isValidRecoveryKey('abcd-1234-efab-5678g'),
          false,
        );
      });
    });

    group('Phone Type Check', () {
      test('should return true for phone-like strings', () {
        expect(AuthValidationService.isPhone('1234567890'), true);
        expect(AuthValidationService.isPhone('+1234567890'), true);
        expect(AuthValidationService.isPhone(''), true);
        expect(AuthValidationService.isPhone('0'), true);
      });

      test('should return false for non-phone strings', () {
        expect(AuthValidationService.isPhone('abc'), false);
        expect(AuthValidationService.isPhone('test@email.com'), false);
        expect(AuthValidationService.isPhone('123abc'), false);
      });
    });

    group('Password Validation', () {
      test('should not throw for valid passwords', () {
        expect(
          () => AuthValidationService.validatePassword('Password1!'),
          returnsNormally,
        );
        expect(
          () => AuthValidationService.validatePassword('MyP@ssw0rd'),
          returnsNormally,
        );
        expect(
          () => AuthValidationService.validatePassword('Abcd123!@#'),
          returnsNormally,
        );
      });

      test('should throw exception for null password', () {
        expect(
          () => AuthValidationService.validatePassword(null),
          throwsA(isA<ValidationException>()),
        );
      });

      test('should throw exception for empty password', () {
        expect(
          () => AuthValidationService.validatePassword(''),
          throwsA(isA<ValidationException>()),
        );
      });

      test('should throw exception for password without uppercase', () {
        expect(
          () => AuthValidationService.validatePassword('password1!'),
          throwsA(isA<ValidationException>()),
        );
      });

      test('should throw exception for password without lowercase', () {
        expect(
          () => AuthValidationService.validatePassword('PASSWORD1!'),
          throwsA(isA<ValidationException>()),
        );
      });

      test('should throw exception for password without digit', () {
        expect(
          () => AuthValidationService.validatePassword('Password!'),
          throwsA(isA<ValidationException>()),
        );
      });

      test('should throw exception for password without special char', () {
        expect(
          () => AuthValidationService.validatePassword('Password1'),
          throwsA(isA<ValidationException>()),
        );
      });

      test('should throw exception for short password', () {
        expect(
          () => AuthValidationService.validatePassword('Pass1!'),
          throwsA(isA<ValidationException>()),
        );
      });
    });

    group('Password Match Validation', () {
      test('should not throw when passwords match', () {
        expect(
          () => AuthValidationService.validatePasswordMatch(
            'Password1!',
            'Password1!',
          ),
          returnsNormally,
        );
      });

      test('should throw exception when passwords do not match', () {
        expect(
          () => AuthValidationService.validatePasswordMatch(
            'Password1!',
            'Password2!',
          ),
          throwsA(isA<ValidationException>()),
        );
      });
    });

    group('Password Validation Errors', () {
      test('should return empty string for valid password', () {
        final errors =
            AuthValidationService.getPasswordValidationErrors('Password1!');
        expect(errors, isEmpty);
      });

      test('should return error for short password', () {
        final errors =
            AuthValidationService.getPasswordValidationErrors('Pass1!');
        expect(errors, contains('Must be at least 8 characters long'));
      });

      test('should return error for password without lowercase', () {
        final errors =
            AuthValidationService.getPasswordValidationErrors('PASSWORD1!');
        expect(errors, contains('Must contain at least one lowercase letter'));
      });

      test('should return error for password without uppercase', () {
        final errors =
            AuthValidationService.getPasswordValidationErrors('password1!');
        expect(errors, contains('Must contain at least one uppercase letter'));
      });

      test('should return error for password without digit', () {
        final errors =
            AuthValidationService.getPasswordValidationErrors('Password!');
        expect(errors, contains('Must contain at least one digit'));
      });

      test('should return error for password without special character', () {
        final errors =
            AuthValidationService.getPasswordValidationErrors('Password1');
        expect(
          errors,
          contains('Must contain at least one special character'),
        );
      });

      test('should return multiple errors for invalid password', () {
        final errors = AuthValidationService.getPasswordValidationErrors('pwd');
        expect(errors, contains('Must be at least 8 characters long'));
        expect(errors, contains('Must contain at least one uppercase letter'));
        expect(errors, contains('Must contain at least one digit'));
        expect(
          errors,
          contains('Must contain at least one special character'),
        );
      });
    });

    group('Name Validation', () {
      test('should not throw for valid names', () {
        expect(
          () => AuthValidationService.validateName('John'),
          returnsNormally,
        );
        expect(
          () => AuthValidationService.validateName('John Doe'),
          returnsNormally,
        );
        expect(
          () => AuthValidationService.validateName('J D'),
          returnsNormally,
        );
      });

      test('should throw exception for null name', () {
        expect(
          () => AuthValidationService.validateName(null),
          throwsA(isA<ValidationException>()),
        );
      });

      test('should throw exception for empty name', () {
        expect(
          () => AuthValidationService.validateName(''),
          throwsA(isA<ValidationException>()),
        );
        expect(
          () => AuthValidationService.validateName('   '),
          throwsA(isA<ValidationException>()),
        );
      });

      test('should throw exception for name too short', () {
        expect(
          () => AuthValidationService.validateName('J'),
          throwsA(isA<ValidationException>()),
        );
      });
    });

    group('Phone Number Validation', () {
      test('should not throw for valid phone numbers', () {
        expect(
          () => AuthValidationService.validatePhone('01234567890'),
          returnsNormally,
        );
        expect(
          () => AuthValidationService.validatePhone('+201234567890'),
          returnsNormally,
        );
      });

      test('should throw exception for null phone', () {
        expect(
          () => AuthValidationService.validatePhone(null),
          throwsA(isA<ValidationException>()),
        );
      });

      test('should throw exception for empty phone', () {
        expect(
          () => AuthValidationService.validatePhone(''),
          throwsA(isA<ValidationException>()),
        );
        expect(
          () => AuthValidationService.validatePhone('   '),
          throwsA(isA<ValidationException>()),
        );
      });

      test('should throw exception for invalid phone format', () {
        expect(
          () => AuthValidationService.validatePhone('abc123'),
          throwsA(isA<ValidationException>()),
        );
        expect(
          () => AuthValidationService.validatePhone('123'),
          throwsA(isA<ValidationException>()),
        );
      });
    });

    group('Address Validation', () {
      test('should not throw for valid addresses', () {
        expect(
          () => AuthValidationService.validateAddress('123 Main St'),
          returnsNormally,
        );
        expect(
          () => AuthValidationService.validateAddress('Cairo, Egypt'),
          returnsNormally,
        );
      });

      test('should throw exception for null address', () {
        expect(
          () => AuthValidationService.validateAddress(null),
          throwsA(isA<ValidationException>()),
        );
      });

      test('should throw exception for empty address', () {
        expect(
          () => AuthValidationService.validateAddress(''),
          throwsA(isA<ValidationException>()),
        );
        expect(
          () => AuthValidationService.validateAddress('   '),
          throwsA(isA<ValidationException>()),
        );
      });

      test('should throw exception for address too short', () {
        expect(
          () => AuthValidationService.validateAddress('1234'),
          throwsA(isA<ValidationException>()),
        );
      });
    });

    group('Date of Birth Validation', () {
      test('should not throw for valid DOB', () {
        expect(
          () => AuthValidationService.validateDob('2000-01-01'),
          returnsNormally,
        );
        expect(
          () => AuthValidationService.validateDob('01/01/2000'),
          returnsNormally,
        );
      });

      test('should throw exception for null DOB', () {
        expect(
          () => AuthValidationService.validateDob(null),
          throwsA(isA<ValidationException>()),
        );
      });

      test('should throw exception for empty DOB', () {
        expect(
          () => AuthValidationService.validateDob(''),
          throwsA(isA<ValidationException>()),
        );
        expect(
          () => AuthValidationService.validateDob('   '),
          throwsA(isA<ValidationException>()),
        );
      });
    });

    group('Gender Validation', () {
      test('should not throw for valid gender', () {
        expect(
          () => AuthValidationService.validateGender('Male'),
          returnsNormally,
        );
        expect(
          () => AuthValidationService.validateGender('Female'),
          returnsNormally,
        );
      });

      test('should throw exception for null gender', () {
        expect(
          () => AuthValidationService.validateGender(null),
          throwsA(isA<ValidationException>()),
        );
      });

      test('should throw exception for empty gender', () {
        expect(
          () => AuthValidationService.validateGender(''),
          throwsA(isA<ValidationException>()),
        );
      });

      test('should throw exception for "Select" gender', () {
        expect(
          () => AuthValidationService.validateGender('Select'),
          throwsA(isA<ValidationException>()),
        );
      });
    });

    group('City Validation', () {
      test('should not throw for valid city', () {
        expect(
          () => AuthValidationService.validateCity('Cairo'),
          returnsNormally,
        );
        expect(
          () => AuthValidationService.validateCity('Alexandria'),
          returnsNormally,
        );
      });

      test('should throw exception for null city', () {
        expect(
          () => AuthValidationService.validateCity(null),
          throwsA(isA<ValidationException>()),
        );
      });

      test('should throw exception for empty city', () {
        expect(
          () => AuthValidationService.validateCity(''),
          throwsA(isA<ValidationException>()),
        );
      });

      test('should throw exception for "Select" city', () {
        expect(
          () => AuthValidationService.validateCity('Select'),
          throwsA(isA<ValidationException>()),
        );
      });
    });

    group('Country Validation', () {
      test('should not throw for valid country', () {
        expect(
          () => AuthValidationService.validateCountry('Egypt'),
          returnsNormally,
        );
        expect(
          () => AuthValidationService.validateCountry('UAE'),
          returnsNormally,
        );
      });

      test('should throw exception for null country', () {
        expect(
          () => AuthValidationService.validateCountry(null),
          throwsA(isA<ValidationException>()),
        );
      });

      test('should throw exception for empty country', () {
        expect(
          () => AuthValidationService.validateCountry(''),
          throwsA(isA<ValidationException>()),
        );
      });

      test('should throw exception for "Select" country', () {
        expect(
          () => AuthValidationService.validateCountry('Select'),
          throwsA(isA<ValidationException>()),
        );
      });
    });

    group('Identifier Validation', () {
      test('should not throw for valid email identifier', () {
        expect(
          () => AuthValidationService.validateIdentifier('test@example.com'),
          returnsNormally,
        );
      });

      test('should not throw for valid phone identifier', () {
        expect(
          () => AuthValidationService.validateIdentifier('01234567890'),
          returnsNormally,
        );
      });

      test('should throw exception for null identifier', () {
        expect(
          () => AuthValidationService.validateIdentifier(null),
          throwsA(isA<ValidationException>()),
        );
      });

      test('should throw exception for empty identifier', () {
        expect(
          () => AuthValidationService.validateIdentifier(''),
          throwsA(isA<ValidationException>()),
        );
        expect(
          () => AuthValidationService.validateIdentifier('   '),
          throwsA(isA<ValidationException>()),
        );
      });

      test('should throw exception for invalid identifier', () {
        expect(
          () => AuthValidationService.validateIdentifier('invalid'),
          throwsA(isA<ValidationException>()),
        );
        expect(
          () => AuthValidationService.validateIdentifier('123'),
          throwsA(isA<ValidationException>()),
        );
      });
    });

    group('ValidationException', () {
      test('should create exception with message', () {
        final exception = ValidationException('Test error');
        expect(exception.message, 'Test error');
      });

      test('should convert to string', () {
        final exception = ValidationException('Test error');
        expect(exception.toString(), 'Test error');
      });
    });
  });
}
