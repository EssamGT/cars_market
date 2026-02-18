import 'package:constants/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:shared_ui/shared_widgets/buttons/elevated_button_decoration.dart';
import 'package:shared_ui/shared_widgets/pop_up/pop_up.dart';
import 'package:shared_ui/shared_widgets/selection_page/new_selection_page.dart';

// Base generic selection page button (private)
class _NewSelectionPageButton<T> extends StatelessWidget {
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

  const _NewSelectionPageButton({
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
class NewSelectionPageButton<T> extends StatelessWidget {
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

  const NewSelectionPageButton({
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
    return _NewSelectionPageButton<T>(
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
      selectionPageBuilder: (context, field) => NewSelectionPageGeneric(
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

// Two-types selection page button for pages with different types on first and second page
// class NewSelectionPageButtonTwoTypes<T1, T2> extends StatelessWidget {
//   final T1 currentValue;
//   final List<T1> values;
//   final List<T2> Function(T1) secondPageValues;
//   final String label;
//   final String hint;
//   final String dialogAppBarTitle;
//   final String secondPageDialogAppBarTitle;
//   final String emptyPage;
//   final String secondPageEmptyPage;
//   final void Function(T1) onSelected;
//   final void Function(T2) onSecondPageSelected;
//   final Widget Function(T1)? leadingBuilder;
//   final String Function(T1, T2) buttonLabelBuilder;
//   final String Function(T1) labelBuilder;
//   final String Function(T2) secondPageLabelBuilder;
//   final String? Function(T1?) validator;
//   final double buttonWidth;
//   final T2 secondPageCurrentValue;
//   final bool search;
//   final bool onlyInPageLeading;

//   const NewSelectionPageButtonTwoTypes({
//     super.key,
//     required this.currentValue,
//     required this.values,
//     required this.secondPageValues,
//     required this.label,
//     required this.hint,
//     required this.dialogAppBarTitle,
//     required this.secondPageDialogAppBarTitle,
//     required this.emptyPage,
//     required this.secondPageEmptyPage,
//     required this.onSelected,
//     required this.onSecondPageSelected,
//     required this.buttonLabelBuilder,
//     required this.secondPageLabelBuilder,
//     this.leadingBuilder,
//     required this.validator,
//     this.search = false,
//     this.onlyInPageLeading = false,
//     this.buttonWidth = 0,
//     required this.secondPageCurrentValue,
//     required this.labelBuilder,
//   });

//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     double buttonWidth = this.buttonWidth == 0
//         ? size.width - AppSize.s24
//         : this.buttonWidth;
//     return FormField<T1>(
//       initialValue: currentValue,
//       validator: validator,
//       builder: (FormFieldState<T1> field) {
//         return Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Padding(
//               padding: const EdgeInsets.symmetric(vertical: AppPadding.p10),
//               child: Text(label, style: Theme.of(context).textTheme.bodyMedium),
//             ),
//             ElevatedButton(
//               style:
//                   CustomElevatedButtonDecoration.customElevatedbuttonStyleNonSelectable(
//                     context: context,
//                     width: buttonWidth,
//                     error: field.hasError,
//                   ),
//               onPressed: () async {
//                 customRightNavigation(
//                   context,
//                   NewSelectionPageGeneric<T1>(
//                     title: dialogAppBarTitle,
//                     emptyPage: emptyPage,
//                     values: values,
//                     field: field,
//                     leadingBuilder: leadingBuilder != null
//                         ? (dynamic item) => leadingBuilder!(item as T1)
//                         : null,
//                     labelBuilder: (dynamic item) => labelBuilder(item as T1),
//                     onSelected: (dynamic item) => onSelected(item as T1),
//                     search: search,
//                     onItemTap: (dynamic item) {
//                       final typedItem = item as T1;
//                       onSelected(typedItem);
//                       field.didChange(typedItem);
//                       // Navigate to second page
//                       customRightNavigation(
//                         context,
//                         NewSelectionPageGeneric<T2>(
//                           title: secondPageDialogAppBarTitle,
//                           emptyPage: secondPageEmptyPage,
//                           values: secondPageValues(typedItem),
//                           currentValue: secondPageCurrentValue!,
//                           labelBuilder: (dynamic item) =>
//                               secondPageLabelBuilder(item as T2),
//                           onSelected: (dynamic selectedItem) {
//                             onSecondPageSelected(selectedItem as T2);

//                             field.validate();
//                             Navigator.pop(context); // Close second page
//                             // Navigator.pop(context); // Close first page
//                           },
//                           search: search,
//                         ),
//                       );
//                     },
//                   ),
//                 );
//               },
//               child: SizedBox(
//                 width: buttonWidth - AppSize.s16,
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Row(
//                       children: [
//                         ?onlyInPageLeading
//                             ? null
//                             : leadingBuilder?.call(field.value!),
//                         SizedBox(
//                           width: leadingBuilder == null
//                               ? AppSize.s5
//                               : AppSize.s12,
//                         ),
//                         Text(
//                           field.value == null
//                               ? hint
//                               : buttonLabelBuilder(
//                                   field.value!,
//                                   secondPageCurrentValue!,
//                                 ),
//                           style: Theme.of(context).textTheme.labelLarge,
//                         ),
//                       ],
//                     ),
//                     Icon(
//                       Icons.arrow_forward_ios,
//                       color: field.hasError
//                           ? Theme.of(context).colorScheme.error
//                           : Theme.of(context).colorScheme.primary,
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             if (field.hasError)
//               Padding(
//                 padding: const EdgeInsets.only(top: AppPadding.p8),
//                 child: Text(
//                   field.errorText!,
//                   style: Theme.of(context).textTheme.bodySmall?.copyWith(
//                     color: Theme.of(context).colorScheme.error,
//                   ),
//                 ),
//               ),
//           ],
//         );
//       },
//     );
//   }
// }

// class NewSelectionPageButtonTypes<T> extends StatelessWidget {
//   final T currentValue;
//   final List values;
//   final List Function(T) secondPageValues;
//   final String label;
//   final String hint;
//   final String dialogAppBarTitle;
//   final String secondPageDialogAppBarTitle;
//   final String emptyPage;
//   final String secondPageEmptyPage;
//   final void Function(T) onSelected;
//   final void Function(T) onSecondPageSelected;
//   final Widget Function(T)? leadingBuilder;
//   final String Function(T) buttonLabelBuilder;
//   final String Function(T) labelBuilder;
//   final String Function(T) secondPageLabelBuilder;
//   final String? Function(T?) validator;
//   final double buttonWidth;
//   final T secondPageCurrentValue;
//   final bool search;
//   final bool onlyInPageLeading;

//   const NewSelectionPageButtonTypes({
//     super.key,
//     required this.currentValue,
//     required this.values,
//     required this.secondPageValues,
//     required this.label,
//     required this.hint,
//     required this.dialogAppBarTitle,
//     required this.secondPageDialogAppBarTitle,
//     required this.emptyPage,
//     required this.secondPageEmptyPage,
//     required this.onSelected,
//     required this.onSecondPageSelected,
//     required this.buttonLabelBuilder,
//     required this.secondPageLabelBuilder,
//     this.leadingBuilder,
//     required this.validator,
//     this.search = false,
//     this.onlyInPageLeading = false,
//     this.buttonWidth = 0,
//     required this.secondPageCurrentValue,
//     required this.labelBuilder,
//   });

//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     double buttonWidth = this.buttonWidth == 0
//         ? size.width - AppSize.s24
//         : this.buttonWidth;
//     return FormField<T>(
//       initialValue: currentValue,
//       validator: validator,
//       builder: (FormFieldState<T> field) {
//         return Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Padding(
//               padding: const EdgeInsets.symmetric(vertical: AppPadding.p10),
//               child: Text(label, style: Theme.of(context).textTheme.bodyMedium),
//             ),
//             ElevatedButton(
//               style:
//                   CustomElevatedButtonDecoration.customElevatedbuttonStyleNonSelectable(
//                     context: context,
//                     width: buttonWidth,
//                     error: field.hasError,
//                   ),
//               onPressed: () async {
//                 customRightNavigation(
//                   context,
//                   NewSelectionPageGeneric<T>(
//                     title: dialogAppBarTitle,
//                     emptyPage: emptyPage,
//                     dynamicValues: values,
//                     field: field,
//                     leadingBuilder: leadingBuilder != null
//                         ? (dynamic item) => leadingBuilder!(item as T)
//                         : null,
//                     labelBuilder: (dynamic item) => labelBuilder(item as T),
//                     onSelected: (dynamic item) => onSelected(item as T),
//                     search: search,
//                     onItemTap: (dynamic item) {
//                       final typedItem = item as T;
//                       onSelected(typedItem);
//                       field.didChange(typedItem);
//                       // Navigate to second page
//                       customRightNavigation(
//                         context,
//                         NewSelectionPageGeneric<T>(
//                           title: secondPageDialogAppBarTitle,
//                           emptyPage: secondPageEmptyPage,
//                           dynamicValues: secondPageValues(typedItem),
//                           currentValue: secondPageCurrentValue!,
//                           field: field,
//                           labelBuilder: (dynamic item) =>
//                               secondPageLabelBuilder(item as T),
//                           onSelected: (dynamic selectedItem) {
//                             onSecondPageSelected(selectedItem as T);

//                             field.validate();
//                             Navigator.pop(context); // Close second page
//                             // Navigator.pop(context); // Close first page
//                           },
//                           search: search,
//                         ),
//                       );
//                     },
//                   ),
//                 );
//               },
//               child: SizedBox(
//                 width: buttonWidth - AppSize.s16,
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Row(
//                       children: [
//                         ?onlyInPageLeading
//                             ? null
//                             : leadingBuilder?.call(field.value!),
//                         SizedBox(
//                           width: leadingBuilder == null
//                               ? AppSize.s5
//                               : AppSize.s12,
//                         ),
//                         Text(
//                           field.value == null
//                               ? hint
//                               : buttonLabelBuilder(field.value!),
//                           style: Theme.of(context).textTheme.labelLarge,
//                         ),
//                       ],
//                     ),
//                     Icon(
//                       Icons.arrow_forward_ios,
//                       color: field.hasError
//                           ? Theme.of(context).colorScheme.error
//                           : Theme.of(context).colorScheme.primary,
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             if (field.hasError)
//               Padding(
//                 padding: const EdgeInsets.only(top: AppPadding.p8),
//                 child: Text(
//                   field.errorText!,
//                   style: Theme.of(context).textTheme.bodySmall?.copyWith(
//                     color: Theme.of(context).colorScheme.error,
//                   ),
//                 ),
//               ),
//           ],
//         );
//       },
//     );
//   }
// }

// One type selection page button with two different lists
class NewSelectionPageButtonSameType<T, T2, T3> extends StatelessWidget {
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

  const NewSelectionPageButtonSameType({
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
                  NewSelectionPageGeneric<T2>(
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
                        NewSelectionPageGeneric<T3>(
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
