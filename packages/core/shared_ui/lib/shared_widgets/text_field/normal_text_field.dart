import 'package:constants/values_manager.dart';
import 'package:data/models/car/sell_car_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_ui/shared_widgets/text_field/text_field_button_decoration.dart';
import 'package:shared_ui/shared_widgets/text_field/validate/text_field_validate.dart';
import 'package:intl/intl.dart';

enum TextFieldUploadCarType {
  price,
  km,
  year,
  version,
  description,
  modifications,
  serviceHistory,
  hp,
  topSpeed,
  seatNumber,
  fuelConsumption,
  none,
}

class NormalTextFieldUploadCar extends StatefulWidget {
  final int? maxLength;
  final TextFieldValidationType validationType;
  final String hint;
  final String title;
  final String? prefixText;
  final int? maxLiens;
  final int? minLiens;
  final TextInputType? keyboardType;
  final bool counter;
  final bool format;

  final TextFieldUploadCarType type;
  final SellCarUploadModel car;
  const NormalTextFieldUploadCar({
    super.key,
    this.hint = '',
    required this.title,
    this.prefixText,
    this.maxLiens,
    this.minLiens,
    this.maxLength,
    this.validationType = TextFieldValidationType.none,
    this.keyboardType,
    this.counter = false,
    this.format = true,
    required this.car,
    required this.type,
  });

  @override
  State<NormalTextFieldUploadCar> createState() =>
      NormalTextFieldUploadCarState();
}

class NormalTextFieldUploadCarState extends State<NormalTextFieldUploadCar> {
  late TextEditingController controller;
  late FocusNode focusNode;
  final NumberFormat _formatter = NumberFormat("#,###");
  @override
  void initState() {
    controller = TextEditingController();
    switch (widget.type) {
      case TextFieldUploadCarType.price:
        controller.text = widget.car.price;
        break;
      case TextFieldUploadCarType.km:
        controller.text = widget.car.km;
        break;
      case TextFieldUploadCarType.year:
        controller.text = widget.car.year;
        break;
      case TextFieldUploadCarType.version:
        controller.text = widget.car.version;
        break;
      case TextFieldUploadCarType.description:
        controller.text = widget.car.description;
        break;

      case TextFieldUploadCarType.modifications:
        controller.text = widget.car.modifications;
        break;
      case TextFieldUploadCarType.serviceHistory:
        controller.text = widget.car.serviceHistory;
        break;
      case TextFieldUploadCarType.hp:
        controller.text = widget.car.engineSpec.hp ?? "";
        break;
      case TextFieldUploadCarType.topSpeed:
        controller.text = widget.car.engineSpec.topSpeed ?? "";
        break;
      case TextFieldUploadCarType.fuelConsumption:
        controller.text = widget.car.engineSpec.fuelConsumption ?? "";
        break;
      case TextFieldUploadCarType.seatNumber:
        controller.text = widget.car.seatsNumber;
        break;
      case TextFieldUploadCarType.none:
        controller.text = '';
        break;
    }
    focusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FormField<String>(
      initialValue: controller.text,
      validator: (value) =>
          TextFieldValidator.validateNormal(widget.validationType, value!),
      builder: (field) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: AppPadding.p10),
              child: Text(
                widget.title,
                textAlign: TextAlign.start,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
            TextFormField(
              maxLength: widget.maxLength,
              controller: controller,

              buildCounter:
                  (
                    context, {
                    required currentLength,
                    required isFocused,
                    required maxLength,
                  }) {
                    return widget.counter
                        ? Text(
                            '$currentLength/$maxLength',
                            style: Theme.of(context).textTheme.bodySmall,
                          )
                        : SizedBox();
                  },
              decoration: TextFieldButtonDecoration.textfieldInputDecoration(
                context,
                widget.hint,
                prefixText: widget.prefixText,
                error: field.hasError,
              ),
              textAlign: TextAlign.start,

              minLines: widget.minLiens,
              maxLines: widget.maxLiens,
              style: Theme.of(context).textTheme.bodyMedium,
              // validator: (value) => TextFieldValidator.validateNormal(
              //   widget.validationType,
              //   value!,
              // ),
              autovalidateMode: AutovalidateMode.onUnfocus,

              onChanged: (value) {
                field.didChange(value);
                switch (widget.type) {
                  case TextFieldUploadCarType.price:
                    widget.car.price = value;

                    break;
                  case TextFieldUploadCarType.km:
                    widget.car.km = value;
                    break;
                  case TextFieldUploadCarType.year:
                    widget.car.year = value;
                    break;
                  case TextFieldUploadCarType.version:
                    widget.car.version = value;
                    break;
                  case TextFieldUploadCarType.description:
                    widget.car.description = value;
                    break;

                  case TextFieldUploadCarType.modifications:
                    widget.car.modifications = value;
                    break;
                  case TextFieldUploadCarType.serviceHistory:
                    widget.car.serviceHistory = value;
                    break;
                  case TextFieldUploadCarType.hp:
                    widget.car.engineSpec.hp = value;
                    break;
                  case TextFieldUploadCarType.topSpeed:
                    widget.car.engineSpec.topSpeed = value;
                    break;
                  case TextFieldUploadCarType.fuelConsumption:
                    widget.car.engineSpec.fuelConsumption = value;
                    break;
                  case TextFieldUploadCarType.seatNumber:
                    widget.car.seatsNumber = value;
                    break;
                  case TextFieldUploadCarType.none:
                    break;
                }
              },
              // textInputAction: TextInputAction.done,
              keyboardType: widget.keyboardType,
              autofocus: false,
              focusNode: focusNode,
              ignorePointers: false,
              onTapUpOutside: (event) {
                focusNode.unfocus();
                field.validate();
              },
              onTapAlwaysCalled: true,

              onEditingComplete: () {
                focusNode.unfocus();
                field.validate();
              },
              onTapOutside: (event) {
                focusNode.unfocus();

                field.validate();
              },
              onFieldSubmitted: (newValue) {
                field.validate();
              },

              inputFormatters: widget.format
                  ? [
                      FilteringTextInputFormatter.digitsOnly, // only numbers
                      TextInputFormatter.withFunction((oldValue, newValue) {
                        if (newValue.text.isEmpty) return newValue;

                        // Remove existing commas
                        String digits = newValue.text.replaceAll(',', '');

                        // Format number with commas
                        final formatted = _formatter.format(int.parse(digits));

                        // Calculate new cursor position
                        return TextEditingValue(
                          text: formatted,
                          selection: TextSelection.collapsed(
                            offset: formatted.length,
                          ),
                        );
                      }),
                    ]
                  : null,
            ),
            if (field.errorText != null)
              Padding(
                padding: const EdgeInsets.only(top: AppPadding.p4),
                child: Text(
                  field.errorText!,
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: Theme.of(context).colorScheme.error,
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}
