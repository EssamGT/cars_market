import 'package:assets/custom_icons_icons.dart';
import 'package:constants/strings_manager.dart';
import 'package:constants/values_manager.dart';
import 'package:domain/entity/car_entity.dart';
import 'package:flutter/material.dart';
import 'package:shared_ui/shared_widgets/car_listing_card/details_screen_widgets/shared_func.dart';

// done
class CarSpecsWidget extends StatelessWidget {
  final CarEntity car;
  const CarSpecsWidget({super.key, required this.car});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppPadding.p10),
      child: Column(
        children: [
          text(context),
          Container(
            margin: const EdgeInsets.only(top: AppMargin.m20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                specItemWidget(
                  context: context,
                  icon: CustomIcons.engine,
                  title: StringsManager.engine,
                  value:
                      '${engineCapacityFormater(car.engineCapacity)} ${engineCyFormater(car.engineCylinderNumber)} ',
                ),
                specItemWidget(
                  context: context,
                  icon: CustomIcons.mileage,
                  title: StringsManager.dMileage,
                  value: '${mileageFormater(car.mileage)} km',
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: AppMargin.m12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                specItemWidget(
                  context: context,
                  icon: CustomIcons.gearbox,
                  title: StringsManager.dGearbox,
                  value: car.gearboxType,
                ),
                specItemWidget(
                  context: context,
                  icon: CustomIcons.fuel,
                  title: StringsManager.dFuel,
                  value: car.fuelType,
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: AppMargin.m12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                specItemWidget(
                  context: context,
                  icon: CustomIcons.bodyType,
                  title: StringsManager.dBodyType,
                  value: car.bodyType,
                ),
                specItemWidget(
                  context: context,
                  icon: CustomIcons.paintColor,
                  title: StringsManager.dPaintColor,
                  value: car.paintColor,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget specItemWidget({
    required BuildContext context,
    required IconData icon,
    required String title,
    required String value,
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
            icon,
            color: Theme.of(context).colorScheme.primary,
            size: iconSize,
          ),
          SizedBox(width: AppSize.s5),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: Theme.of(context).textTheme.bodySmall),
              Text(value, style: Theme.of(context).textTheme.bodyMedium),
            ],
          ),
        ],
      ),
    );
  }

  String engineCapacityFormater(String engineCapacity) {
    if (engineCapacity.length < 4) {
      return '0.${engineCapacity[0]}L';
    }
    return '${engineCapacity[0]}.${engineCapacity[1]}L';
  }

  String engineCyFormater(String engineCy) {
    if (engineCy == 'I6' || engineCy == 'V6') {
      return engineCy;
    } else if (engineCy == '3' || engineCy == '4') {
      return 'I$engineCy';
    } else {
      return 'V$engineCy';
    }
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
          margin: const EdgeInsets.only(right: AppMargin.m8),
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
