enum TextFieldValidationType {
  email,
  phone,
  password,
  confirmPassword,
  none,
  loginPassword,
}

class TextFieldValidator {
  static String? validateNormal(TextFieldValidationType type, String value) {
    final input = value.trim();

    switch (type) {
      case TextFieldValidationType.email:
        if (input.isEmpty) return "Email can't be empty";
        final regex = RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$');
        if (!regex.hasMatch(input)) return "Enter a valid email address";
        return null;

      case TextFieldValidationType.phone:
        if (input.isEmpty) return "Phone number can't be empty";
        final regex = RegExp(r'^[0-9]{8,15}$');
        if (!regex.hasMatch(input)) return "Enter a valid phone number";
        return null;

      case TextFieldValidationType.password:
        final regex = RegExp(
          r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[!@#\$%^&*(),.?":{}|<>])(?!.*\s).{8,}$',
        );
        if (input.isEmpty) return "Password can't be empty";
        if (!regex.hasMatch(input)) {
          return "Password must be 8+ chars with upper, lower, number, symbol & no spaces";
        }
        return null;

      case TextFieldValidationType.loginPassword:
        if (input.isEmpty) return "Password can't be empty";
        if (input.length < 8) return "Password must be at least 8 characters";
        return null;

      case TextFieldValidationType.none:
        return null;
      default:
        return null;
    }
  }

  static String? twoPasswordValidator(String value, String value2) {
    final input = value.trim();
    final input2 = value2.trim();
    if (input2.isEmpty) {
      return "Confirm password can't be empty";
    }
    if (input != input2) {
      return "Passwords do not match";
    }
    return null;
  }
}
