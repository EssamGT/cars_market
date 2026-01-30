import 'package:constants/strings_manager.dart';
import 'package:constants/values_manager.dart';
import 'package:domain/entity/car_entity.dart';
import 'package:flutter/material.dart';

// done
class CarSafetyWidget extends StatelessWidget {
  final CarEntity car;
  const CarSafetyWidget({super.key, required this.car});

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: car.safetyOptions.isNotEmpty,
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: AppMargin.m10),
            child: ExpansionTile(
              title: title(context),
              minTileHeight: AppSize.s30,
              children: [info(context, car.safetyOptions)],
            ),
          ),
        ],
      ),
    );
  }

  Widget title(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      child: Text(
        StringsManager.safetyOptions,
        style: Theme.of(context).textTheme.headlineSmall,
      ),
    );
  }

  Widget info(BuildContext context, List<String> title) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: AppMargin.m10,
        vertical: AppMargin.m2,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppSize.s8),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).colorScheme.shadow.withAlpha(40),
            blurRadius: AppSize.s5,
            blurStyle: BlurStyle.outer,
            offset: const Offset(0, 0),
          ),
        ],
      ),
      child: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: title.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Icon(
              Icons.check_circle_outline,
              color: Theme.of(context).colorScheme.primary,
            ),
            title: Text(
              title[index],
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          );
        },
      ),
    );
  }
}
