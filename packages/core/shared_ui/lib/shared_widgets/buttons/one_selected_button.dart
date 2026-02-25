import 'package:constants/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:shared_ui/shared_widgets/buttons/elevated_button_decoration.dart';

class OneSelectedButton<T extends Enum> extends StatelessWidget {
  final String label;
  final T currentValue;
  final List<T> values;
  final void Function(T) onSelected;
  final String? Function(T?)? validator;
  final String Function(T) labelBuilder;
  final EdgeInsets padding;
  const OneSelectedButton({
    super.key,
    required this.label,
    required this.currentValue,
    required this.values,
    required this.onSelected,
     this.validator,
    required this.labelBuilder,
    this.padding = const EdgeInsets.symmetric(vertical: AppPadding.p10),
  });

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxWidth: MediaQuery.of(context).size.width,
        minWidth: MediaQuery.of(context).size.width,
      ),
      child: FormField<T>(
        initialValue: currentValue,
        validator: validator,
        builder: (FormFieldState<T> field) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: padding,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    label,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
              ),
              Wrap(
                alignment: WrapAlignment.start,
                runSpacing: AppSize.s10,
                spacing: AppSize.s10,
                children: [
                  ...List.generate(
                    values.length,
                    (index) => SelecteButton(
                      value: values[index],
                      field: field,
                      onSelected: onSelected,
                      labelBuilder: labelBuilder,
                    ),
                  ),
                ],
              ),
              Visibility(
                visible: field.hasError,
                child: Padding(
                  padding: const EdgeInsets.only(top: AppPadding.p8,),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "${field.errorText}",
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: Theme.of(context).colorScheme.error,
                      ),
                    ),
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

class SelecteButton<T extends Enum> extends StatelessWidget {
  final FormFieldState<T> field;
  final T value;
  final void Function(T) onSelected;
  final String Function(T) labelBuilder;

  const SelecteButton({
    super.key,
    required this.field,
    required this.onSelected,
    required this.value,
    required this.labelBuilder,
  });

  @override
  Widget build(BuildContext context) {
    final isSelected = value == field.value;
    Size size = MediaQuery.of(context).size;
    double width = (size.width) / 3.4;

    return ElevatedButton(
      onPressed: () {
        if (!isSelected) {
          onSelected(value);
          field.didChange(value);
          field.validate();
        }
      },
      style: CustomElevatedButtonDecoration.customElevatedbuttonStyle(
        context: context,
        isSelected: isSelected,
        width: width,
        error: field.hasError,
      ),
      child: Text(
        labelBuilder(value),
        style: Theme.of(context).textTheme.labelLarge!.copyWith(
          color: isSelected
              ? Theme.of(context).colorScheme.surface
              : Theme.of(context).colorScheme.onError,
        ),
      ),
    );
  }
}
