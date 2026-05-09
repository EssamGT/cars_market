import 'package:assets/assets_manager.dart';
import 'package:constants/constants_manager.dart';
import 'package:constants/strings_manager.dart';
import 'package:constants/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

enum PopupType { loading, loadingDots, fullScreenLoadingDots, exit, custom }

class LoadingPopUp {
  static OverlayEntry? _popupEntry;

  static void show({
    required BuildContext context,
    required PopupType type,
    String? title,
    String? content,
    String? confirmText,
    String? cancelText,
    VoidCallback? onConfirm,
    String? errorMessage,
  }) {
    if (_popupEntry != null) {
      hide();
    }
    // already showing

    _popupEntry = OverlayEntry(
      builder: (_) => switch (type) {
        PopupType.loading => _PopupWidget(type: type),
        PopupType.loadingDots => _LoadingDots(type: type),
        PopupType.fullScreenLoadingDots => _LoadingDots(type: type),
        PopupType.exit => _ExitDialog(type: type),
        PopupType.custom => _CustomDialog(
          type: type,
          title: title!,
          content: content!,
          confirmText: confirmText!,
          cancelText: cancelText!,
          onConfirm: onConfirm!,
        ),
      },
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

  const _PopupWidget({required this.type});

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

  const _LoadingDots({required this.type});

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

class _ExitDialog extends StatelessWidget {
  final PopupType type;

  const _ExitDialog({required this.type});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double width = screenSize.width / 1.5;

    return GestureDetector(
      onTap: () {
        LoadingPopUp.hide();
      },
      child: Material(
        color: Colors.black45,
        child: GestureDetector(
          onTap: () {},
          child: Center(
            child: Container(
              width: width,
              constraints: BoxConstraints(maxHeight: screenSize.height * 0.6),
              decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                borderRadius: BorderRadius.circular(AppSize.s20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              padding: EdgeInsets.all(AppPadding.p24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header with close button
                  Text(
                    StringsManager.confirmExitLab,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: AppSize.s16),

                  // Content
                  Text(
                    StringsManager.confirmExitSub,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Colors.grey[600],
                      height: 1.5,
                    ),
                  ),
                  SizedBox(height: AppSize.s32),

                  // Buttons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () => LoadingPopUp.hide(),
                        child: Text(
                          StringsManager.cancel,
                          style: Theme.of(context).textTheme.labelLarge,
                        ),
                      ),
                      SizedBox(width: AppSize.s12),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                          LoadingPopUp.hide();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Theme.of(context).primaryColor,
                          foregroundColor: Colors.white,
                          padding: EdgeInsets.symmetric(
                            horizontal: AppPadding.p24,
                            vertical: AppPadding.p12,
                          ),
                        ),
                        child: Text(StringsManager.exit),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _CustomDialog extends StatelessWidget {
  final PopupType type;
  final String title;
  final String content;
  final String confirmText;
  final String cancelText;
  final VoidCallback onConfirm;

  const _CustomDialog({
    required this.type,
    required this.title,
    required this.content,
    required this.confirmText,
    required this.cancelText,
    required this.onConfirm,
  });

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double width = screenSize.width / 1.5;

    return GestureDetector(
      onTap: () {
        LoadingPopUp.hide();
      },
      child: Material(
        color: Colors.black45,
        child: GestureDetector(
          onTap: () {},
          child: Center(
            child: Container(
              width: width,
              constraints: BoxConstraints(maxHeight: screenSize.height * 0.6),
              decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                borderRadius: BorderRadius.circular(AppSize.s20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              padding: EdgeInsets.all(AppPadding.p24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header with close button
                  Text(
                    title,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: AppSize.s16),

                  // Content
                  Text(
                    content,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Colors.grey[600],
                      height: 1.5,
                    ),
                  ),
                  SizedBox(height: AppSize.s32),

                  // Buttons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () => LoadingPopUp.hide(),
                        child: Text(
                          cancelText,
                          style: Theme.of(context).textTheme.labelLarge,
                        ),
                      ),
                      SizedBox(width: AppSize.s12),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                          LoadingPopUp.hide();
                          onConfirm();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Theme.of(context).primaryColor,
                          foregroundColor: Colors.white,
                          padding: EdgeInsets.symmetric(
                            horizontal: AppPadding.p24,
                            vertical: AppPadding.p12,
                          ),
                        ),
                        child: Text(confirmText),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// class _FullScreenLoadingDots extends StatelessWidget {
//   final PopupType type;

//   const _FullScreenLoadingDots({required this.type});

//   @override
//   Widget build(BuildContext context) {
//     return Material(
//       color: Colors.black45,
//       child: Container(
//         child: Center(
//           child: Lottie.asset(
//             AssetsManager.loadingDots,
//             package: AppConstants.assetsPackage,
//           ),
//         ),
//       ),
//     );
//   }
// }
