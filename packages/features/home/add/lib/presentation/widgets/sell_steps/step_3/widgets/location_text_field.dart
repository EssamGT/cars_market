import 'package:add/presentation/cubit/add_cubit.dart';
import 'package:cars_market/di/di.dart';
import 'package:flutter/material.dart';
import 'package:google_places_service/presentation/location_text_field_button.dart';

class LocationTextField extends StatelessWidget {
  const LocationTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return LocationTextFieldButton(
     assignedValueTo: getIt<AddCubit>().car.location,
    );
  }
}
