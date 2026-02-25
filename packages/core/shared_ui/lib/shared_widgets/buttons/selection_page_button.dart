import 'package:constants/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:shared_ui/shared_widgets/buttons/elevated_button_decoration.dart';
import 'package:shared_ui/shared_widgets/pop_up/pop_up.dart';
import 'package:shared_ui/shared_widgets/selection_page/selection_page.dart';

// Base generic selection page button (private)
class _SelectionPageButton<T> extends StatelessWidget {
  final T currentValue;
  final List<T> values;
  final String label;
  final String hint;
  final String dialogAppBarTitle;
  final String emptyPage;
  final void Function(T) onSelected;
  final Widget Function(T)? leadingBuilder;
  final String Function(T) labelBuilder;
  final String? Function(T?)? validator;
  final double buttonWidth;
  final bool search;
  final bool onlyInPageLeading;
  final Widget Function(BuildContext, FormFieldState<T>) selectionPageBuilder;

  const _SelectionPageButton({
    super.key,
    required this.currentValue,
    required this.values,
    required this.label,
    required this.hint,
    required this.dialogAppBarTitle,
    required this.emptyPage,
    required this.onSelected,
    required this.labelBuilder,
    this.leadingBuilder,
    this.validator,
    this.search = false,
    this.onlyInPageLeading = false,
    this.buttonWidth = 0,
    required this.selectionPageBuilder,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double buttonWidth = this.buttonWidth == 0
        ? size.width - AppSize.s24
        : this.buttonWidth;
    return FormField<T>(
      initialValue: currentValue,
      validator: validator,
      builder: (FormFieldState<T> field) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: AppPadding.p10),
              child: Text(label, style: Theme.of(context).textTheme.bodyMedium),
            ),
            ElevatedButton(
              style:
                  CustomElevatedButtonDecoration.customElevatedbuttonStyleNonSelectable(
                    context: context,
                    width: buttonWidth,
                    error: field.hasError,
                  ),
              onPressed: () async {
                customRightNavigation(
                  context,
                  selectionPageBuilder(context, field),
                );
              },
              child: SizedBox(
                width: buttonWidth - AppSize.s16,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        ?onlyInPageLeading
                            ? null
                            : leadingBuilder?.call(field.value!),
                        SizedBox(
                          width: leadingBuilder == null || onlyInPageLeading
                              ? AppSize.s5
                              : AppSize.s12,
                        ),
                        Text(
                          field.value == null
                              ? hint
                              : labelBuilder(field.value!),
                          style: Theme.of(context).textTheme.labelLarge,
                        ),
                      ],
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: field.hasError
                          ? Theme.of(context).colorScheme.error
                          : Theme.of(context).colorScheme.primary,
                    ),
                  ],
                ),
              ),
            ),
            if (field.hasError)
              Padding(
                padding: const EdgeInsets.only(top: AppPadding.p8),
                child: Text(
                  field.errorText!,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
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

// Single type selection page button
class SelectionPageButton<T> extends StatelessWidget {
  final T currentValue;
  final List<T> values;
  final String label;
  final String hint;
  final String dialogAppBarTitle;
  final String emptyPage;
  final void Function(T) onSelected;
  final Widget Function(T)? leadingBuilder;
  final String Function(T) labelBuilder;
  final String? Function(T?)? validator;
  final double buttonWidth;
  final bool search;
  final bool onlyInPageLeading;

  const SelectionPageButton({
    super.key,
    required this.currentValue,
    required this.values,
    required this.label,
    required this.hint,
    required this.dialogAppBarTitle,
    required this.emptyPage,
    required this.onSelected,
    required this.labelBuilder,
    this.leadingBuilder,
    this.validator,
    this.search = false,
    this.onlyInPageLeading = false,
    this.buttonWidth = 0,
  });

  @override
  Widget build(BuildContext context) {
    return _SelectionPageButton<T>(
      currentValue: currentValue,
      values: values,
      label: label,
      hint: hint,
      dialogAppBarTitle: dialogAppBarTitle,
      emptyPage: emptyPage,
      onSelected: onSelected,
      labelBuilder: labelBuilder,
      leadingBuilder: leadingBuilder,
      validator: validator,
      search: search,
      onlyInPageLeading: onlyInPageLeading,
      buttonWidth: buttonWidth,
      selectionPageBuilder: (context, field) => SelectionPageGeneric(
        title: dialogAppBarTitle,
        emptyPage: emptyPage,
        values: values,
        field: field,
        leadingBuilder: leadingBuilder != null
            ? (dynamic item) => leadingBuilder!(item as T)
            : null,
        labelBuilder: (dynamic item) => labelBuilder(item as T),
        onSelected: (dynamic item) => onSelected(item as T),
        search: search,
      ),
    );
  }
}

// One type selection page button with two different lists
class SelectionPageButtonSameType<T, T2, T3> extends StatelessWidget {
  final T currentValue;
  final T2 Function(FormFieldState<T>) current2Value;
  final T3 Function(FormFieldState<T>) current3Value;
  final List<T2> values;
  final List<T3> Function(T2) secondPageValues;
  final String label;
  final String hint;
  final String dialogAppBarTitle;
  final String secondPageDialogAppBarTitle;
  final String emptyPage;
  final String secondPageEmptyPage;
  final void Function(T2, FormFieldState<T>)? onSelected;
  final void Function(T2, T3, FormFieldState<T>) onSecondPageSelected;
  final void Function(FormFieldState<T>) onExit;
  final Widget Function(T)? leadingBuilder;
  final String Function(T) buttonLabelBuilder;
  final String Function(T2) labelBuilder;
  final String Function(T3) secondPageLabelBuilder;
  final String? Function(T?) validator;
  final double buttonWidth;
  final T secondPageCurrentValue;
  final bool search;
  final bool onlyInPageLeading;

  const SelectionPageButtonSameType({
    super.key,
    required this.currentValue,
    required this.values,
    required this.secondPageValues,
    required this.label,
    required this.hint,
    required this.dialogAppBarTitle,
    required this.secondPageDialogAppBarTitle,
    required this.emptyPage,
    required this.secondPageEmptyPage,
    this.onSelected,
    required this.onSecondPageSelected,
    required this.labelBuilder,
    required this.secondPageLabelBuilder,
    required this.buttonLabelBuilder,
    required this.validator,
    required this.onExit,
    this.leadingBuilder,
    this.search = false,
    this.onlyInPageLeading = false,
    this.buttonWidth = 0,
    required this.secondPageCurrentValue,
    required this.current2Value,
    required this.current3Value,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double buttonWidth = this.buttonWidth == 0
        ? size.width - AppSize.s24
        : this.buttonWidth;
    return FormField<T>(
      initialValue: currentValue,
      validator: validator,
      builder: (FormFieldState<T> field) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: AppPadding.p10),
              child: Text(label, style: Theme.of(context).textTheme.bodyMedium),
            ),
            ElevatedButton(
              style:
                  CustomElevatedButtonDecoration.customElevatedbuttonStyleNonSelectable(
                    context: context,
                    width: buttonWidth,
                    error: field.hasError,
                  ),
              onPressed: () async {
                await customRightNavigation(
                  context,
                  SelectionPageGeneric<T2>(
                    title: dialogAppBarTitle,
                    emptyPage: emptyPage,

                    values: values,
                    currentValue: current2Value(field),
                    labelBuilder: (dynamic item) => labelBuilder(item as T2),
                    search: search,
                    onItemTap: (item) async {
                      onSelected?.call(item, field);

                      await customRightNavigation(
                        context,
                        SelectionPageGeneric<T3>(
                          title: secondPageDialogAppBarTitle,
                          emptyPage: secondPageEmptyPage,
                          values: secondPageValues(item),
                          currentValue: current3Value(field),
                          labelBuilder: (dynamic item) =>
                              secondPageLabelBuilder(item),
                          onItemTap: (selectedItem) {
                            onSecondPageSelected(item, selectedItem, field);
                            Navigator.pop(context);
                            Navigator.pop(context);
                          },

                          search: search,
                        ),
                      );
                    },
                  ),
                );
                onExit(field);
              },
              child: SizedBox(
                width: buttonWidth - AppSize.s16,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        if (!onlyInPageLeading && leadingBuilder != null)
                          leadingBuilder!.call(field.value!),
                        SizedBox(
                          width: leadingBuilder == null
                              ? AppSize.s5
                              : AppSize.s12,
                        ),
                        Text(
                          field.value == null
                              ? hint
                              : buttonLabelBuilder(field.value!),
                          style: Theme.of(context).textTheme.labelLarge,
                        ),
                      ],
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: field.hasError
                          ? Theme.of(context).colorScheme.error
                          : Theme.of(context).colorScheme.primary,
                    ),
                  ],
                ),
              ),
            ),
            if (field.hasError)
              Padding(
                padding: const EdgeInsets.only(top: AppPadding.p8),
                child: Text(
                  field.errorText!,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
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

class SelectionPageButtonCar<T, T2> extends StatelessWidget {
  final T currentValue;
  final T2 current2Value;
  final bool Function(T)? isSelected;
  final bool Function(T2)? isSelected2;

  final List<T> values;
  final List<T2> Function(T) secondPageValues;
  final String label;
  final String hint;
  final String dialogAppBarTitle;
  final String secondPageDialogAppBarTitle;
  final String emptyPage;
  final String secondPageEmptyPage;
  final void Function(T, FormFieldState<T>)? onSelected;
  final void Function(T, T2, FormFieldState<T>) onSecondPageSelected;
  final void Function(FormFieldState<T>) onExit;
  final Widget Function(T)? leadingBuilder;
  final String Function(T) buttonLabelBuilder;
  final String Function(T) labelBuilder;
  final String Function(T2) secondPageLabelBuilder;
  final String? Function(T?) validator;
  final double buttonWidth;
  final T2 secondPageCurrentValue;
  final bool search;
  final bool onlyInPageLeading;

  const SelectionPageButtonCar({
    super.key,
    required this.currentValue,
    required this.values,
    required this.secondPageValues,
    required this.label,
    required this.hint,
    required this.dialogAppBarTitle,
    required this.secondPageDialogAppBarTitle,
    required this.emptyPage,
    required this.secondPageEmptyPage,
    this.onSelected,
    required this.onSecondPageSelected,
    required this.labelBuilder,
    required this.secondPageLabelBuilder,
    required this.buttonLabelBuilder,
    required this.validator,
    required this.onExit,
    this.leadingBuilder,
    this.isSelected,
    this.isSelected2,
    this.search = false,
    this.onlyInPageLeading = false,
    this.buttonWidth = 0,
    required this.secondPageCurrentValue,
    required this.current2Value,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double buttonWidth = this.buttonWidth == 0
        ? size.width - AppSize.s24
        : this.buttonWidth;
    return FormField<T>(
      initialValue: currentValue,
      validator: validator,
      builder: (FormFieldState<T> field) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: AppPadding.p10),
              child: Text(label, style: Theme.of(context).textTheme.bodyMedium),
            ),
            ElevatedButton(
              style:
                  CustomElevatedButtonDecoration.customElevatedbuttonStyleNonSelectable(
                    context: context,
                    width: buttonWidth,
                    error: field.hasError,
                  ),
              onPressed: () async {
                await customRightNavigation(
                  context,
                  SelectionPageGeneric<T>(
                    title: dialogAppBarTitle,
                    emptyPage: emptyPage,
                    leadingBuilder: leadingBuilder,
                    values: values,
                    currentValue: currentValue,

                    labelBuilder: (dynamic item) => labelBuilder(item),
                    isSelected: isSelected,
                    search: search,
                    onItemTap: (item) async {
                      onSelected?.call(item, field);

                      await customRightNavigation(
                        context,
                        SelectionPageGeneric<T2>(
                          title: secondPageDialogAppBarTitle,
                          emptyPage: secondPageEmptyPage,
                          values: secondPageValues(item),
                          currentValue: current2Value,

                          labelBuilder: (dynamic item) =>
                              secondPageLabelBuilder(item),
                          onItemTap: (selectedItem) {
                            onSecondPageSelected(item, selectedItem, field);
                            Navigator.pop(context);
                            Navigator.pop(context);
                          },

                          isSelected: isSelected2,
                          search: search,
                        ),
                      );
                    },
                  ),
                );
                onExit(field);
              },
              child: SizedBox(
                width: buttonWidth - AppSize.s16,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        if (!onlyInPageLeading && leadingBuilder != null)
                          leadingBuilder!.call(field.value!),
                        SizedBox(
                          width: leadingBuilder == null
                              ? AppSize.s5
                              : AppSize.s12,
                        ),
                        Text(
                          field.value == null
                              ? hint
                              : buttonLabelBuilder(field.value!),
                          style: Theme.of(context).textTheme.labelLarge,
                        ),
                      ],
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: field.hasError
                          ? Theme.of(context).colorScheme.error
                          : Theme.of(context).colorScheme.primary,
                    ),
                  ],
                ),
              ),
            ),
            if (field.hasError)
              Padding(
                padding: const EdgeInsets.only(top: AppPadding.p8),
                child: Text(
                  field.errorText!,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
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
