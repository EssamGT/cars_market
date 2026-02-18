import 'package:cached_network_image/cached_network_image.dart';
import 'package:constants/strings_manager.dart';
import 'package:constants/values_manager.dart';
import 'package:domain/entity/car_entity.dart';
import 'package:flutter/material.dart';
import 'package:redacted/redacted.dart';
import 'package:shared_ui/shared_widgets/car_listing_card/car_details_screen.dart';
import 'package:shared_ui/shared_widgets/car_listing_card/details_screen_widgets/shared_func.dart';

String heroTag(String carId, int index) => 'carImageHeroTag_${carId}_$index';

class CarCard extends StatefulWidget {
  final CarEntity car;
  const CarCard({super.key, required this.car});

  @override
  State<CarCard> createState() => _CarCardState();
}

class _CarCardState extends State<CarCard> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return GestureDetector(
      onTap: () async {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CarDetailsScreen(car: widget.car),
          ),
        );
      },
      child: Container(
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
            Hero(
              transitionOnUserGestures: true,
              tag: heroTag(widget.car.carId, 0),
              // make tag unique for each car
              flightShuttleBuilder:
                  (
                    flightContext,
                    animation,
                    flightDirection,
                    fromHeroContext,
                    toHeroContext,
                  ) {
                    return toHeroContext.widget;
                  },
              child: ClipRRect(
                borderRadius: BorderRadiusGeometry.only(
                  topLeft: Radius.circular(AppSize.s20),
                  topRight: Radius.circular(AppSize.s20),
                ),
                child: CachedNetworkImage(
                  imageUrl: widget.car.carImages.first.url,
                  height: AppSize.s200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => Container(
                    decoration: BoxDecoration(
                      color: Theme.of(
                        context,
                      ).colorScheme.surfaceContainerHighest,
                      borderRadius: BorderRadiusGeometry.only(
                        topLeft: Radius.circular(AppSize.s20),
                        topRight: Radius.circular(AppSize.s20),
                      ),
                    ),

                    height: AppSize.s200,
                    width: double.infinity,
                  ).redacted(context: context, redact: true),

                  errorWidget: (context, url, error) => Icon(Icons.error),
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
                  Text(
                    '${widget.car.brand} ${widget.car.model} ${widget.car.version}',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  Text(
                    '${widget.car.year} · ${priceFormater(widget.car.km)} KM',
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                  Row(
                    children: [
                      Icon(Icons.location_on_outlined, size: AppSize.s20),
                      SizedBox(width: AppSize.s2),
                      Text(
                        widget.car.location.structuredFormatting.mainText,
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                    ],
                  ),
                  Text(
                    '${priceFormater(widget.car.price)} ${StringsManager.egp}',
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
