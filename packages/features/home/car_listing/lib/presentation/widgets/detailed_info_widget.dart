import 'package:cars_market/globle/localization_service.dart';
import 'package:constants/strings_manager.dart';
import 'package:constants/values_manager.dart';
import 'package:data/models/car/brands_models/air_con_types.dart';
import 'package:data/models/car/brands_models/body_types.dart';
import 'package:data/models/car/brands_models/car_condition.dart';
import 'package:data/models/car/brands_models/engine_spec.dart';
import 'package:data/models/car/brands_models/fuel_type.dart';
import 'package:data/models/car/brands_models/interior_type.dart';
import 'package:data/models/car/brands_models/paint_colors.dart';
import 'package:data/models/car/brands_models/payment_options.dart';
import 'package:data/models/car/brands_models/transmission_type.dart';
import 'package:domain/entity/car_entity.dart';
import 'package:flutter/material.dart';

// done
class DetailedInfoWidget extends StatelessWidget {
  final CarEntity car;
  const DetailedInfoWidget({super.key, required this.car});
  List<DetailsItem> getInfoList(CarEntity car) {
    List<DetailsItem> fullList = [
      DetailsItem(title: StringsManager.brand, subTitle: car.brand),
      DetailsItem(title: StringsManager.model, subTitle: car.model),
      DetailsItem(title: StringsManager.version, subTitle: car.version!),

      DetailsItem(
        title: StringsManager.yearLabel,
        subTitle: car.year.toString(),
      ),
      DetailsItem(
        title: StringsManager.carConditionLabel,
        subTitle: car.carCondition.getConditionText(),
      ),
      DetailsItem(
        title: StringsManager.dCylinderNumber,
        subTitle: car.engineSpec.engineCylinderNumber
            .getEngineCylinderNumberNameOnly(),
      ),

      DetailsItem(
        title: StringsManager.dEngineCapacity,
        subTitle: car.engineSpec.engineCapacity.getEngineCapacityName(),
      ),
      DetailsItem(
        title: StringsManager.detailsKmLabel,
        subTitle: car.getCarKM(),
      ),

      DetailsItem(title: StringsManager.hp, subTitle: car.engineSpec.getHp()),

      DetailsItem(
        title: StringsManager.topSpeed,
        subTitle: car.engineSpec.getTopSpeed(),
      ),

      DetailsItem(
        title: StringsManager.fuelConsumption,
        subTitle: car.engineSpec.getFuelConsumption(),
      ),
      DetailsItem(
        title: StringsManager.detailsTransmissionLabel,
        subTitle: car.transmissionType.getTransmissionTypeName(),
      ),
      DetailsItem(
        title: StringsManager.dFuel,
        subTitle: car.engineSpec.fuelType.getFuelTypeName(),
      ),
      DetailsItem(
        title: StringsManager.dBodyType,
        subTitle: car.bodyType.getCarBodyTypeName(),
      ),
      DetailsItem(
        title: StringsManager.dPaintColor,
        subTitle: car.paintColor.getColorName(),
      ),
      DetailsItem(
        title: StringsManager.dPaintCondition,
        subTitle: car.paintCondition.getPaintConditionText(),
      ),
      DetailsItem(
        title: StringsManager.paymentOptionLabel,
        subTitle: car.paymentOptions.getText,
      ),
      DetailsItem(
        title: StringsManager.detailsSeatNumberLabel,
        subTitle: car.seatsNumber!,
      ),
      DetailsItem(
        title: StringsManager.detailsAcTypeLabel,
        subTitle: car.airConType.getTextForDetails,
      ),
      DetailsItem(
        title: StringsManager.detailsInteriorTypeLabel,
        subTitle: car.interiorType.getTextForDetails,
      ),
    ];
    return fullList
        .where((e) => e.subTitle.isNotEmpty && e.subTitle != "null")
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    EdgeInsets padding = MediaQuery.paddingOf(context);
    return Container(
      decoration: BoxDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          title(context),
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            padding: EdgeInsets.only(top: AppPadding.p16),
            itemCount: 5,
            itemBuilder: (context, index) => info(
              context: context,
              title: getInfoList(car)[index].title,
              subTitle: getInfoList(car)[index].subTitle,
              colored: index % 2 == 0,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppPadding.p20,
              vertical: AppPadding.p5,
            ),
            child: TextButton(
              onPressed: () {
                showModalBottomSheet(
                  constraints: BoxConstraints(
                    minHeight: size.height - (kToolbarHeight + padding.top),
                    maxHeight: size.height - (kToolbarHeight + padding.top),
                  ),
                  context: context,
                  isScrollControlled: true,
                  backgroundColor: Colors.transparent,
                  builder: (context) =>
                      DetailsScreen(detailsItems: getInfoList(car)),
                );
              },

              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(StringsManager.seeAll),
                  SizedBox(width: AppSize.s4),
                  Icon(Icons.arrow_forward_ios_rounded),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget title(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: AppMargin.m10),
      // alignment: Alignment.centerLeft,
      child: Text(
        StringsManager.details,
        style: Theme.of(context).textTheme.headlineSmall,
      ),
    );
  }
}

class DetailsScreen extends StatelessWidget {
  final List<DetailsItem> detailsItems;
  const DetailsScreen({super.key, required this.detailsItems});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.vertical(top: Radius.circular(AppSize.s20)),
      ),
      padding: const EdgeInsets.only(bottom: AppPadding.p16),
      child: Column(
        // mainAxisSize: MainAxisSize.maz,
        children: [
          SizedBox(height: AppSize.s10),
          // Optional: Add a drag handle
          Container(
            width: AppSize.s40,
            height: AppSize.s4,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
              borderRadius: BorderRadius.circular(AppSize.s2),
            ),
          ),
          SizedBox(height: AppSize.s10),
          Container(
            alignment: LocalizationService.isRTL
                ? Alignment.centerRight
                : Alignment.centerLeft,
            padding: const EdgeInsets.symmetric(
              horizontal: AppPadding.p20,
              vertical: AppPadding.p16,
            ),
            child: Text(
              StringsManager.details,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ),
          // SizedBox(height: AppSize.s10),
          Flexible(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: detailsItems.length,

              itemBuilder: (context, index) {
                return info(
                  context: context,
                  title: detailsItems[index].title,
                  subTitle: detailsItems[index].subTitle,
                  colored: index % 2 == 0,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

Widget info({
  required BuildContext context,
  required String title,
  required String? subTitle,
  String? title2,
  String? subTitle2,
  bool colored = false,
}) {
  Size size = MediaQuery.sizeOf(context);
  return Visibility(
    visible: subTitle != null && subTitle.isNotEmpty,
    child: Container(
      margin: const EdgeInsets.symmetric(horizontal: AppMargin.m20),
      padding: const EdgeInsets.symmetric(
        horizontal: AppPadding.p10,
        vertical: AppPadding.p10,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppSize.s8),

        color: colored
            ? Theme.of(context).colorScheme.surfaceContainerHighest
            : Theme.of(context).colorScheme.surface,
      ),
      constraints: BoxConstraints(minHeight: AppSize.s40),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: size.width / 2.7,
            child: Text(
              subTitle2 != null ? "$title | $title2" : title,
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ),

          Flexible(
            child: Text(
              subTitle2 != null ? "$subTitle | $subTitle2" : subTitle!,
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.start,
            ),
          ),
        ],
      ),
    ),
  );
}

class DetailsItem {
  final String title;
  final String subTitle;

  DetailsItem({required this.title, required this.subTitle});
}
