import 'package:constants/values_manager.dart';
import 'package:data/models/car/car_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_ui/shared_widgets/text_field/text_field_button_decoration.dart';
import 'package:shared_ui/shared_widgets/text_field/validate/text_field_validate.dart';
import 'package:intl/intl.dart';

// ignore: must_be_immutable
// class NormalTextField extends StatefulWidget {
//   final int? maxLength;
//   final TextFieldValidationType validationType;
//   final String hint;
//   final String title;
//   final int? maxLiens;
//   final int? minLiens;
//   final TextInputType? keybordType;
//   final ValueChanged<String> onChanged;
//   final bool counter;
//   final bool format;
//   final bool price;
//   String gvalue;
//   NormalTextField({
//     super.key,
//     this.hint = '',
//     required this.onChanged,
//     required this.title,
//     this.maxLiens,
//     this.minLiens,
//     this.maxLength,
//     this.validationType = TextFieldValidationType.none,
//     this.keybordType,
//     this.counter = false,
//     required this.gvalue,
//     this.format = true,
//     this.price = false,
//   });

//   @override
//   State<NormalTextField> createState() => _NormalTextFieldState();
// }

// class _NormalTextFieldState extends State<NormalTextField> {
//   late TextEditingController controller;
//   final NumberFormat _formatter = NumberFormat("#,###");
//   @override
//   void initState() {
//     controller = TextEditingController();
//     super.initState();
//   }

