import 'package:cars_market/globle/localization_service.dart';
import 'package:constants/strings_manager.dart';
import 'package:data/models/location/location_model.dart';
import 'package:flutter/material.dart';
import 'package:search/presentation/cubit/search_screen_cubit.dart';
import 'package:shared_ui/shared_widgets/buttons/selection_page_button.dart';

class FilterLocationWidget extends StatelessWidget {
  const FilterLocationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SelectionPageButton<LocationModel>(
      currentValue:
          SearchScreenCubit.get(context).searchModel.location ,
      values: SearchScreenCubit.get(context).locationCatalog,
      label: StringsManager.location,
      hint: StringsManager.location,
      search: true,
      onlyInPageLeading: false,
      leadingBuilder: (LocationModel location) => Icon(Icons.location_on),
      dialogAppBarTitle: StringsManager.location,
      emptyPage: StringsManager.noResultsFound,
      onSelected: (LocationModel location) {
        SearchScreenCubit.get(context).setLocation(location);
      },
      labelBuilder: (LocationModel location) => location.getLocationName(LocalizationService.isRTL),
    );
  }
}
