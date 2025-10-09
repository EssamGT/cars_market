import 'package:constants/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:shared_ui/shared_widgets/text_field/validate/text_filed_validate.dart';

// ignore: must_be_immutable
class NormalTextField extends StatefulWidget {
  final int? maxLength;
  final TextFieldValidationType validationType;
  final String hint;
  final String title;
  final int? maxLiens;
  final int? minLiens;
  final TextInputType? keybordType;
  final ValueChanged<String> onChanged;
  final bool counter;
  String gvalue;
  NormalTextField({
    super.key,
    required this.hint,
    required this.onChanged,
    required this.title,
    this.maxLiens,
    this.minLiens,
    this.maxLength,
    this.validationType = TextFieldValidationType.none,
    this.keybordType,
    this.counter = false,
    required this.gvalue,
  });

  @override
  State<NormalTextField> createState() => _NormalTextFieldState();
}

class _NormalTextFieldState extends State<NormalTextField> {
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
          validator: (value) =>
              TextFieldValidator.validateNormal(widget.validationType, value!),
          autovalidateMode: AutovalidateMode.onUnfocus,

          onChanged: (value) => widget.onChanged(value),
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
