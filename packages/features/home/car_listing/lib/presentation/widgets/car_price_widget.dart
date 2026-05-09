import 'package:constants/values_manager.dart';
import 'package:data/models/car/brands_models/car_condition.dart';
import 'package:data/models/car/brands_models/negotiation.dart';
import 'package:domain/entity/car_entity.dart';
import 'package:flutter/material.dart';

class CarPriceWidget extends StatelessWidget {
  final CarEntity car;
  const CarPriceWidget({super.key, required this.car});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: AppSize.s100,
      margin: EdgeInsets.symmetric(horizontal: AppPadding.p14),
      padding: EdgeInsets.all(AppPadding.p20),
      decoration: BoxDecoration(
        color: Theme.of(
          context,
        ).colorScheme.surfaceContainerHighest.withAlpha(248),
        borderRadius: BorderRadius.circular(AppSize.s15),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).shadowColor.withAlpha(60),
            offset: Offset(0, 2),
            blurRadius: AppSize.s6,
            spreadRadius: AppSize.s5,
            // blurStyle: BlurStyle.inner
          ),
        ],
      ),

      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "${car.brand} ${car.model} ${car.version}",
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                ),
              ),
              SizedBox(width: AppSize.s8),
              Text(
                car.getPrice(),
                style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ],
          ),
          SizedBox(height: AppSize.s5),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "${car.year} ${car.getCarKM(withDot: true)}",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              Text(
                "${car.carCondition.getConditionText()} · ${car.negotiable.getConditionDisplayText()}",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
