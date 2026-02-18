import 'package:data/models/car/sell_car_model.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_places_service/domain/entity/predictions_entity.dart';
import 'package:google_places_service/domain/entity/structured_formatting_entity.dart';
import 'package:google_places_service/presentation/location_text_field_button.dart';

class FilterLocationWidget extends StatelessWidget {
  FilterLocationWidget({super.key});
  SellCarUploadModel car = SellCarUploadModel(
    location: PredictionsEntity(
      description: '',
      placeId: '',
      structuredFormatting: StructuredFormattingEntity(
        mainText: '',
        secondaryText: '',
      ),
      reference: '',
      types: [],
      latLng: LatLng(0.0, 0.0),
    ),
  );
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        LocationTextFieldButton(assignedValueTo: car.location, filter: true),
      ],
    );
  }
}
