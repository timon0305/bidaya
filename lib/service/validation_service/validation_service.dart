class AuthValidationService {
  static void validateIdentifier(String? identifier) {
    if (identifier == null || identifier.trim().isEmpty) {
      throw ValidationException(
        'Either a valid email or phone number must be provided',
      );
    }

    final identifierTrimmed = identifier.trim();

    if (!isValidEmail(identifierTrimmed) && !isValidPhone(identifierTrimmed)) {
      throw ValidationException(
        'Either a valid email or phone number must be provided',
      );
    }
  }

  static void validatePassword(String? password) {
    if (password == null || password.isEmpty) {
      throw ValidationException(
        'Password must contain at least one uppercase letter, one lowercase letter, one digit, and one special character',
      );
    }

    final passwordRegExp = RegExp(
      r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[!@#\$%\^&\*\(\)\-_=+\[\]\{\}\|:;,.\/\?])[A-Za-z\d!@#\$%\^&\*\(\)\-_=+\[\]\{\}\|:;,.\/\?]{8,}$',
    );

    if (!passwordRegExp.hasMatch(password)) {
      throw ValidationException(
        'Password must contain at least one uppercase letter, one lowercase letter, one digit, and one special character',
      );
    }
  }

  static void validatePasswordMatch(String password, String confirmPassword) {
    if (password != confirmPassword) {
      throw ValidationException("Passwords do not match");
    }
  }

  static bool isValidEmail(String email) {
    final emailRegExp = RegExp(
      r'^[A-Za-z0-9+_.-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,6}$',
    );
    return emailRegExp.hasMatch(email);
  }

  static bool isValidPhone(String phoneNumber) {
    final phoneRegExp = RegExp(r'^\+?[0-9]{7,15}$');
    return phoneRegExp.hasMatch(phoneNumber);
  }

  static bool isValidRecoveryKey(String recoveryKey) {
    final recoveryKeyRegex = RegExp(r'^([a-fA-F0-9]{4}-){3}[a-fA-F0-9]{4}$');
    return recoveryKeyRegex.hasMatch(recoveryKey);
  }

  static bool isValidOtp(String otp) {
    final otpRegex = RegExp(r'^[0-9]{6}$');
    return otpRegex.hasMatch(otp);
  }

  /// To decide which field type to use (phone/email).
  static bool isPhone(String phone) {
    final phoneRegExp = RegExp(r'^\+?[0-9]*$');
    return phoneRegExp.hasMatch(phone);
  }

  static String getPasswordValidationErrors(String password) {
    final errors = <String>[];

    if (password.length < 8) {
      errors.add("Must be at least 8 characters long");
    }

    if (!RegExp(r'[a-z]').hasMatch(password)) {
      errors.add("Must contain at least one lowercase letter");
    }

    if (!RegExp(r'[A-Z]').hasMatch(password)) {
      errors.add("Must contain at least one uppercase letter");
    }

    if (!RegExp(r'\d').hasMatch(password)) {
      errors.add("Must contain at least one digit");
    }

    if (!RegExp(
      r'[!@#\$%\^&\*\(\)\-_=+\[\]\{\}\|:;,.\/\?]',
    ).hasMatch(password)) {
      errors.add("Must contain at least one special character");
    }

    if (!RegExp(
      r'^[A-Za-z\d!@#\$%\^&\*\(\)\-_=+\[\]\{\}\|:;,.\/\?]+$',
    ).hasMatch(password)) {
      errors.add("Contains invalid characters");
    }

    return errors.join('\n');
  }

  static void validateName(String? name) {
    if (name == null || name.trim().isEmpty) {
      throw ValidationException("Full name is required");
    }
    if (name.trim().length < 2) {
      throw ValidationException("Name must be at least 2 characters long");
    }
  }

  static void validatePhone(String? phone) {
    if (phone == null || phone.trim().isEmpty) {
      throw ValidationException("Phone number is required");
    }
    if (!isValidPhone(phone)) {
      throw ValidationException("Enter a valid phone number");
    }
  }

  static void validateAddress(String? address) {
    if (address == null || address.trim().isEmpty) {
      throw ValidationException("Please enter your address");
    }
    if (address.length < 5) {
      throw ValidationException("Address must be at least 5 characters long");
    }
  }

  static void validateDob(String? dob) {
    if (dob == null || dob.trim().isEmpty) {
      throw ValidationException("Date of Birth is required");
    }
  }

  static void validateGender(String? gender) {
    if (gender == null || gender.isEmpty || gender == "Select") {
      throw ValidationException(
        "Please select a valid gender (Male or Female)",
      );
    }
  }

  static void validateCity(String? city) {
    if (city == null || city.isEmpty || city == "Select") {
      throw ValidationException("Please select a valid city");
    }
  }

  static void validateCountry(String? country) {
    if (country == null || country.isEmpty || country == "Select") {
      throw ValidationException("Please select a valid country");
    }
  }

  static void validateOtp(String? otp) {
    if (otp == null || otp.isEmpty) {
      throw ValidationException("Please enter OTP");
    }
    if (otp.length != 6 || !RegExp(r'^[0-9]+$').hasMatch(otp)) {
      throw ValidationException("OTP must be exactly 6 digits");
    }
  }
}

class ValidationException implements Exception {
  final String message;
  ValidationException(this.message);

  @override
  String toString() => message;
}
