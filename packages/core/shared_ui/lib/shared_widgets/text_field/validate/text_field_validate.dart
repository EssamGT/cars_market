import 'package:constants/strings_manager.dart';
import 'package:data/models/car/brands_models/body_types.dart'
    show CarBodyType, CarbodyTypeExtension;
import 'package:data/models/car/brands_models/car_condition.dart';
import 'package:data/models/car/brands_models/engine_spec.dart';
import 'package:data/models/car/brands_models/fuel_type.dart';
import 'package:data/models/car/brands_models/negotiation.dart';
import 'package:data/models/car/brands_models/paint_colors.dart';
import 'package:data/models/car/brands_models/payment_options.dart';
import 'package:data/models/car/brands_models/transmission_type.dart';
import 'package:data/models/car/brands_models/wahtsaap_message.dart';

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
  carCondition,
  name,
  hp,
  topSpeed,
  fuelConsumption,
  seatNumber,
  otp,
  transmissionType,
  negotiable,
  paymentOptions,
  whatsappMessage,
  images,
}

class TextFieldValidator {
  static String? validateNormal(TextFieldValidationType type, String value) {
    final input = value.trim();

    switch (type) {
      case TextFieldValidationType.email:
        if (input.isEmpty) return StringsManager.emptyEmailError;
        final regex = RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$');
        if (!regex.hasMatch(input)) return StringsManager.validEmailError;
        return null;

      case TextFieldValidationType.phone:
        if (input.isEmpty) return StringsManager.emptyPhoneError;
        final regex = RegExp(r'^[0-9]{8,15}$');
        if (!regex.hasMatch(input)) return StringsManager.validPhoneError;
        if (input.length < 10) return StringsManager.validPhoneError;
        if (input[0] == '0' && input.length == 10) {
          return StringsManager.validPhoneError;
        }
        return null;
      case TextFieldValidationType.otp:
        if (input.isEmpty) return StringsManager.emptyOtpError;

        if (input.length < 6) return StringsManager.validOtpError;

        return null;

      case TextFieldValidationType.password:
        final regex = RegExp(
          r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[!@#\$%^&*(),.?":{}|<>])(?!.*\s).{8,}$',
        );
        if (input.isEmpty) return StringsManager.emptyPasswordError;
        if (!regex.hasMatch(input)) {
          return StringsManager.validPasswordError;
        }
        return null;

      case TextFieldValidationType.loginPassword:
        if (input.isEmpty) return StringsManager.emptyPasswordError;
        if (input.length < 8) return StringsManager.passwordMinLengthError;
        return null;

      case TextFieldValidationType.none:
        return null;
      case TextFieldValidationType.year:
        int year = int.tryParse(input) ?? 0;
        if (year == 0) return StringsManager.emptyYearError;
        if (input.length != 4) return StringsManager.validYearError;
        if (year < 1900) return StringsManager.validYearError;
        if (year > DateTime.now().year + 1) {
          return StringsManager.validYearError;
        }
        return null;

      case TextFieldValidationType.car:
        if (input.isEmpty) return StringsManager.carRequiredError;
        return null;
      case TextFieldValidationType.model:
        if (input.isEmpty) return StringsManager.emptyModelError;
        return null;
      case TextFieldValidationType.bodyType:
        if (input.isEmpty || input == CarBodyType.none.getCarBodyTypeName()) {
          return StringsManager.emptyBodyTypeError;
        }
        return null;
      case TextFieldValidationType.fuelType:
        if (input.isEmpty || input == FuelType.none.getFuelTypeName()) {
          return StringsManager.emptyFuelTypeError;
        }
        return null;
      case TextFieldValidationType.gearboxType:
        if (input.isEmpty) return StringsManager.emptyGearboxTypeError;
        return null;
      case TextFieldValidationType.km:
        if (input.isEmpty) return StringsManager.emptyMileageError;
        if (input[0] == '0') return StringsManager.validMileageError;
        if (input.length > 9) return StringsManager.validMileageError;
        return null;
      case TextFieldValidationType.paintColor:
        if (input.isEmpty || input == PaintColors.none.getColorName()) {
          return StringsManager.emptyPaintColorError;
        }
        return null;
      case TextFieldValidationType.paintCondition:
        if (input.isEmpty ||
            input == PaintConditions.none.getPaintConditionText()) {
          return StringsManager.emptyPaintConditionError;
        }
        return null;
      case TextFieldValidationType.location:
        if (input.isEmpty) return StringsManager.emptyLocationError;
        return null;

      case TextFieldValidationType.carCondition:
        if (input.isEmpty ||
            input == CarConditionType.none.getConditionText()) {
          return StringsManager.carConditionError;
        }
        return null;
      case TextFieldValidationType.price:
        if (input.isEmpty) return StringsManager.emptyPriceError;
        if (input == '0') return StringsManager.priceZeroError;
        if (input[0] == '0') return StringsManager.validPriceError;
        if (input.length < 5) return StringsManager.validPriceError;
        return null;
      case TextFieldValidationType.description:
        if (input.isEmpty) return StringsManager.emptyDescriptionError;
        if (input.length < 20) {
          return StringsManager.descriptionMinLengthError;
        }

        return null;
      case TextFieldValidationType.name:
        if (input.isEmpty) return StringsManager.emptyNameError;
        if (input.length < 5) return StringsManager.nameMinLengthError;
        return null;
      case TextFieldValidationType.seatNumber:
        if (value.trim().isEmpty) {
          return null; // optional → allow empty
        }
        if (int.tryParse(input)! < 2) {
          return StringsManager.seatNumberMinError;
        }
        if (int.tryParse(input) == null || int.tryParse(input)! > 7) {
          return StringsManager.seatNumberMaxError;
        }
        return null;
      case TextFieldValidationType.hp:
        if (value.isEmpty || value.trim().isEmpty) {
          return null; // optional → allow empty
        }

        final hp = int.tryParse(value);
        if (hp == null) {
          return StringsManager.validHpError;
        }

        if (hp <= 0) {
          return StringsManager.hpMustBeGreaterThanZeroError;
        }
        if (hp < 50 || hp > 2000) {
          return StringsManager.hpRealisticError;
        }

        return null;
      case TextFieldValidationType.fuelConsumption:
        if (value.isEmpty || value.trim().isEmpty) {
          return null; // optional → allow empty
        }

        final fuel = double.tryParse(value);
        if (fuel == null) {
          return StringsManager.validFuelConsumptionError;
        }

        if (fuel <= 0) {
          return StringsManager.zeroFuelConsumptionError;
        }
        if (fuel < 2 || fuel > 30) {
          return StringsManager.fuelConsumptionRealisticError;
        }

        return null;
      case TextFieldValidationType.engineCapacity:
        if (value == EngineCapacity.none.getEngineCapacityName()) {
          return StringsManager.emptyEngineCapacityError;
        }
        return null;
      case TextFieldValidationType.transmissionType:
        if (value == TransmissionType.none.getTransmissionTypeName()) {
          return StringsManager.transmissionTypeError;
        }
        return null;
      case TextFieldValidationType.negotiable:
        if (value == NegotiationType.none.getConditionText()) {
          return StringsManager.negotiableError;
        }
        return null;
      case TextFieldValidationType.paymentOptions:
        if (value == PaymentOptions.none.getText) {
          return StringsManager.paymentOptionsError;
        }
        return null;
      case TextFieldValidationType.whatsappMessage:
        if (value == WahtsaapMessage.none.getConditionText()) {
          return StringsManager.whatsappMessageError;
        }
        return null;
      case TextFieldValidationType.images:
        int imageCount = int.tryParse(value) ?? 0;
        if (imageCount == 0) {
          return StringsManager.imagesError;
        }
        if (imageCount < 3) {
          return StringsManager.imagesError;
        }
        return null;

      default:
        return null;
    }
  }

  static String? twoPasswordValidator(String value, String value2) {
    final input = value.trim();
    final input2 = value2.trim();
    if (input2.isEmpty) {
      return StringsManager.emptyConfirmPasswordError;
    }
    if (input != input2) {
      return StringsManager.passwordsMismatchError;
    }
    return null;
  }

  static String? validatePhoneNumber(String value, String defaultCountryCode) {
    return null;
  }
}
