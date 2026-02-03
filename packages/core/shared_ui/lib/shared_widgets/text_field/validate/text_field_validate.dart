enum TextFieldValidationType {
  email,
  phone,
  password,
  confirmPassword,
  none,
  loginPassword,
  year,
  version,
  description,
  car,
  model,
  bodyType,
  fuelType,
  engineCylinderNumber,
  engineCapacity,
  gearboxType,
  km,
  paintColor,
  paintCondition,
  price,
  location,
  name,
  otp,
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
        if (input.length < 10) return "Enter a valid phone number";
        if (input[0] == '0' && input.length == 10) {
          return "Enter a valid phone number";
        }
        return null;
      case TextFieldValidationType.otp:
        if (input.isEmpty) return "OTP can't be empty";

        if (input.length < 6) return "Enter a valid OTP";

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
      case TextFieldValidationType.year:
        if (input.isEmpty) return "Year can't be empty";
        if (input.length != 4) return "Year must be 4 digts";
        if (int.parse(input) > DateTime.now().year + 2) {
          return "Year can't be biger than ${DateTime.now().year + 2}";
        }
        return null;

      case TextFieldValidationType.car:
        if (input.isEmpty) return "Car is required";
        return null;
      case TextFieldValidationType.model:
        if (input.isEmpty) return "Model can't be empty";
        return null;
      case TextFieldValidationType.bodyType:
        if (input.isEmpty) return "Body Type can't be empty";
        return null;
      case TextFieldValidationType.fuelType:
        if (input.isEmpty) return "Fuel Type can't be empty";
        return null;
      case TextFieldValidationType.gearboxType:
        if (input.isEmpty) return "Gearbox Type can't be empty";
        return null;
      case TextFieldValidationType.km:
        if (input.isEmpty) return "Mileage Type can't be empty";
        if (input[0] == '0') return "Please enter a valid mileage";
        if (input.length > 9) return "Please enter a valid mileage";
        return null;
      case TextFieldValidationType.paintColor:
        if (input.isEmpty) return "Paint color can't be empty";
        return null;
      case TextFieldValidationType.paintCondition:
        if (input.isEmpty) return "Paint Condition can't be empty";
        return null;
      case TextFieldValidationType.location:
        if (input.isEmpty) return "Location can't be empty";
        return null;
      case TextFieldValidationType.engineCapacity:
        if (input.isEmpty) return "Engine Capacity can't be empty";
        return null;
      case TextFieldValidationType.engineCylinderNumber:
        if (input.isEmpty) return "Engine Cylinder Number can't be empty";
        return null;
      case TextFieldValidationType.price:
        if (input.isEmpty) return "Price can't be empty";
        if (input == '0') return "Price must be greater than 0";
        if (input[0] == '0') return "Please enter a valid price";
        if (input.length < 5) return "Please enter a valid price";
        return null;
      case TextFieldValidationType.description:
        if (input.isEmpty) return "Description can't be empty";
        if (input.length < 100) {
          return "Description must be at least 100 characters";
        }

        return null;
      case TextFieldValidationType.name:
        if (input.isEmpty) return "Name can't be empty";
        if (input.length < 5) return "Name must be at least 5 characters";
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

  static String? validatePhoneNumber(String value, String defaultCountryCode) {
    return null;
  }
}
