import 'package:flutter_test/flutter_test.dart';
import 'package:quizzo/utils/app_validators.dart';

void main() {
  group('Validators', () {
    group('Required Field Validation', () {
      test('should return null for valid non-empty string', () {
        expect(Validators.requiredField('test'), isNull);
        expect(Validators.requiredField('  valid  '), isNull);
        expect(Validators.requiredField('123'), isNull);
      });

      test('should return error for null value', () {
        final result = Validators.requiredField(null);
        expect(result, isNotNull);
        expect(result, contains('입력해주세요'));
      });

      test('should return error for empty string', () {
        final result = Validators.requiredField('');
        expect(result, isNotNull);
        expect(result, contains('입력해주세요'));
      });

      test('should return error for whitespace-only string', () {
        final result = Validators.requiredField('   ');
        expect(result, isNotNull);
        expect(result, contains('입력해주세요'));
      });

      test('should use custom field name in error message', () {
        final result = Validators.requiredField(null, fieldName: 'Email');
        expect(result, contains('Email'));
      });
    });

    group('Password Validation', () {
      test('should return null for valid password', () {
        expect(Validators.password('Password1!'), isNull);
        expect(Validators.password('MyP@ssw0rd'), isNull);
        expect(Validators.password('Abcd1234!'), isNull);
        expect(Validators.password('Test@123'), isNull);
      });

      test('should return error for null password', () {
        final result = Validators.password(null);
        expect(result, 'Password is required');
      });

      test('should return error for empty password', () {
        final result = Validators.password('');
        expect(result, 'Password is required');
      });

      test('should return error for password shorter than 8 characters', () {
        final result = Validators.password('Pass1!');
        expect(result, contains('at least 8 characters'));
      });

      test('should return error for password without uppercase letter', () {
        final result = Validators.password('password1!');
        expect(result, contains('at least one uppercase letter'));
      });

      test('should return error for password without lowercase letter', () {
        final result = Validators.password('PASSWORD1!');
        expect(result, contains('at least one lowercase letter'));
      });

      test('should return error for password without number', () {
        final result = Validators.password('Password!');
        expect(result, contains('at least one number'));
      });

      test('should return error for password without special character', () {
        final result = Validators.password('Password1');
        expect(result, contains('at least one special character'));
      });

      test('should accept specific special characters', () {
        expect(Validators.password('Password1!'), isNull);
        expect(Validators.password('Password1@'), isNull);
        expect(Validators.password('Password1#'), isNull);
        expect(Validators.password('Password1\$'), isNull);
        expect(Validators.password('Password1&'), isNull);
        expect(Validators.password('Password1*'), isNull);
        expect(Validators.password('Password1~'), isNull);
      });
    });

    group('Email Validation', () {
      test('should return null for valid emails', () {
        expect(Validators.email('test@example.com'), isNull);
        expect(Validators.email('user.name@domain.co'), isNull);
        expect(Validators.email('user+tag@example.com'), isNull);
        expect(Validators.email('email@sub.domain.com'), isNull);
      });

      test('should return error for null email', () {
        final result = Validators.email(null);
        expect(result, contains('이메일을 입력해주세요'));
      });

      test('should return error for empty email', () {
        final result = Validators.email('');
        expect(result, contains('이메일을 입력해주세요'));
      });

      test('should return error for whitespace-only email', () {
        final result = Validators.email('   ');
        expect(result, contains('이메일을 입력해주세요'));
      });

      test('should return error for invalid email format', () {
        expect(
          Validators.email('invalid'),
          contains('유효한 이메일을 입력해주세요'),
        );
        expect(
          Validators.email('@example.com'),
          contains('유효한 이메일을 입력해주세요'),
        );
        expect(
          Validators.email('user@'),
          contains('유효한 이메일을 입력해주세요'),
        );
        expect(
          Validators.email('user@domain'),
          contains('유효한 이메일을 입력해주세요'),
        );
      });
    });

    group('Phone Validation', () {
      test('should return null for non-empty phone', () {
        expect(Validators.phone('1234567890'), isNull);
        expect(Validators.phone('+201234567890'), isNull);
        expect(Validators.phone('  12345  '), isNull);
      });

      test('should return error for null phone', () {
        final result = Validators.phone(null);
        expect(result, contains('휴대폰 번호를 입력해주세요'));
      });

      test('should return error for empty phone', () {
        final result = Validators.phone('');
        expect(result, contains('휴대폰 번호를 입력해주세요'));
      });

      test('should return error for whitespace-only phone', () {
        final result = Validators.phone('   ');
        expect(result, contains('휴대폰 번호를 입력해주세요'));
      });
    });

    group('URL Validation', () {
      test('should return null for valid URLs', () {
        expect(Validators.url('http://example.com'), isNull);
        expect(Validators.url('https://example.com'), isNull);
        expect(Validators.url('https://www.example.com'), isNull);
        expect(Validators.url('https://example.com/path'), isNull);
        expect(Validators.url('https://example.com/path?query=value'), isNull);
      });

      test('should return error for null URL', () {
        final result = Validators.url(null);
        expect(result, contains('링크를 입력해주세요'));
      });

      test('should return error for empty URL', () {
        final result = Validators.url('');
        expect(result, contains('링크를 입력해주세요'));
      });

      test('should return error for whitespace-only URL', () {
        final result = Validators.url('   ');
        expect(result, contains('링크를 입력해주세요'));
      });

      test('should return error for invalid URL format', () {
        expect(
          Validators.url('example.com'),
          contains('유효한 링크를 입력해주세요'),
        );
        expect(
          Validators.url('ftp://example.com'),
          contains('유효한 링크를 입력해주세요'),
        );
        expect(
          Validators.url('https://'),
          contains('유효한 링크를 입력해주세요'),
        );
        expect(
          Validators.url('not a url'),
          contains('유효한 링크를 입력해주세요'),
        );
      });

      test('should accept URLs with simple paths', () {
        expect(
          Validators.url('https://example.com/path'),
          isNull,
        );
        expect(
          Validators.url('http://test.com/page'),
          isNull,
        );
      });
    });
  });
}
