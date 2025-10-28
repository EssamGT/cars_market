import 'package:assets/assets_manager.dart';
import 'package:constants/constants_manager.dart';
import 'package:constants/strings_manager.dart';
import 'package:constants/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:router/routes_manager.dart';

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

  static successPopUp(context) {
    Size screenSize = MediaQuery.of(context).size;
    double width = screenSize.width / 1.4;
    Future.delayed(AppConstants.timeoutDuration, () {
      context.go(RoutesManager.home);
    });
    return showDialog(
      traversalEdgeBehavior: TraversalEdgeBehavior.parentScope,
      barrierDismissible: false,
      useRootNavigator: false,
      fullscreenDialog: false,
      animationStyle: AnimationStyle(
        curve: Curves.easeInBack,
        duration: Duration(milliseconds: 300),
      ),
      useSafeArea: true,
      requestFocus: false,
      context: context,
      builder: (context) {
        return Center(
          child: Container(
            decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
              borderRadius: BorderRadius.circular(AppSize.s20),
            ),
            constraints: BoxConstraints(
              maxWidth: width,
              minHeight: screenSize.height / 3,
            ),
            child: Column(
              spacing: AppSize.s15,
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: width,
                  height: screenSize.height / 6,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(AppSize.s20),
                      topRight: Radius.circular(AppSize.s20),
                    ),
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  child: Center(
                    child: Lottie.asset(
                      AssetsManager.success,
                      package: AppConstants.assetsPackage,
                    ),
                  ),
                ),
                Text(
                  StringsManager.success,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                Text(
                  StringsManager.carListedSuccessfully,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                FilledButton(
                  style: ButtonStyle(),
                  onPressed: () {
                    context.go(RoutesManager.home);
                  },
                  child: Text(
                    StringsManager.okay,
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
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
          width: width,
          height: screenSize.height / 3,
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
              Text(
                type == PopupType.loading
                    ? StringsManager.listingYourCar
                    : type == PopupType.success
                    ? StringsManager.carListedSuccessfully
                    : errorMessage,
                style: Theme.of(context).textTheme.bodyMedium,
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
            ],
          ),
        ),
      ),
    );
  }
}