//   @override
//   void dispose() {
//     controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     // WidgetsBinding.instance.addPostFrameCallback((_) {
//     //   controller.value = controller.value.copyWith(
//     //     text: widget.gvalue,
//     //     selection: TextSelection.collapsed(offset: widget.gvalue.length),
//     //     composing: TextRange.empty,
//     //   );
//     // });
//     // controller.text = widget.gvalue;
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Padding(
//           padding: const EdgeInsets.symmetric(vertical: AppPadding.p10),
//           child: Text(
//             widget.title,
//             textAlign: TextAlign.start,
//             style: Theme.of(context).textTheme.bodyMedium,
//           ),
//         ),
//         TextFormField(
//           maxLength: widget.maxLength,
//           controller: controller,
//           buildCounter:
//               (
//                 context, {
//                 required currentLength,
//                 required isFocused,
//                 required maxLength,
//               }) {
//                 return widget.counter
//                     ? Text(
//                         '$currentLength/$maxLength',
//                         style: Theme.of(context).textTheme.bodySmall,
//                       )
//                     : SizedBox();
//               },
//           decoration: InputDecoration(
//             prefixIcon: widget.price
//                 ? Icon(
//                     Icons.attach_money,
//                     color: Theme.of(context).colorScheme.outline,
//                   )
//                 : null,
//             hintText: widget.hint,
//             hintStyle: Theme.of(context).textTheme.labelLarge,
//             border: OutlineInputBorder(
//               borderSide: BorderSide(
//                 color: Theme.of(context).colorScheme.outline,
//                 width: 1,
//               ),
//               borderRadius: BorderRadius.circular(AppSize.s8),
//             ),
//             enabledBorder: OutlineInputBorder(
//               borderSide: BorderSide(
//                 color: Theme.of(context).colorScheme.outline,
//                 width: 1,
//               ),
//               borderRadius: BorderRadius.circular(AppSize.s8),
//             ),
//             fillColor: Theme.of(context).colorScheme.surfaceContainerHighest,
//           ),
//           minLines: widget.minLiens,
//           maxLines: widget.maxLiens,
//           style: Theme.of(context).textTheme.bodyMedium,
//           validator: (value) =>
//               TextFieldValidator.validateNormal(widget.validationType, value!),
//           autovalidateMode: AutovalidateMode.onUnfocus,

//           onChanged: (value) => widget.onChanged(value),
//           textInputAction: TextInputAction.done,
//           keyboardType: widget.keybordType,

//           autofocus: false,

//           onTapOutside: (event) {
//             FocusScope.of(context).unfocus();
//           },
//           inputFormatters: widget.format
//               ? [
//                   FilteringTextInputFormatter.digitsOnly, // only numbers
//                   TextInputFormatter.withFunction((oldValue, newValue) {
//                     if (newValue.text.isEmpty) return newValue;

//                     // Remove existing commas
//                     String digits = newValue.text.replaceAll(',', '');

//                     // Format number with commas
//                     final formatted = _formatter.format(int.parse(digits));

//                     // Calculate new cursor position
//                     return TextEditingValue(
//                       text: formatted,
//                       selection: TextSelection.collapsed(
//                         offset: formatted.length,
//                       ),
//                     );
//                   }),
//                 ]
//               : [],
//         ),
//       ],
//     );
//   }
// }

enum TextFieldUploadCarType {
  price,
  mileage,
  year,
  version,
  discription,
  interiorFeatures,
  modifications,
  serviceHistory,
  none,
}

class NormalTextFieldUploadCar extends StatefulWidget {
  final int? maxLength;
  final TextFieldValidationType validationType;
  final String hint;
  final String title;
  final int? maxLiens;
  final int? minLiens;
  final TextInputType? keybordType;
  final bool counter;
  final bool format;
  final bool price;
  final TextFieldUploadCarType type;
  final CarModel car;
  const NormalTextFieldUploadCar({
    super.key,
    this.hint = '',
    required this.title,
    this.maxLiens,
    this.minLiens,
    this.maxLength,
    this.validationType = TextFieldValidationType.none,
    this.keybordType,
    this.counter = false,
    this.format = true,
    this.price = false,
    required this.car,
    required this.type,
  });

  @override
  State<NormalTextFieldUploadCar> createState() =>
      NormalTextFieldUploadCarState();
}

class NormalTextFieldUploadCarState extends State<NormalTextFieldUploadCar> {
  late TextEditingController controller;
  final NumberFormat _formatter = NumberFormat("#,###");
  @override
  void initState() {
    controller = TextEditingController();
    switch (widget.type) {
      case TextFieldUploadCarType.price:
        controller.text = widget.car.price;
        break;
      case TextFieldUploadCarType.mileage:
        controller.text = widget.car.km;
        break;
      case TextFieldUploadCarType.year:
        controller.text = widget.car.year;
        break;
      case TextFieldUploadCarType.version:
        controller.text = widget.car.version;
        break;
      case TextFieldUploadCarType.discription:
        controller.text = widget.car.description;
        break;
      case TextFieldUploadCarType.interiorFeatures:
        controller.text = widget.car.interiorFeatures;
        break;
      case TextFieldUploadCarType.modifications:
        controller.text = widget.car.modifications;
        break;
      case TextFieldUploadCarType.serviceHistory:
        controller.text = widget.car.serviceHistory;
        break;
      case TextFieldUploadCarType.none:
        controller.text = '';
        break;
    }

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
        SizedBox(
          height: TextFieldButtonDecoration.textFieldButtonHeight,
          child: TextFormField(
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
              price: widget.price,
            ),
            minLines: widget.minLiens,
            maxLines: widget.maxLiens,
            style: Theme.of(context).textTheme.bodyMedium,
            validator: (value) => TextFieldValidator.validateNormal(
              widget.validationType,
              value!,
            ),
            autovalidateMode: AutovalidateMode.onUnfocus,

            onChanged: (value) {
              switch (widget.type) {
                case TextFieldUploadCarType.price:
                  widget.car.price = value;

                  break;
                case TextFieldUploadCarType.mileage:
                  widget.car.km = value;
                  break;
                case TextFieldUploadCarType.year:
                  widget.car.year = value;
                  break;
                case TextFieldUploadCarType.version:
                  widget.car.version = value;
                  break;
                case TextFieldUploadCarType.discription:
                  widget.car.description = value;
                  break;
                case TextFieldUploadCarType.interiorFeatures:
                  widget.car.interiorFeatures = value;
                  break;
                case TextFieldUploadCarType.modifications:
                  widget.car.modifications = value;
                  break;
                case TextFieldUploadCarType.serviceHistory:
                  widget.car.serviceHistory = value;
                  break;
                case TextFieldUploadCarType.none:
                  break;
              }
            },
            textInputAction: TextInputAction.done,
            keyboardType: widget.keybordType,

            autofocus: false,

            onTapOutside: (event) {
              FocusScope.of(context).unfocus();
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
                : [],
          ),
        ),
      ],
    );
  }
}
