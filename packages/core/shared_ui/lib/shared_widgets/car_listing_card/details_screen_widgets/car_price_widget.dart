import 'package:constants/strings_manager.dart';
import 'package:constants/values_manager.dart';
import 'package:data/models/car/brands_models/negotiation.dart';
import 'package:domain/entity/car_entity.dart';
import 'package:flutter/material.dart';
import 'package:shared_ui/shared_widgets/car_listing_card/details_screen_widgets/shared_func.dart';

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
              Text(
                "${car.brand} ${car.model} ${car.version}",
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              Text(
                '${priceFormater(car.price)} ${StringsManager.egp}',
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
                "${StringsManager.dmodel} ${car.year}",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              Text(
                car.negotiable == NegotiationType.yes
                    ? StringsManager.negotiablePrice
                    : StringsManager.nonNegotiablePrice,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
