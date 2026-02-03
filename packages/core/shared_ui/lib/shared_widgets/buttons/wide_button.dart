import 'package:constants/strings_manager.dart';
import 'package:constants/values_manager.dart';
import 'package:flutter/material.dart';

class WideButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  final String chose;
  final bool enable;
  final bool error;
  final String? errorMessage;
  const WideButton({
    super.key,
    required this.onPressed,
    required this.title,

    this.chose = '',
    this.enable = true,
    required this.error,
    this.errorMessage,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: Theme.of(context).textTheme.bodyMedium),
        SizedBox(height: AppSize.s10),
        OutlinedButton(
          onPressed: enable ? onPressed : () {},
          style: ButtonStyle(
            backgroundColor: WidgetStatePropertyAll(
              Theme.of(context).colorScheme.surfaceContainerHighest,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                chose.isEmpty ? StringsManager.choose : chose,
                style: Theme.of(context).textTheme.labelLarge,
              ),
              Icon(
                Icons.arrow_forward_ios,
                color: Theme.of(context).colorScheme.outline,
              ),
            ],
          ),
        ),
        Visibility(
          visible: error,
          child: Column(
            children: [
              SizedBox(height: AppSize.s10),
              Text(
                "$errorMessage",
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color: Theme.of(context).colorScheme.error,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
// Container(
//         width: screenSize.width,
//         height: AppSize.s50,
//         padding: EdgeInsets.all(AppPadding.p8),
//         decoration: BoxDecoration(
//           color: Theme.of(context).colorScheme.onSecondary,
//           borderRadius: BorderRadius.circular(AppSize.s8),
//           boxShadow: [
//             BoxShadow(
//               color: Theme.of(context).colorScheme.shadow,
//               blurRadius: AppSize.s2,
//               spreadRadius: AppSize.s1,
//             ),
//           ],