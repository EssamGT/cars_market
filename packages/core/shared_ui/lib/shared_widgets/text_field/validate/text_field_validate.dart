import 'package:cars_market/globle/globle.dart';
import 'package:constants/strings_manager.dart';
import 'package:data/models/car/brands_models/body_types.dart';
import 'package:data/models/car/brands_models/car_condition.dart';
import 'package:data/models/car/brands_models/engine_spec.dart';
import 'package:data/models/car/brands_models/fuel_type.dart';
import 'package:data/models/car/brands_models/negotiation.dart';
import 'package:data/models/car/brands_models/paint_colors.dart';
import 'package:data/models/car/brands_models/payment_options.dart';
import 'package:data/models/car/brands_models/transmission_type.dart';
import 'package:data/models/car/brands_models/whatsapp_message.dart';

enum TextFieldValidationType {
  email,
  phone,
  password,
  newEmail,
  newPhone,
  newPassword,
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
  newName,
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
  minYear,
  maxYear,
  minPrice,
  maxPrice,
  minKm,
  maxKm,
}

enum FilterTextFieldValidationType {
  minYear,
  maxYear,
  minPrice,
  maxPrice,
  minKm,
  maxKm,
  minEngineCapacity,
  maxEngineCapacity,
}

class TextFieldValidator {
  static String? validateNormal(
    TextFieldValidationType type,
    String value, [
    String? value2,
  ]) {
    final input = value.trim();

    switch (type) {
      case TextFieldValidationType.email:
        if (input.isEmpty) return StringsManager.emptyEmailError;
        final regex = RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$');
        if (!regex.hasMatch(input)) return StringsManager.validEmailError;
        return null;
      case TextFieldValidationType.newEmail:
        if (input.isEmpty) return StringsManager.emptyEmailError;
        final regex = RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$');
        if (!regex.hasMatch(input)) return StringsManager.validEmailError;
        if (input == userData.email) return StringsManager.newEmailIsRequired;
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
      case TextFieldValidationType.newPhone:
        if (input.isEmpty) return StringsManager.emptyPhoneError;
        final regex = RegExp(r'^[0-9]{8,15}$');
        if (!regex.hasMatch(input)) return StringsManager.validPhoneError;
        if (input.length < 10) return StringsManager.validPhoneError;
        if (input[0] == '0' && input.length == 10) {
          return StringsManager.validPhoneError;
        }
        if (input == userData.phoneNumber.replaceRange(0, 2, "")) return StringsManager.newPhoneIsRequired;
        if (input == userData.phoneNumber.replaceRange(0, 3, "")) return StringsManager.newPhoneIsRequired;
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
      case TextFieldValidationType.minYear:
        int year = int.tryParse(input) ?? 0;
        if (year == 0) return null;
        if (input.length != 4) return StringsManager.validYearError;
        if (year < 1900) return StringsManager.validYearError;
        if (year > DateTime.now().year + 1) {
          return StringsManager.validYearError;
        }
        return null;
      case TextFieldValidationType.maxYear:
        int year = int.tryParse(input) ?? 0;
        int minYear = int.tryParse(value2 ?? "") ?? 0;
        if (year == 0) return null;
        if (input.length != 4) return StringsManager.validYearError;
        if (year < 1900) return StringsManager.validYearError;
        if (year < minYear) return StringsManager.validYearError;
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
        if (input.isEmpty) return StringsManager.emptyKmError;
        if (input[0] == '0') return StringsManager.validKmError;
        if (input.length > 9) return StringsManager.validKmError;
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
      case TextFieldValidationType.newName:
        if (input.isEmpty) return StringsManager.emptyNameError;
        if (input.length < 5) return StringsManager.nameMinLengthError;
        if (input == userData.name) return StringsManager.newNameIsRequired;
        if (input == userData.name.trim()) return StringsManager.newNameIsRequired;
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
        if (value == WhatsAppMessage.none.getConditionText()) {
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

  static String? filterValidate(
    FilterTextFieldValidationType type,
    String value1,
    String value2,
  ) {
    switch (type) {
      case FilterTextFieldValidationType.minYear:
        int? year = int.tryParse(value1);
        int? maxYear = int.tryParse(value2);
        if (year == null) return null;
        maxYear ??= 0;
        if (value1.length != 4) return StringsManager.validYearError;
        if (year < 1900) return StringsManager.validYearError;
        if (year > DateTime.now().year + 1) {
          return StringsManager.validYearError;
        }
        if (year > maxYear && maxYear != 0)
          return StringsManager.validYearError;
        return null;
      case FilterTextFieldValidationType.maxYear:
        int? year = int.tryParse(value1);
        int? minYear = int.tryParse(value2);
        if (year == null) return null;
        minYear ??= 0;
        if (value1.length != 4) return StringsManager.validYearError;
        if (year < 1900) return StringsManager.validYearError;
        if (year < minYear) return StringsManager.validYearError;
        if (year > DateTime.now().year + 1) {
          return StringsManager.validYearError;
        }
        return null;
      case FilterTextFieldValidationType.minPrice:
        int? price = int.tryParse(value1);
        int? maxPrice = int.tryParse(value2);
        if (price == null) return null;
        maxPrice ??= 0;
        if (price < 0) return StringsManager.validPriceError;
        if (price > maxPrice && maxPrice != 0) {
          return StringsManager.validPriceError;
        }
        return null;
      case FilterTextFieldValidationType.maxPrice:
        int? price = int.tryParse(value1);
        int? minPrice = int.tryParse(value2);
        if (price == null) return null;
        minPrice ??= 0;
        if (price < 0) return StringsManager.validPriceError;
        if (price < minPrice) return StringsManager.validPriceError;
        return null;
      case FilterTextFieldValidationType.minKm:
        int? km = int.tryParse(value1);
        int? maxKm = int.tryParse(value2);
        if (km == null) return null;
        maxKm ??= 0;
        if (km < 0) return StringsManager.validKmError;
        if (km > maxKm && maxKm != 0) {
          return StringsManager.validKmError;
        }
        return null;
      case FilterTextFieldValidationType.maxKm:
        int? km = int.tryParse(value1);
        int? minKm = int.tryParse(value2);
        if (km == null) return null;
        minKm ??= 0;
        if (km < 0) return StringsManager.validKmError;
        if (km < minKm) return StringsManager.validKmError;
        return null;
      case FilterTextFieldValidationType.minEngineCapacity:
        int? engineCapacity = int.tryParse(value1);
        int? maxEngineCapacity = int.tryParse(value2);
        if (engineCapacity == null) return null;
        maxEngineCapacity ??= 0;
        if (engineCapacity < 0) return StringsManager.validEngineCapacityError;
        if (engineCapacity > maxEngineCapacity && maxEngineCapacity != 0) {
          return StringsManager.validEngineCapacityError;
        }
        return null;
      case FilterTextFieldValidationType.maxEngineCapacity:
        int? engineCapacity = int.tryParse(value1);
        int? minEngineCapacity = int.tryParse(value2);
        if (engineCapacity == null) return null;
        minEngineCapacity ??= 0;
        if (engineCapacity < 0) return StringsManager.validEngineCapacityError;
        if (engineCapacity < minEngineCapacity)
          return StringsManager.validEngineCapacityError;
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
