import 'package:constants/strings_manager.dart';

enum CarStatus { active, deactivated, pendingReview, rejected }

extension CarStatusExtension on CarStatus {
  String get tName {
    switch (this) {
      case CarStatus.active:
        return StringsManager.active;
      case CarStatus.deactivated:
        return StringsManager.deactivated;
      case CarStatus.pendingReview:
        return StringsManager.pendingReview;
      case CarStatus.rejected:
        return StringsManager.rejected;
    }
  }
}
