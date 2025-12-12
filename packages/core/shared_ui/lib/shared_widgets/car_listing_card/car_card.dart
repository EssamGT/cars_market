import 'package:constants/values_manager.dart';
import 'package:domain/entity/car_entity.dart';
import 'package:flutter/material.dart';

class CarCard extends StatelessWidget {
  final CarEntity car;
  const CarCard({super.key, required this.car});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppSize.s350,
      margin: EdgeInsets.all(AppMargin.m14),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onSecondary,
        borderRadius: BorderRadius.circular(AppSize.s20),
        boxShadow: [
          BoxShadow(
            color: Theme.of(
              context,
            ).shadowColor.withAlpha(20), // very light (5%)
            blurRadius: AppSize.s6, // smaller blur for subtle depth
            spreadRadius: AppSize.s1, // minimal spread
            offset: const Offset(0, 2), // small downward offset
          ),
        ],
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadiusGeometry.only(
              topLeft: Radius.circular(AppSize.s20),
              topRight: Radius.circular(AppSize.s20),
            ),
            child: Transform.scale(
              scale: 1.2,
              child: Image.network(
              car.carImages!.first.url,  
                height: AppSize.s200,
                width: double.infinity,
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppPadding.p12,
              vertical: AppPadding.p16,
            ),
            child: Column(
              spacing: 5,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('${car.brand} ${car.model} ${car.version}', style: Theme.of(context).textTheme.bodyLarge),
                Text(
                  '${car.year} · ${car.mileage} KM',
                  style: Theme.of(context).textTheme.labelLarge,
                ),
                Row(
                  children: [
                    Icon(Icons.location_on_outlined, size: AppSize.s20),
                    SizedBox(width: AppSize.s2),
                    Text(
                      car.location.structuredFormatting.mainText,
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                  ],
                ),
                Text(
                  '${car.price} EGP',
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
