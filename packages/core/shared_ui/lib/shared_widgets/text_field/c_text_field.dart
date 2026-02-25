import 'package:constants/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:redacted/redacted.dart';
import 'package:shared_ui/shared_widgets/text_field/validate/text_field_validate.dart';

class CTextField extends StatefulWidget {
  final TextEditingController controller;
  final String hint;
  final String label;
  final bool loading;
  final bool enabled;
  final FocusNode? myNode;
  final FocusNode? next;
  final VoidCallback? supmit;
  final Function(String)? onChanged;
  final TextFieldValidationType validationType;
  const CTextField({
    super.key,
    required this.controller,
    required this.hint,
    required this.validationType,
    this.myNode,
    this.label = '',
    this.supmit,
    this.onChanged,
    this.enabled = true,
    this.loading = false,

    this.next,
  });

  @override
  State<CTextField> createState() => _CTextFieldState();
}

class _CTextFieldState extends State<CTextField> {
  late bool obsec;
  @override
  void initState() {
    if (widget.validationType == TextFieldValidationType.password ||
        widget.validationType == TextFieldValidationType.loginPassword) {
      obsec = true;
    } else {
      obsec = false;
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppPadding.p16,
        vertical: AppPadding.p8,
      ),
      child: widget.loading
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                if (widget.label.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: AppPadding.p10,
                    ),
                    child: Text(
                      widget.label,
                      textAlign: TextAlign.start,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                Container(
                  width: double.infinity,
                  height: AppSize.s60,
                  decoration: BoxDecoration(
                    color: Theme.of(
                      context,
                    ).colorScheme.surfaceContainerHighest,
                    borderRadius: BorderRadius.circular(AppSize.s8),
                  ),
                  child: Text('        '),
                ).redacted(context: context, redact: widget.loading),
              ],
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                if (widget.label.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: AppPadding.p10,
                    ),
                    child: Text(
                      widget.label,
                      textAlign: TextAlign.start,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                TextFormField(
                  focusNode: widget.myNode,
                  enabled: widget.enabled,

                  controller: widget.controller,
                  obscureText: obsec,
                  obscuringCharacter: '*',
                  decoration: InputDecoration(
                    hintText: widget.hint,
                    suffixIcon:
                        widget.validationType ==
                                TextFieldValidationType.password ||
                            widget.validationType ==
                                TextFieldValidationType.confirmPassword ||
                            widget.validationType ==
                                TextFieldValidationType.loginPassword
                        ? IconButton(
                            isSelected: obsec,
                            onPressed: () {
                              obsec = !obsec;
                              setState(() {});
                            },
                            icon: Icon(
                              Icons.visibility_off,
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                            selectedIcon: Icon(
                              Icons.visibility,
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                            style: ButtonStyle(
                              elevation: WidgetStatePropertyAll(AppSize.s20),
                            ),
                          )
                        : SizedBox(),
                  ),
                  style: Theme.of(context).textTheme.bodyLarge,
                  validator: (value) => TextFieldValidator.validateNormal(
                    widget.validationType,
                    value!,
                  ),
                  onChanged: widget.onChanged,
                  autovalidateMode: AutovalidateMode.onUnfocus,
                  onTapOutside: (event) {
                    FocusScope.of(context).unfocus();
                  },
                  key: widget.key,
                  textInputAction: widget.next != null
                      ? TextInputAction.next
                      : TextInputAction.done,
                  onFieldSubmitted: (_) {
                    if (widget.next != null) {
                      FocusScope.of(context).requestFocus(widget.next);
                    } else {
                      FocusScope.of(context).unfocus();
                      if (widget.supmit != null) {
                        widget.supmit!();
                      }
                    }
                  },
                ),
              ],
            ),
    );
  }
}
