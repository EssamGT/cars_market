import 'package:constants/values_manager.dart';
import 'package:data/models/car/car_filter_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_ui/shared_widgets/text_field/text_field_button_decoration.dart';
import 'package:shared_ui/shared_widgets/text_field/validate/text_field_validate.dart';
import 'package:intl/intl.dart';

enum FilterNormalTextFieldType {
  fromPrice,
  minPrice,
  minMileage,
  maxMileage,
  minYear,
  maxYear,
  minEngineCapacity,
  maxEngineCapacity,
  none,
}

class FilterNormalTextField extends StatefulWidget {
  final int? maxLength;
  final TextFieldValidationType validationType;
  final String hint;
  final String? title;
  final int? minLiens;
  final TextInputType? keyboardType;
  final bool format;
  final bool price;
  final FilterNormalTextFieldType type;
  final CarFilterModel carFilter;
  final double width;
  const FilterNormalTextField({
    super.key,
    this.hint = '',
    this.title,
    this.minLiens,
    this.maxLength,
    this.validationType = TextFieldValidationType.none,
    this.keyboardType,

    this.format = true,
    this.price = false,
    required this.carFilter,
    required this.type,
    required this.width,
  });

  @override
  State<FilterNormalTextField> createState() => FilterNormalTextFieldState();
}

class FilterNormalTextFieldState extends State<FilterNormalTextField> {
  late TextEditingController controller;
  late FocusNode focusNode;

  final NumberFormat _formatter = NumberFormat("#,###");
  @override
  void initState() {
    controller = TextEditingController();
    switch (widget.type) {
      case FilterNormalTextFieldType.fromPrice:
        controller.text = widget.carFilter.maxPrice ?? '';
        break;
      case FilterNormalTextFieldType.minPrice:
        controller.text = widget.carFilter.minPrice ?? '';
        break;
      case FilterNormalTextFieldType.minMileage:
        controller.text = widget.carFilter.minKm ?? '';
        break;
      case FilterNormalTextFieldType.maxMileage:
        controller.text = widget.carFilter.maxKm ?? '';
        break;
      case FilterNormalTextFieldType.minYear:
        controller.text = widget.carFilter.minYear ?? "";
        break;
      case FilterNormalTextFieldType.maxYear:
        minValue = widget.carFilter.minYear;
        controller.text = widget.carFilter.maxYear ?? "";
        break;
      case FilterNormalTextFieldType.minEngineCapacity:
        controller.text = widget.carFilter.minEngineCapacity ?? '';
        break;
      case FilterNormalTextFieldType.maxEngineCapacity:
        controller.text = widget.carFilter.maxEngineCapacity ?? '';
        break;
      case FilterNormalTextFieldType.none:
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

  String? minValue;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      child: FormField<String>(
        initialValue: controller.text,
        validator: (value) => TextFieldValidator.validateNormal(
          widget.validationType,
          value!,
          minValue,
        ),
        builder: (field) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: AppPadding.p10),
                child: Text(
                  widget.title ?? "",
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
                      return SizedBox();
                    },
                decoration: TextFieldButtonDecoration.textfieldInputDecoration(
                  context,
                  widget.hint,
                  // prefixText: widget.,
                  error: field.hasError,
                ),
                textAlign: TextAlign.start,

                minLines: widget.minLiens,
                style: Theme.of(context).textTheme.bodyMedium,
                // validator: (value) => TextFieldValidator.validateNormal(
                //   widget.validationType,
                //   value!,
                // ),
                autovalidateMode: AutovalidateMode.onUnfocus,

                onChanged: (value) {
                  field.didChange(value);
                  switch (widget.type) {
                    case FilterNormalTextFieldType.fromPrice:
                      widget.carFilter.maxPrice = value;

                      break;
                    case FilterNormalTextFieldType.minPrice:
                      widget.carFilter.minPrice = value;
                      break;
                    case FilterNormalTextFieldType.minMileage:
                      widget.carFilter.minKm = value;
                      break;
                    case FilterNormalTextFieldType.maxMileage:
                      widget.carFilter.maxKm = value;
                      break;
                    case FilterNormalTextFieldType.minYear:
                      if (value.isEmpty) {
                        widget.carFilter.minYear = null;
                        break;
                      } else {
                        widget.carFilter.minYear = value;
                        break;
                      }
                    case FilterNormalTextFieldType.maxYear:
                      if (value.isEmpty) {
                        widget.carFilter.maxYear = null;
                        break;
                      } else {
                        widget.carFilter.maxYear = value;
                        break;
                      }

                    case FilterNormalTextFieldType.minEngineCapacity:
                      widget.carFilter.minEngineCapacity = value;
                      break;
                    case FilterNormalTextFieldType.maxEngineCapacity:
                      widget.carFilter.maxEngineCapacity = value;
                      break;

                    case FilterNormalTextFieldType.none:
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
                          final formatted = _formatter.format(
                            int.parse(digits),
                          );

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
      ),
    );
  }
}
