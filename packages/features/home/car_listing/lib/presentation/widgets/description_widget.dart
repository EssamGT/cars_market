import 'package:cars_market/globle/localization_service.dart';
import 'package:constants/strings_manager.dart';
import 'package:constants/values_manager.dart';
import 'package:domain/entity/car_entity.dart';
import 'package:flutter/material.dart';

// done
class DescriptionWidget extends StatelessWidget {
  final CarEntity car;
  const DescriptionWidget({super.key, required this.car});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: AppMargin.m10),
            // alignment: Alignment.centerLeft,
            child: Text(
              StringsManager.description,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ),

          Container(
            margin: const EdgeInsets.symmetric(
              horizontal: AppMargin.m10,
              vertical: AppMargin.m14,
            ),
            padding: EdgeInsets.symmetric(vertical: AppPadding.p5),

            alignment: LocalizationService.isArabic(car.description)
                ? Alignment.centerRight
                : Alignment.centerLeft,
            child: Text(
              car.description,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
        ],
      ),
    );
  }
}
