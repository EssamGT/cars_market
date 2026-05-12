import 'package:cached_network_image/cached_network_image.dart';
import 'package:constants/values_manager.dart';
import 'package:data/models/car/brands_models/car_condition.dart';
import 'package:domain/entity/car_entity.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:redacted/redacted.dart';
import 'package:router/routes_manager.dart';

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
        context.push(RoutesManager.carDetails, extra: widget.car);
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
                  placeholder: (context, url) =>
                      Container(
                        color: Theme.of(
                          context,
                        ).colorScheme.surfaceContainerHighest,
                        height: AppSize.s200,
                        width: double.infinity,
                      ).redacted(
                        context: context,
                        redact: true,
                        configuration: RedactedConfiguration(
                          defaultBorderRadius: BorderRadius.only(
                            topLeft: Radius.circular(AppSize.s20),
                            topRight: Radius.circular(AppSize.s20),
                          ),
                        ),
                      ),

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
                    '${widget.car.year} ${widget.car.getCarKM(withDot: true)}',
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                  Transform.translate(
                    offset: Offset(-4, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      // spacing: AppSize.s,
                      children: [
                        Icon(Icons.location_on_outlined, size: AppSize.s20),

                        Text(
                          widget.car.location.getLocationName(),
                          style: Theme.of(context).textTheme.labelLarge,
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        widget.car.getPrice(),
                        style: Theme.of(context).textTheme.titleMedium!
                            .copyWith(
                              color: Theme.of(context).colorScheme.primary,
                            ),
                      ),
                      Text(
                        widget.car.carCondition.getConditionText(),
                        style: Theme.of(context).textTheme.titleMedium!
                            .copyWith(
                              color: Theme.of(context).colorScheme.primary,
                            ),
                      ),
                    ],
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
