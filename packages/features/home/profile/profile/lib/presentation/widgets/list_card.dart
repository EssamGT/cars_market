import 'package:constants/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ListCard extends StatelessWidget {
  final String route;
  final IconData icon;
  final String title;

  const ListCard({
    super.key,
    required this.route,
    required this.icon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        context.push(route);
      },
      contentPadding: const EdgeInsets.symmetric(
        horizontal: AppPadding.p20,
        vertical: AppPadding.p5,
      ),
      leading: Icon(icon, color: Theme.of(context).colorScheme.onError),
      title: Text(title, style: Theme.of(context).textTheme.bodyMedium),
      trailing: Icon(
        Icons.arrow_forward_ios_outlined,
        size: 16,
        color: Theme.of(context).colorScheme.onSurfaceVariant,
      ),
    );
  }
}

class ListCardToggle extends StatelessWidget {
  final IconData icon;
  final String title;
  final void Function(bool)? onChanged;
  final bool value;

  const ListCardToggle({
    super.key,
    required this.icon,
    required this.title,
    required this.onChanged,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(
        horizontal: AppPadding.p20,
        vertical: AppPadding.p5,
      ),
      leading: Icon(icon, color: Theme.of(context).colorScheme.onError),
      title: Text(title, style: Theme.of(context).textTheme.bodyMedium),
      trailing: Switch(
        value: value,
        onChanged: onChanged,
        activeThumbColor: Theme.of(context).colorScheme.primary,
      ),
    );
  }
}
