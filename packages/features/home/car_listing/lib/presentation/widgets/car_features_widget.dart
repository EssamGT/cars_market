import 'package:cars_market/globle/localization_service.dart';
import 'package:constants/strings_manager.dart';
import 'package:constants/values_manager.dart';
import 'package:data/models/car/brands_models/features_model.dart';
import 'package:domain/entity/car_entity.dart';
import 'package:flutter/material.dart';

class CarFeaturesWidget extends StatelessWidget {
  final CarEntity car;
  const CarFeaturesWidget({super.key, required this.car});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    EdgeInsets padding = MediaQuery.paddingOf(context);
    if (car.features == null || car.features!.isEmpty) {
      return SizedBox.shrink();
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          // alignment: Alignment.centerLeft,
          margin: const EdgeInsets.symmetric(horizontal: AppMargin.m10),
          child: Text(
            StringsManager.detailsFeaturesLabel,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ),
        SizedBox(height: AppSize.s10),
        FeaturesGroup(features: car.features!.first),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppPadding.p20,
            // vertical: AppPadding.p5,
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
                    FeaturesScreen(featuresList: car.features!),
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
    );
  }
}

class FeaturesScreen extends StatelessWidget {
  final List<FeaturesList> featuresList;
  const FeaturesScreen({super.key, required this.featuresList});

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
              StringsManager.detailsFeaturesLabel,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ),
          // SizedBox(height: AppSize.s10),
          Flexible(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: featuresList.length,

              itemBuilder: (context, index) {
                return FeaturesGroup(
                  features: featuresList[index],
                  display: false,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class FeaturesGroup extends StatelessWidget {
  final FeaturesList features;
  final bool display;
  const FeaturesGroup({super.key, required this.features, this.display = true});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (!display)
          Container(
            alignment: LocalizationService.isRTL
                ? Alignment.centerRight
                : Alignment.centerLeft,
            padding: EdgeInsets.symmetric(horizontal: AppPadding.p20),
            child: Text(
              features.title,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
        ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,

          itemCount: display
              ? (features.features.length / 4).ceil()
              : features.features.length,
          padding: display
              ? EdgeInsets.zero
              : EdgeInsets.symmetric(vertical: AppPadding.p16),
          itemBuilder: (context, index) {
            return FeatureTile(feature: features.features[index]);
          },
        ),
      ],
    );
  }
}

class FeatureTile extends StatelessWidget {
  final FeatureModel feature;
  const FeatureTile({super.key, required this.feature});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: AppMargin.m20),
      padding: const EdgeInsets.symmetric(
        // horizontal: AppPadding.p10,
        // vertical: AppPadding.p10,
      ),

      child: ListTile(
        contentPadding: EdgeInsets.zero,
        leading: SizedBox(
          height: AppSize.s40,
          width: AppSize.s40,
          child: Icon(
            feature.icon,
            size: feature.iconSize ?? AppSize.s30,
            color: Theme.of(context).colorScheme.onError,
          ),
        ),
        titleAlignment: ListTileTitleAlignment.center,

        title: Text(
          feature.name,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ),
    );
  }
}
