import 'dart:math';

import 'package:constants/strings_manager.dart';
import 'package:constants/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:shared_ui/shared_widgets/text_field/validate/text_filed_validate.dart';

class TextFieldButton extends StatefulWidget {
  final int? maxLength;
  final TextFieldValidationType validationType;
  // final String hint;
  final String title;
  final int? maxLiens;
  final int? minLiens;
  final TextInputType? keybordType;
  final bool counter;
  final VoidCallback onPressed;
  final String gvalue;
  final bool enable;
  const TextFieldButton({
    super.key,
    // required this.hint,
    required this.title,
    this.maxLiens,
    this.minLiens,
    this.maxLength,
    this.validationType = TextFieldValidationType.none,
    this.keybordType,
    this.counter = false,
    required this.gvalue,
    required this.onPressed,
    this.enable = true,
  });

  @override
  State<TextFieldButton> createState() => _TextFieldButtonState();
}

class _TextFieldButtonState extends State<TextFieldButton> {
  late TextEditingController controller;
  @override
  void initState() {
    controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.value = controller.value.copyWith(
        text: widget.gvalue,
        selection: TextSelection.collapsed(offset: widget.gvalue.length),
        composing: TextRange.empty,
      );
    });
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
          readOnly: true,
          enabled: widget.enable,
          controller: controller,
          decoration: InputDecoration(
            hintText: StringsManager.chose,

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
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Theme.of(context).colorScheme.outline,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(AppSize.s8),
            ),
            suffixIcon: Icon(
              Icons.arrow_forward_ios_sharp,
              color: Theme.of(context).colorScheme.outline,
              size: AppSize.s20,
            ),
          ),
          onTap: widget.onPressed,
          minLines: widget.minLiens,
          maxLines: widget.maxLiens,
          style: Theme.of(context).textTheme.bodyMedium,
          validator: (value) =>
              TextFieldValidator.validateNormal(widget.validationType, value!),
          autovalidateMode: AutovalidateMode.onUserInteraction,
          // onChanged: (value) {
          //   controller.text = widget.gvalue;
          // },
          textInputAction: TextInputAction.done,
          keyboardType: widget.keybordType,

          autofocus: false,

          onTapOutside: (event) {
            FocusScope.of(context).unfocus();
          },
        ),
      ],
    );
  }
}
