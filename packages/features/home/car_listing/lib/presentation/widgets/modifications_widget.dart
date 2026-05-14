import 'package:cars_market/globle/localization_service.dart';
import 'package:constants/strings_manager.dart';
import 'package:constants/values_manager.dart';
import 'package:domain/entity/car_entity.dart';
import 'package:flutter/material.dart';

// done
class Modifications extends StatelessWidget {
  final CarEntity car;
  const Modifications({super.key, required this.car});

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: car.modifications?.isNotEmpty ?? false,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppSize.s20),
          color: Theme.of(context).colorScheme.surfaceContainerHighest,
        ),
        padding: const EdgeInsets.all(AppPadding.p8),
        margin: const EdgeInsets.symmetric(
          horizontal: AppMargin.m16,
          // vertical: AppMargin.m6,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(
                left: AppMargin.m10,
                top: AppMargin.m10,
              ),
              alignment: LocalizationService.isRTL
                  ? Alignment.centerRight
                  : Alignment.centerLeft,
              child: Text(
                StringsManager.modificationsLabel,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),

            Container(
              margin: const EdgeInsets.only(
                top: AppMargin.m5,
                bottom: AppMargin.m10,
              ),
              padding: const EdgeInsets.all(AppPadding.p12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppSize.s8),
              ),
              alignment: LocalizationService.isArabic(car.modifications!)
                  ? Alignment.centerRight
                  : Alignment.centerLeft,
              child: Text(
                car.modifications!,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
