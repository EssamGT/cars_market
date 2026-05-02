import 'package:constants/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:shared_ui/shared_widgets/text_field/validate/text_field_validate.dart';

class TwoPasswordTextFiled extends StatefulWidget {
  final TextEditingController controller1;
  final TextEditingController controller2;
  final FocusNode? myNode1;
  final FocusNode? myNode2;
  final String label1;
  final String label2;
  final String hint1;
  final String hint2;
  final bool loading;
  final VoidCallback? submit;
  final TextFieldValidationType validationType;
  const TwoPasswordTextFiled({
    super.key,
    required this.controller1,
    required this.controller2,
    required this.hint1,
    required this.hint2,
    required this.validationType,
    required this.myNode1,
    required this.myNode2,
    this.label1 = '',
    this.label2 = '',
    this.submit,
    this.loading = false,
  });

  @override
  State<TwoPasswordTextFiled> createState() => _TwoPasswordTextFiledState();
}

class _TwoPasswordTextFiledState extends State<TwoPasswordTextFiled> {
  late bool obsec;
  late bool obsec2;
  @override
  void initState() {
    if (widget.validationType == TextFieldValidationType.password ||
        widget.validationType == TextFieldValidationType.loginPassword ||
        widget.validationType == TextFieldValidationType.confirmPassword ||
        widget.validationType == TextFieldValidationType.newPassword) {
      obsec = true;
      obsec2 = true;
    } else {
      obsec = false;
      obsec2 = false;
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          if (widget.label1.isNotEmpty)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: AppPadding.p10),
              child: Text(
                widget.label1,
                textAlign: TextAlign.start,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
          TextFormField(
            focusNode: widget.myNode1,
            enabled: !widget.loading,
            controller: widget.controller1,
            obscureText: obsec,
            obscuringCharacter: '*',
            decoration: InputDecoration(
              hintText: widget.hint1,
              suffixIcon:
                  widget.validationType == TextFieldValidationType.password ||
                      widget.validationType ==
                          TextFieldValidationType.confirmPassword ||
                      widget.validationType ==
                          TextFieldValidationType.newPassword ||
                      widget.validationType ==
                          TextFieldValidationType.loginPassword
                  ? IconButton(
                      isSelected: obsec,
                      onPressed: () {
                        obsec = !obsec;
                        // print(widget.passwordC);
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
              TextFieldValidationType.password,
              value!,
            ),
            autovalidateMode: AutovalidateMode.onUnfocus,
            textInputAction: widget.myNode2 != null
                ? TextInputAction.next
                : TextInputAction.done,
            onFieldSubmitted: (_) {
              if (widget.myNode2 != null) {
                FocusScope.of(context).requestFocus(widget.myNode2);
              } else {
                FocusScope.of(context).unfocus();
              }
            },
          ),
          SizedBox(height: AppSize.s16),
          if (widget.label2.isNotEmpty)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: AppPadding.p10),
              child: Text(
                widget.label2,
                textAlign: TextAlign.start,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
          TextFormField(
            focusNode: widget.myNode2,
            enabled: !widget.loading,
            controller: widget.controller2,
            obscureText: obsec2,
            obscuringCharacter: '*',
            decoration: InputDecoration(
              hintText: widget.hint2,
              suffixIcon: IconButton(
                isSelected: obsec2,
                onPressed: () {
                  obsec2 = !obsec2;
                  // print(widget.passwordC);
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
              ),
            ),
            style: Theme.of(context).textTheme.bodyLarge,
            validator: (value) => TextFieldValidator.twoPasswordValidator(
              value!,
              widget.controller1.text,
            ),
            autovalidateMode: AutovalidateMode.onUnfocus,
            textInputAction: TextInputAction.done,
            onFieldSubmitted: (_) {
              FocusScope.of(context).unfocus();
              if (widget.submit != null) {
                widget.submit!();
              }
            },
          ),
        ],
      ),
    );
  }
}
