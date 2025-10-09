import 'package:constants/values_manager.dart';
import 'package:flutter/material.dart';

class CarCard extends StatelessWidget {
  const CarCard({super.key});

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
                'https://www.cnet.com/a/img/resize/7411f2fbb73e8a8f323cdb227ca198d4d3d2a3cf/hub/2021/10/13/b8024a0e-b1a4-400c-96d5-1d68ee22e498/2022-bmw-m5-cs-011.jpg?auto=webp&width=1920',
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
                Text('BMW M5 CS', style: Theme.of(context).textTheme.bodyLarge),
                Text(
                  '2025 · 15,000 KM',
                  style: Theme.of(context).textTheme.labelLarge,
                ),
                Row(
                  children: [
                    Icon(Icons.location_on_outlined, size: AppSize.s20),
                    SizedBox(width: AppSize.s2),
                    Text(
                      '5 Setelment, Cairo',
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                  ],
                ),
                Text(
                  '15,000,000 EGP',
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
