import 'package:cars_market/globle/localization_service.dart';
import 'package:constants/strings_manager.dart';
import 'package:constants/values_manager.dart';
import 'package:domain/entity/car_entity.dart';
import 'package:flutter/material.dart';
import 'package:google_places_service/presentation/location_widget/location_widget.dart';

// done
class CarLocationWidget extends StatelessWidget {
  final CarEntity car;
  const CarLocationWidget({super.key, required this.car});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.only(
            left: LocalizationService.isRTL ? 0 : AppPadding.p10,
            right: LocalizationService.isRTL ? AppPadding.p10 : 0,
            bottom: AppPadding.p10,
          ),
          // alignment: Alignment.centerLeft,
          child: Text(
            StringsManager.dLocation,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ),
        LocationWidget(car: car),
      ],
    );
  }
}
