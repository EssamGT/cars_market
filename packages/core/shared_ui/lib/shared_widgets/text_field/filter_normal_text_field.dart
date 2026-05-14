import 'package:constants/strings_manager.dart';
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
  maxPrice,
  minKm,
  maxKm,
  minYear,
  maxYear,
  minEngineCapacity,
  maxEngineCapacity,
  none,
}

String _unFormate(String value) {
  return value.replaceAll(',', '');
}

class BaseTextField extends StatefulWidget {
  final TextEditingController controller;
  final int? maxLength;
  final String? Function(String?)? validator;
  final String hint;
  final String? title;
  final int? minLiens;
  final TextInputType keyboardType;
  final bool format;
  final String? prefix;
  final double width;
  final Function(String)? onChanged;
  const BaseTextField({
    super.key,
    required this.controller,
    required this.keyboardType,
    required this.width,
    required this.validator,
    this.hint = '',
    this.title,
    this.minLiens,
    this.maxLength,
    this.format = true,
    this.onChanged,
    this.prefix,
  });

  @override
  State<BaseTextField> createState() => _BaseTextFieldState();
}

class _BaseTextFieldState extends State<BaseTextField> {
  late TextEditingController controller;
  late FocusNode focusNode;
  final NumberFormat _formatter = NumberFormat("#,###");
  final GlobalKey<FormFieldState> _fieldKey = GlobalKey<FormFieldState>();

