import 'package:constants/strings_manager.dart';
import 'package:constants/values_manager.dart';
import 'package:data/models/car/brands_models/body_types.dart';
import 'package:data/models/car/brands_models/engine_spec.dart';
import 'package:data/models/car/brands_models/fuel_type.dart';
import 'package:data/models/car/brands_models/paint_colors.dart';
import 'package:data/models/car/brands_models/transmission_type.dart';
import 'package:domain/entity/car_entity.dart';
import 'package:flutter/material.dart';
import 'package:shared_ui/shared_widgets/car_listing_card/details_screen_widgets/shared_func.dart';

// done
class DetailedInfoWidget extends StatelessWidget {
  final CarEntity car;
  const DetailedInfoWidget({super.key, required this.car});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: AppMargin.m10),

          child: ExpansionTile(
            minTileHeight: AppSize.s30,

            title: title(context),
            children: [
              info(context, StringsManager.dbrand, car.brand),
              info(context, StringsManager.dmodel, car.model),
              info(context, StringsManager.dyear, car.year.toString()),
              Visibility(
                visible: car.version?.isNotEmpty ?? false,
                child: info(context, StringsManager.version, car.version!),
              ),
              info(
                context,
                StringsManager.dCylinderNumber,
                engineCyFormater(car.engineSpec.engineCylinderNumber.getEngineCylinderNumberName()),
              ),
              info(
                context,
                StringsManager.dEngineCapacity,
                car.engineSpec.engineCapacity.getEngineCapacityName(),
              ),
              info(
                context,
                StringsManager.dMileage,
                '${mileageFormater(car.km)} km',
              ),
              info(
                context,
                StringsManager.dGearbox,
                car.transmissionType.getTransmissionTypeName(),
              ),
              info(
                context,
                StringsManager.dFuel,
                car.engineSpec.fuelType.getFuelTypeName(),
              ),
              info(
                context,
                StringsManager.dBodyType,
                car.bodyType.getCarBodyTypeName(),
              ),
              info(
                context,
                StringsManager.dPaintColor,
                car.paintColor.getColorName(),
              ),
              info(
                context,
                StringsManager.dPaintCondition,
                car.paintCondition.getPaintConditionText(),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget title(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      child: Text(
        StringsManager.detailedInformation,
        style: Theme.of(context).textTheme.headlineSmall,
      ),
    );
  }

  Widget info(BuildContext context, String title, String subTitle) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: AppMargin.m10,
        vertical: AppMargin.m2,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppSize.s8),
        border: Border(
          bottom: BorderSide(
            color: Theme.of(context).colorScheme.shadow,
            width: AppSize.s0_5,
          ),
        ),
        // boxShadow: [
        //   BoxShadow(
        //     color: Theme.of(context).colorScheme.shadow.withAlpha(40),
        //     blurRadius: AppSize.s5,
        //     blurStyle: BlurStyle.outer,
        //     offset: const Offset(0, 0),
        //   ),
        // ],
      ),
      child: ListTile(
        title: Text(title, style: Theme.of(context).textTheme.bodySmall),
        trailing: Text(subTitle, style: Theme.of(context).textTheme.bodyMedium),
      ),
    );
  }

  String engineCyFormater(String engineCy) {
    if (engineCy == 'I6' || engineCy == 'V6') {
      return engineCy[1];
    } else {
      return engineCy;
    }
  }
}
