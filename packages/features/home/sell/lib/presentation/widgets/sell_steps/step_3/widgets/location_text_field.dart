import 'package:cars_market/di/di.dart';
import 'package:constants/strings_manager.dart';
import 'package:data/models/location/location_model.dart';
import 'package:data/models/location/locations_catalog.dart';
import 'package:flutter/material.dart';
import 'package:sell/presentation/cubit/sell_cubit.dart';
import 'package:shared_ui/shared_widgets/buttons/new_selection_page_button.dart';
import 'package:shared_ui/shared_widgets/text_field/validate/text_field_validate.dart';

class LocationTextField extends StatelessWidget {
  const LocationTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return NewSelectionPageButton<LocationModel>(
      currentValue: getIt<SellCubit>().car.location,
      values: locationCatalog,
      label: StringsManager.location,
      hint: StringsManager.location,
      search: true,
      onlyInPageLeading: false,
      leadingBuilder: (LocationModel location) => Icon(Icons.location_on),
      dialogAppBarTitle: StringsManager.location,
      emptyPage: StringsManager.noResultsFound,
      onSelected: (LocationModel location) {
        getIt<SellCubit>().setLocation(location);
      },
      labelBuilder: (LocationModel location) => location.nameEn,
      validator: (value) => TextFieldValidator.validateNormal(
        TextFieldValidationType.location,
        value!.id,
      ),
    );
  }
}
