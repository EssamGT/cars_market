import 'package:constants/values_manager.dart';
import 'package:flutter/material.dart';

class TwoTextButton extends StatelessWidget {
  final String t1;
  final String t2;
  final EdgeInsets padding;
  final VoidCallback onTap;
  final bool loading;
  const TwoTextButton({
    super.key,
    required this.t1,
    required this.t2,
    this.loading = false,
    this.padding = const EdgeInsets.only(
      bottom: AppPadding.p16,
      top: AppPadding.p8,
    ),
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(t1, style: Theme.of(context).textTheme.bodySmall),
          GestureDetector(
            onTap: loading ? () {} : onTap,
            child: Text(t2, style: Theme.of(context).textTheme.bodyMedium),
          ),
        ],
      ),
    );
  }
}
