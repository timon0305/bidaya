class Validators {
  static String? requiredField(String? value, {String fieldName = "필드"}) {
    if (value == null || value.trim().isEmpty) {
      return "$fieldName 입력해주세요"; // Please enter field
    }
    return null;
  }

  static String? password(String? value) {
    if (value == null || value.isEmpty) {
      return "Password is required";
    }

    if (value.length < 8) {
      return "Password must be at least 8 characters";
    }

    if (!RegExp(r'[A-Z]').hasMatch(value)) {
      return "Password must contain at least one uppercase letter";
    }

    if (!RegExp(r'[a-z]').hasMatch(value)) {
      return "Password must contain at least one lowercase letter";
    }

    if (!RegExp(r'[0-9]').hasMatch(value)) {
      return "Password must contain at least one number";
    }

    if (!RegExp(r'[!@#\$&*~]').hasMatch(value)) {
      return "Password must contain at least one special character (!@#\$&*~)";
    }

    return null;
  }

  static String? email(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "이메일을 입력해주세요";
    }
    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+$');
    if (!emailRegex.hasMatch(value)) {
      return "유효한 이메일을 입력해주세요";
    }
    return null;
  }

  static String? phone(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "휴대폰 번호를 입력해주세요";
    }

    return null;
  }

  static String? url(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "링크를 입력해주세요";
    }
    final urlRegex = RegExp(
      r'^(http|https):\/\/([\w\-]+\.)+[\w\-]+(\/[\w\- ./?%&=]*)?$',
    );
    if (!urlRegex.hasMatch(value)) {
      return "유효한 링크를 입력해주세요";
    }
    return null;
  }
}
