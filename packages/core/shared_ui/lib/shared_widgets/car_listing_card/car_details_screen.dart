import 'package:constants/values_manager.dart';
import 'package:domain/entity/car_entity.dart';
import 'package:flutter/material.dart';
import 'package:shared_ui/shared_widgets/car_listing_card/details_screen_widgets/car_gallary_widget.dart';
import 'package:shared_ui/shared_widgets/car_listing_card/details_screen_widgets/car_specs_widget.dart';
import 'package:shared_ui/shared_widgets/car_listing_card/details_screen_widgets/details_screen_app_bar.dart';

class CarDetailsScreen extends StatelessWidget {
  final CarEntity car;
  const CarDetailsScreen({super.key, required this.car});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: detailsScreenAppBar(context),
      body: Column(
        spacing: AppSize.s20,
        children: [
          CarGallaryWidget(car: car),
          CarSpecsWidget(car: car),
        ],
      ),
    );
  }
}
