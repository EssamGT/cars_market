import 'package:assets/custom_icons_icons.dart';
import 'package:cars_market/globle/localization_service.dart';
import 'package:constants/strings_manager.dart';
import 'package:constants/values_manager.dart';
import 'package:data/models/car/brands_models/body_types.dart';
import 'package:data/models/car/brands_models/fuel_type.dart';
import 'package:data/models/car/brands_models/paint_colors.dart';
import 'package:data/models/car/brands_models/transmission_type.dart';
import 'package:domain/entity/car_entity.dart';
import 'package:flutter/material.dart';

// done
class CarSpecsWidget extends StatelessWidget {
  final CarEntity car;
  const CarSpecsWidget({super.key, required this.car});
  List<SpecData> specItems(CarEntity car) {
    final fullList = [
      SpecData(
        icon: CustomIcons.engine,
        title: StringsManager.engine,
        value: car.engineSpec.getEngineSpec(),
      ),
      SpecData(
        icon: CustomIcons.electric,
        title: StringsManager.hp,
        value: car.engineSpec.getHp(),
      ),
      SpecData(
        icon: CustomIcons.km,
        title: StringsManager.topSpeed,
        value: car.engineSpec.getTopSpeed(),
      ),
      SpecData(
        icon: CustomIcons.gearbox,
        title: StringsManager.detailsTransmissionLabel,
        value: car.transmissionType.getTransmissionTypeName(),
      ),
      SpecData(
        icon: CustomIcons.fuel,
        title: StringsManager.fuelTypeLabel,
        value: car.engineSpec.fuelType == FuelType.electric
            ? ''
            : car.engineSpec.fuelType.getFuelTypeName(),
      ),
      SpecData(
        icon: CustomIcons.bodyType,
        title: StringsManager.dBodyType,
        value: car.bodyType.getCarBodyTypeName(),
      ),
      SpecData(
        icon: CustomIcons.eco,
        title: StringsManager.fuelConsumptionDisplayLabel,
        value: car.engineSpec.getFuelConsumption(),
      ),
      SpecData(
        icon: CustomIcons.paintColor,
        title: StringsManager.paintColorLabel,
        value: car.paintColor.getColorName(),
      ),
    ];
    return fullList
        .where((e) => e.value.isNotEmpty && e.value != "null")
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: AppPadding.p10,
        right: AppPadding.p10,
      ),
      child: Column(
        children: [
          text(context),
          GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 2.6,
              crossAxisSpacing: AppSize.s10,
              mainAxisSpacing: AppSize.s10,
            ),
            padding: EdgeInsets.only(
              left: AppPadding.p10,
              right: AppPadding.p10,
              top: AppPadding.p16,
            ),
            itemCount: specItems(car).length,
            itemBuilder: (context, index) {
              return specItemWidget(
                context: context,
                specData: specItems(car)[index],
              );
            },
          ),
        ],
      ),
    );
  }

  Widget specItemWidget({
    required BuildContext context,
    required SpecData specData,
  }) {
    Size screenSize = MediaQuery.of(context).size;
    double iconSize = AppSize.s40;

    return Container(
      width: screenSize.width / 2.3,
      height: AppSize.s75,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppSize.s20),
        color: Theme.of(context).colorScheme.surfaceContainerHighest,
      ),
      padding: const EdgeInsets.symmetric(horizontal: AppPadding.p8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(
            specData.icon,
            color: Theme.of(context).colorScheme.primary,
            size: iconSize,
          ),
          SizedBox(width: AppSize.s5),
          Flexible(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  specData.title,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                FittedBox(
                  fit: BoxFit.scaleDown,
                  alignment: LocalizationService.isArabic(specData.value)
                      ? Alignment.centerRight
                      : Alignment.centerLeft,
                  child: Text(
                    specData.value,
                    maxLines: 1,
                    textDirection: LocalizationService.isArabic(specData.value)
                        ? TextDirection.rtl
                        : TextDirection.ltr,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget text(BuildContext context) {
    return Row(
      children: [
        Container(
          width: AppSize.s4,
          height: AppSize.s30,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
            borderRadius: BorderRadius.circular(AppSize.s2),
          ),
          margin: EdgeInsets.only(
            right: LocalizationService.isRTL ? 0 : AppMargin.m8,
            left: LocalizationService.isRTL ? AppMargin.m8 : 0,
          ),
        ),
        Container(
          alignment: Alignment.centerLeft,
          child: Text(
            StringsManager.spec,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ),
      ],
    );
  }
}

class SpecData {
  final String title;
  final String value;
  final IconData icon;

  const SpecData({
    required this.title,
    required this.value,
    required this.icon,
  });
}

// Padding(
//       padding: const EdgeInsets.all(AppPadding.p10),
//       child: Column(
//         children: [
//           text(context),
//           Container(
//             margin: const EdgeInsets.only(top: AppMargin.m20),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 specItemWidget(
//                   context: context,
//                   icon: CustomIcons.engine,
//                   title: StringsManager.engine,
//                   value: '${car.engineSpec.getEngineSpec()} ',
//                 ),
//                 specItemWidget(
//                   context: context,
//                   icon: CustomIcons.km,
//                   title: StringsManager.detailsKmLabel,
//                   value: car.getCarKM(),
//                 ),
//               ],
//             ),
//           ),
//           Container(
//             margin: const EdgeInsets.only(top: AppMargin.m12),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 specItemWidget(
//                   context: context,
//                   icon: CustomIcons.gearbox,
//                   title: StringsManager.detailsTransmissionLabel,
//                   value: car.transmissionType.getTransmissionTypeName(),
//                 ),
//                 specItemWidget(
//                   context: context,
//                   icon: CustomIcons.fuel,
//                   title: StringsManager.dFuel,
//                   value: car.engineSpec.fuelType.getFuelTypeName(),
//                 ),
//               ],
//             ),
//           ),
//           Container(
//             margin: const EdgeInsets.only(top: AppMargin.m12),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 specItemWidget(
//                   context: context,
//                   icon: CustomIcons.bodyType,
//                   title: StringsManager.dBodyType,
//                   value: car.bodyType.getCarBodyTypeName(),
//                 ),
//                 specItemWidget(
//                   context: context,
//                   icon: CustomIcons.paintColor,
//                   title: StringsManager.dPaintColor,
//                   value: car.paintColor.getColorName(),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
