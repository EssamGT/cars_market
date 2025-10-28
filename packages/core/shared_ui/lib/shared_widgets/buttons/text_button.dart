import 'package:constants/values_manager.dart';
import 'package:flutter/material.dart';

class CTextButton extends StatelessWidget {
  final Function onTap;
  final String text;
  final double hight;
  final double width;
  final bool loading;
  final bool enable;
  final BorderRadius? radius;
  const CTextButton({
    super.key,
    required this.onTap,
    required this.text,
    this.hight = AppSize.s50,
    this.width = AppSize.s40,
    this.loading = false,
    this.radius,
    this.enable = true,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppPadding.p20),
      child: Center(
        child: FilledButton(
          onPressed: () => loading || !enable ? null : onTap(),
          style: FilledButton.styleFrom(
            minimumSize: Size(MediaQuery.of(context).size.width - width, hight),
            shape: RoundedRectangleBorder(
              borderRadius: radius ?? BorderRadius.circular(AppSize.s10),
            ),
            backgroundColor: enable
                ? Theme.of(context).colorScheme.primary
                : Theme.of(context).disabledColor,
            elevation: AppSize.s20,

            shadowColor: Theme.of(context).colorScheme.shadow,
          ),

          child: loading
              ? CircularProgressIndicator(
                  color: Theme.of(context).colorScheme.surface,
                  strokeWidth: AppSize.s1,
                  constraints: BoxConstraints(
                    minWidth: AppSize.s30,
                    minHeight: AppSize.s30,
                  ),
                )
              : Text(text, style: Theme.of(context).textTheme.titleMedium),
        ),
      ),
    );
  }
}
