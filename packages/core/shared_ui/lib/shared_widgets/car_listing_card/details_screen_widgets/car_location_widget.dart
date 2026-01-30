import 'package:constants/strings_manager.dart';
import 'package:constants/values_manager.dart';
import 'package:domain/entity/car_entity.dart';
import 'package:flutter/material.dart';
import 'package:location_display/presentation/location_widget.dart';
// done 
class CarLocationWidget extends StatelessWidget {
  final CarEntity car;
  const CarLocationWidget({super.key, required this.car});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.only(left: AppPadding.p10, bottom: AppPadding.p10),
          alignment: Alignment.centerLeft,
          child: Text(
            StringsManager.dLocation,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ),
      LocationWidget(car: car,),
      ],
    );
  }
}
