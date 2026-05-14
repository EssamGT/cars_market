import 'package:flutter/material.dart';

class LanguageButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final bool isSelected;
  const LanguageButton({
    super.key,
    required this.title,
    required this.onTap,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title,style: Theme.of(context).textTheme.bodyMedium),
      onTap: onTap,
      selected: isSelected,
      trailing: isSelected
          ? Icon(Icons.check, color: Theme.of(context).colorScheme.primary)
          : null,
    );
  }
}
