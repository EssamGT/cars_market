import 'package:assets/assets_manager.dart';
import 'package:constants/constants_manager.dart';
import 'package:constants/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

enum PopupType { loading, loadingDots }

class LoadingPopUp {
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
      builder: (_) => type == PopupType.loading
          ? _PopupWidget(type: type, errorMessage: errorMessage ?? "")
          : _LoadingDots(type: type, errorMessage: errorMessage ?? ""),
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
    double width = screenSize.width / 2.5;
    return Material(
      color: Colors.black45,
      child: Center(
        child: Container(
          width: width,
          height: screenSize.height / 5,
          decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            borderRadius: BorderRadius.circular(AppSize.s20),
          ),
          child: Center(
            child: CircularProgressIndicator(
              padding: EdgeInsets.all(AppPadding.p50),
              strokeWidth: 1.5,
              strokeAlign: 5,
            ),
          ),
        ),
      ),
    );
  }
}

class _LoadingDots extends StatelessWidget {
  final PopupType type;
  final String errorMessage;

  const _LoadingDots({required this.type, this.errorMessage = ""});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black45,
      child: Center(
        child: Lottie.asset(
          AssetsManager.loadingDots,
          package: AppConstants.assetsPackage,
        ),
      ),
    );
  }
}
