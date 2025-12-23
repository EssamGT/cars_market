import 'package:cached_network_image/cached_network_image.dart';
import 'package:constants/values_manager.dart';
import 'package:domain/entity/car_entity.dart';
import 'package:flutter/material.dart';
import 'package:redacted/redacted.dart';
import 'package:shared_ui/shared_widgets/car_listing_card/car_details_screen.dart';

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
      onTap: () {
        // Navigate to car details screen
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
            ClipRRect(
              borderRadius: BorderRadiusGeometry.only(
                topLeft: Radius.circular(AppSize.s20),
                topRight: Radius.circular(AppSize.s20),
              ),
              child: Transform.scale(
                scale: 1.2,
                child: CachedNetworkImage(
                  imageUrl: widget.car.carImages!.first.url,
                  height: AppSize.s200,
                  width: double.infinity,
                  fit: BoxFit.fitWidth,
                  placeholder: (context, url) => Container(
                    color: Theme.of(
                      context,
                    ).colorScheme.surfaceContainerHighest,
                    height: AppSize.s200,
                    width: double.infinity,
                  ).redacted(context: context, redact: true),
                  //     Center(child: CircularProgressIndicator()),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),

                // Image.network(
                // car.carImages!.first.url,
                //   height: AppSize.s200,
                //   width: double.infinity,
                //   fit: BoxFit.fitWidth,

                // ),
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
                    '${widget.car.year} · ${widget.car.mileage} KM',
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
                    '${widget.car.price} EGP',
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