  @override
  void initState() {
    controller = widget.controller;
    focusNode = FocusNode();
    focusNode.addListener(() {
      if (!focusNode.hasFocus) {
        _fieldKey.currentState?.validate();
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    focusNode.dispose();
    super.dispose();
  }

  void unfocusAndValidate(FormFieldState field) {
    focusNode.unfocus();
    field.validate();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      child: FormField(
        key: _fieldKey,
        validator: widget.validator,
        initialValue: controller.text,
        onReset: () {
          controller = TextEditingController();
        },
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
                  prefixText: widget.prefix,
                  error: field.hasError,
                ),
                textAlign: TextAlign.start,

                minLines: widget.minLiens,
                style: Theme.of(context).textTheme.bodyMedium,

                autovalidateMode: AutovalidateMode.onUnfocus,

                onChanged: (value) {
                  field.didChange(value);
                  widget.onChanged?.call(_unFormate(value));
                },
                keyboardType: widget.keyboardType,
                autofocus: false,
                focusNode: focusNode,
                ignorePointers: false,
                onTapUpOutside: (event) {
                  unfocusAndValidate(field);
                },
                onEditingComplete: () {
                  unfocusAndValidate(field);
                },
                onTapOutside: (event) {
                  unfocusAndValidate(field);
                },
                onFieldSubmitted: (newValue) {
                  unfocusAndValidate(field);
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

class DoubleFilterTextField extends StatefulWidget {
  final String? title;
  final String hint1;
  final String hint2;
  final String initValue1;
  final String initValue2;
  final Function(String)? onChanged1;
  final Function(String)? onChanged2;
  final bool format;
  final TextInputType keyboardType;
  final int? maxLength;
  final FilterTextFieldValidationType type1;
  final FilterTextFieldValidationType type2;
  const DoubleFilterTextField({
    super.key,
    required this.title,
    this.hint1 = "",
    this.hint2 = "",
    this.initValue1 = "",
    this.initValue2 = "",
    this.onChanged1,
    this.onChanged2,
    this.format = true,
    this.keyboardType = TextInputType.text,
    this.maxLength,
    required this.type1,
    required this.type2,
  });

  @override
  State<DoubleFilterTextField> createState() => _DoubleFilterTextFieldState();
}

class _DoubleFilterTextFieldState extends State<DoubleFilterTextField> {
  final double width = 0.44;
  late TextEditingController controller1;
  late TextEditingController controller2;
  @override
  void initState() {
    controller1 = TextEditingController(text: widget.initValue1);
    controller2 = TextEditingController(text: widget.initValue2);
    super.initState();
  }

  @override
  void dispose() {
    controller1.dispose();
    controller2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        BaseTextField(
          hint: widget.hint1,
          controller: controller1,
          title: widget.title,
          format: widget.format,
          width: size.width * width,
          validator: (value) => TextFieldValidator.filterValidate(
            widget.type1,
            _unFormate(controller1.text),
            _unFormate(controller2.text),
          ),
          onChanged: widget.onChanged1,
          keyboardType: widget.keyboardType,
          maxLength: widget.maxLength,
        ),

        BaseTextField(
          controller: controller2,
          width: size.width * width,
          validator: (value) => TextFieldValidator.filterValidate(
            widget.type2,
            _unFormate(controller2.text),
            _unFormate(controller1.text),
          ),
          format: widget.format,
          hint: widget.hint2,
          onChanged: widget.onChanged2,
          keyboardType: widget.keyboardType,
          maxLength: widget.maxLength,
        ),
      ],
    );
  }
}

class FilterNormalTextField extends StatefulWidget {
  final int? maxLength;
  final TextFieldValidationType validationType;
  final String hint;
  final String? title;
  final int? minLiens;
  final TextInputType? keyboardType;
  final bool format;
  final FilterNormalTextFieldType type;
  final CarFilterModel carFilter;
  final double width;
  final String? minValue;
  final Function(String)? onChanged;
  const FilterNormalTextField({
    super.key,
    this.hint = '',
    this.title,
    this.minLiens,
    this.maxLength,
    this.validationType = TextFieldValidationType.none,
    this.keyboardType,
    this.minValue = "",
    this.format = true,
    required this.carFilter,
    required this.type,
    required this.width,
    this.onChanged,
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
    controller = TextEditingController(text: getInitialValue());
    focusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    focusNode.dispose();
    super.dispose();
  }

  String getInitialValue() {
    switch (widget.type) {
      case FilterNormalTextFieldType.fromPrice:
        return widget.carFilter.maxPrice;
      case FilterNormalTextFieldType.minPrice:
        return widget.carFilter.minPrice;
      case FilterNormalTextFieldType.maxPrice:
        return widget.carFilter.maxPrice;
      case FilterNormalTextFieldType.minKm:
        return widget.carFilter.minKm;
      case FilterNormalTextFieldType.maxKm:
        return widget.carFilter.maxKm;
      case FilterNormalTextFieldType.minYear:
        return widget.carFilter.minYear;
      case FilterNormalTextFieldType.maxYear:
        return widget.carFilter.maxYear;
      case FilterNormalTextFieldType.minEngineCapacity:
        return widget.carFilter.minEngineCapacity;
      case FilterNormalTextFieldType.maxEngineCapacity:
        return widget.carFilter.maxEngineCapacity;
      case FilterNormalTextFieldType.none:
        return '';
    }
  }

  void setValue(String value) {
    switch (widget.type) {
      case FilterNormalTextFieldType.fromPrice:
        widget.carFilter.maxPrice = value;
        break;
      case FilterNormalTextFieldType.minPrice:
        widget.carFilter.minPrice = value;
        break;
      case FilterNormalTextFieldType.maxPrice:
        widget.carFilter.maxPrice = value;
        break;
      case FilterNormalTextFieldType.minKm:
        widget.carFilter.minKm = value;
        break;
      case FilterNormalTextFieldType.maxKm:
        widget.carFilter.maxKm = value;
        break;
      case FilterNormalTextFieldType.minYear:
        widget.carFilter.minYear = value;
        break;
      case FilterNormalTextFieldType.maxYear:
        widget.carFilter.maxYear = value;
        break;

      case FilterNormalTextFieldType.minEngineCapacity:
        widget.carFilter.minEngineCapacity = value;
        break;
      case FilterNormalTextFieldType.maxEngineCapacity:
        widget.carFilter.maxEngineCapacity = value;
        break;

      case FilterNormalTextFieldType.none:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      child: FormField<String>(
        onReset: () {
          controller = TextEditingController(text: getInitialValue());
        },

        initialValue: controller.text,
        validator: (value) => TextFieldValidator.validateNormal(
          widget.validationType,
          value!,
          widget.minValue,
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

                autovalidateMode: AutovalidateMode.onUnfocus,

                onChanged: (value) {
                  field.didChange(value);
                  setValue(value);
                  widget.onChanged?.call(value);
                },
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
                  focusNode.unfocus();

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
