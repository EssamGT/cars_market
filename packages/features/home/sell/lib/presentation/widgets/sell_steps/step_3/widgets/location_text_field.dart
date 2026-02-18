import 'package:cars_market/di/di.dart';
import 'package:flutter/material.dart';
import 'package:google_places_service/presentation/location_text_field_button.dart';
import 'package:sell/presentation/cubit/sell_cubit.dart';

class LocationTextField extends StatelessWidget {
  const LocationTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return LocationTextFieldButton(
     assignedValueTo: getIt<SellCubit>().car.location,
    );
  }
}
