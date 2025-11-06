import 'package:constants/strings_manager.dart';
import 'package:constants/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:redacted/redacted.dart';
import 'package:shared_ui/shared_widgets/text_field/validate/text_filed_validate.dart';

class PhoneNumberTextField extends StatelessWidget {
  final TextEditingController controller;
  final bool isEnabled;
  final void Function(PhoneNumber)? onInputChanged;
  final PhoneNumber? number;
  final FocusNode? phoneFocusNode;
  final bool loading;
  const PhoneNumberTextField({
    super.key,
    required this.controller,
    this.isEnabled = true,
    this.onInputChanged,
    this.number,
    this.phoneFocusNode,
    this.loading = false,
  });

  @override
  Widget build(BuildContext context) {
    // String initialCountry = 'EG';
    // PhoneNumber number = PhoneNumber(
    //   isoCode: initialCountry,
    //   phoneNumber: controller.text,
    // );
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppPadding.p16,
        vertical: AppPadding.p8,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: AppPadding.p12),
            child: Text(
              StringsManager.phoneNumber,
              // textAlign: TextAlign.start,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
          loading
              ? Container(
                  width: double.infinity,
                  height: AppSize.s60,
                  decoration: BoxDecoration(
                    color: Theme.of(
                      context,
                    ).colorScheme.surfaceContainerHighest,
                    borderRadius: BorderRadius.circular(AppSize.s8),
                  ),
                  child: Text('        '),
                ).redacted(context: context, redact: loading)
              : InternationalPhoneNumberInput(
                  onInputChanged: onInputChanged,
                  focusNode: phoneFocusNode,
                  autoFocus: false,
                  isEnabled: isEnabled,
                  selectorConfig: const SelectorConfig(
                    selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                    useEmoji: true,
                    showFlags: true,
                    useBottomSheetSafeArea: true,
                    trailingSpace: false,
                  ),
                  hintText: StringsManager.phoneNumberEx,
                  initialValue: number,
                  autoValidateMode: AutovalidateMode.onUnfocus,
                  autoFocusSearch: false,
                  textFieldController: controller,
                  formatInput: false,
                  maxLength: 11,
                  validator: (phoneNumber) => TextFieldValidator.validateNormal(
                    TextFieldValidationType.phone,
                    phoneNumber!,
                  ),
                  keyboardType: const TextInputType.numberWithOptions(
                    signed: true,
                    decimal: true,
                  ),
                  selectorTextStyle: Theme.of(context).textTheme.bodyLarge,
                ),
        ],
      ),
    );
  }
}
