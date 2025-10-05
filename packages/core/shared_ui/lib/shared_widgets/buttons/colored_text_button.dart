import 'package:constants/values_manager.dart';
import 'package:flutter/material.dart';

class ColoredTextButton extends StatelessWidget {
  final VoidCallback onTap;
  final String text;
  final MainAxisAlignment align;
  final EdgeInsets padding;
  final TextStyle style;
  final bool loading;
  const ColoredTextButton({
    super.key,
    required this.onTap,
    required this.text,
    this.align = MainAxisAlignment.center,
    this.padding = const EdgeInsets.all(AppPadding.p8),
    this.style = const TextStyle(),
    this.loading = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: align,
      children: [
        TextButton(
          style: ButtonStyle(
            padding: WidgetStateProperty.all(padding),
            overlayColor: WidgetStateProperty.all(
              Theme.of(context).colorScheme.surface,
            ),
          ),
          onPressed: loading ? () {} : onTap,

          child: Text(text, style: style),
        ),
      ],
    );
  }
}
