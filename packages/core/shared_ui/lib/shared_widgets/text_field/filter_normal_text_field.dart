import 'package:constants/values_manager.dart';
import 'package:data/models/car/car_filter_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
  final int? maxLiens;
  final int? minLiens;
  final TextInputType? keybordType;
  final bool counter;
  final bool format;
  final bool price;
  final FilterNormalTextFieldType type;
  final CarFilterModel carFilter;
  final double width;
  const FilterNormalTextField({
    super.key,
    this.hint = '',
    this.title,
    this.maxLiens,
    this.minLiens,
    this.maxLength,
    this.validationType = TextFieldValidationType.none,
    this.keybordType,
    this.counter = false,
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
        controller.text = widget.carFilter.minMileage ?? '';
        break;
      case FilterNormalTextFieldType.maxMileage:
        controller.text = widget.carFilter.maxMileage ?? '';
        break;
      case FilterNormalTextFieldType.minYear:
        controller.text = widget.carFilter.minYear ?? '';
        break;
      case FilterNormalTextFieldType.maxYear:
        controller.text = widget.carFilter.maxYear ?? '';
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
            widget.title ?? '',
            textAlign: TextAlign.start,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
        SizedBox(
          width: widget.width,
          child: TextFormField(
            // key: Key(widget.type.toString()),
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
            decoration: InputDecoration(
              // prefixIcon: widget.price
              //     ? Icon(
              //         Icons.attach_money,
              //         color: Theme.of(context).colorScheme.outline,
              //       )
              //     : null,
              hintText: widget.hint,
              hintStyle: Theme.of(context).textTheme.labelLarge,
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Theme.of(context).colorScheme.outline,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(AppSize.s8),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Theme.of(context).colorScheme.outline,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(AppSize.s8),
              ),
              fillColor: Theme.of(context).colorScheme.surfaceContainerHighest,
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
                case FilterNormalTextFieldType.fromPrice:
                  widget.carFilter.maxPrice = value;

                  break;
                case FilterNormalTextFieldType.minPrice:
                  widget.carFilter.minPrice = value;
                  break;
                case FilterNormalTextFieldType.minMileage:
                  widget.carFilter.minMileage = value;
                  break;
                case FilterNormalTextFieldType.maxMileage:
                  widget.carFilter.maxMileage = value;
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
