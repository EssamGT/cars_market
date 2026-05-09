import 'package:cars_market/di/di.dart';
import 'package:constants/strings_manager.dart';
import 'package:constants/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:shared_ui/shared_widgets/pop_up/loading_pop_up.dart';
import 'package:update_user_data/presentation/cubit/update_user_data_cubit.dart';

class DeleteAccountButton extends StatelessWidget {
  const DeleteAccountButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppPadding.p40),
      child: FilledButton(
        onPressed: () {
          LoadingPopUp.show(
            context: context,
            type: PopupType.custom,
            title: StringsManager.deleteAccount,
            content: StringsManager.deleteAccountConfirmation,
            confirmText: StringsManager.delete,
            cancelText: StringsManager.cancel,
            onConfirm: () {
              getIt.get<UpdateUserDataCubit>().userDelete();
            },
          );
        },
        style: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(Colors.transparent),
          side: WidgetStatePropertyAll(
            BorderSide(color: Theme.of(context).colorScheme.error),
          ),
          overlayColor: WidgetStatePropertyAll(
            Theme.of(context).colorScheme.error.withAlpha(20),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.logout, color: Theme.of(context).colorScheme.error),
            SizedBox(width: 8),
            Text(
              StringsManager.deleteAccount,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: Theme.of(context).colorScheme.error,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
