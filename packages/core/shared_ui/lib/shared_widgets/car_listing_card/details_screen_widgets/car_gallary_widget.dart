import 'package:domain/entity/car_entity.dart';
import 'package:flutter/material.dart';
import 'package:shared_ui/shared_widgets/car_listing_card/details_screen_widgets/car_price_widget.dart';
import 'package:shared_ui/shared_widgets/car_listing_card/details_screen_widgets/min_car_gallary_widget.dart';

class CarGallaryWidget extends StatefulWidget {
  final CarEntity car;
  const CarGallaryWidget({super.key, required this.car});

  @override
  State<CarGallaryWidget> createState() => _CarGallaryWidgetState();
}

class _CarGallaryWidgetState extends State<CarGallaryWidget> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return SizedBox(
      width: double.infinity,
      height: screenSize.height * 0.480,
      // color: Colors.blue,
      child: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            height: screenSize.height * 0.425,
            // color: Colors.red,
            child: MinCarGallaryWidget(car: widget.car)
          ),
          Positioned(
            right: 0,
            left: 0,
            bottom: 0,
            child: CarPriceWidget(car: widget.car),
          ),
        ],
      ),
    );
  }
}
