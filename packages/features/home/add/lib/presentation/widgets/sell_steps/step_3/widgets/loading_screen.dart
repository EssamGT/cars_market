import 'package:assets/assets_manager.dart';
import 'package:constants/constants_manager.dart';
import 'package:constants/strings_manager.dart';
import 'package:constants/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

enum PopupType { loading, success, error }

class PopUpManager {
  static OverlayEntry? _popupEntry;

  static void show({
    required BuildContext context,
    required PopupType type,
    String? errorMessage,
  }) {
    if (_popupEntry != null) {
      hide();
    }
    // already showing

    _popupEntry = OverlayEntry(
      builder: (_) =>
          _PopupWidget(type: type, errorMessage: errorMessage ?? ""),
    );

    Overlay.of(context, rootOverlay: true).insert(_popupEntry!);
  }

  static void hide() {
    _popupEntry?.remove();
    _popupEntry = null;
  }
}

class _PopupWidget extends StatelessWidget {
  final PopupType type;
  final String errorMessage;

  const _PopupWidget({required this.type, this.errorMessage = ""});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double width = screenSize.width / 1.4;
    return Material(
      color: Colors.black45,
      child: Center(
        child: Container(
          constraints: BoxConstraints(
            maxWidth: width,
            minHeight: screenSize.height / 3,
          ),
          decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            spacing: AppSize.s10,

            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: EdgeInsets.all(AppPadding.p5),
                width: width,
                height: screenSize.height / 6,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(20),
                  ),
                ),
                child: Center(
                  child: Lottie.asset(
                    type == PopupType.loading
                        ? AssetsManager.loading
                        : type == PopupType.success
                        ? AssetsManager.success
                        : AssetsManager.error,
                    package: AppConstants.assetsPackage,
                  ),
                ),
              ),
              Visibility(
                visible: type == PopupType.loading,
                child: const SizedBox(height: 8),
              ),
              Text(
                type == PopupType.loading
                    ? StringsManager.loading
                    : type == PopupType.success
                    ? StringsManager.success
                    : StringsManager.oops,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              Padding(
                padding: const EdgeInsets.all(AppPadding.p12),
                child: Text(
                  type == PopupType.loading
                      ? StringsManager.listingYourCar
                      : type == PopupType.success
                      ? StringsManager.carListedSuccessfully
                      : errorMessage,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),

              Visibility(
                visible: type == PopupType.success,
                child: FilledButton(
                  style: ButtonStyle(),
                  onPressed: () {
                    if (context.canPop()) {
                      context.pop();
                      PopUpManager.hide();
                    }
                  },
                  child: Text(
                    StringsManager.okay,
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ),
              ),
              Visibility(
                visible: type == PopupType.error,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: AppPadding.p12),
                  child: FilledButton(
                    style: ButtonStyle(),
                    onPressed: () {
                      if (context.canPop()) {
                        PopUpManager.hide();
                      }
                    },
                    child: Text(
                      StringsManager.okay,
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
