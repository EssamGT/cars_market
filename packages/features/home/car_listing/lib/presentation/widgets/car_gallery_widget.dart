import 'min_car_gallery_widget.dart';
import 'package:domain/entity/car_entity.dart';
import 'package:flutter/material.dart';
import 'package:shared_ui/shared_widgets/car_listing_card/car_card.dart';
import 'car_price_widget.dart';

class CarGalleryWidget extends StatefulWidget {
  final CarEntity car;
  const CarGalleryWidget({super.key, required this.car});

  @override
  State<CarGalleryWidget> createState() => _CarGalleryWidgetState();
}

class _CarGalleryWidgetState extends State<CarGalleryWidget> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return SizedBox(
      width: double.infinity,
      height: screenSize.height * 0.480,
      // color: Colors.blue,
      child: Hero(
        transitionOnUserGestures: true,
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
        tag: heroTag(widget.car.carId, 0),
        child: Stack(
          children: [
            SizedBox(
              width: double.infinity,
              height: screenSize.height * 0.425,
              // this contains hero
              child: MinCarGalleryWidget(car: widget.car),
            ),
            Positioned(
              right: 0,
              left: 0,
              bottom: 0,
              child: CarPriceWidget(car: widget.car),
            ),
          ],
        ),
      ),
    );
  }
}
