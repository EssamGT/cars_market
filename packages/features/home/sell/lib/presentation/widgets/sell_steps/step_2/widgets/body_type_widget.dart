import 'package:cars_market/di/di.dart';
import 'package:constants/strings_manager.dart';
import 'package:constants/values_manager.dart';
import 'package:data/models/car/brands_models/body_types.dart';
import 'package:flutter/material.dart';
import 'package:sell/presentation/cubit/sell_cubit.dart';
import 'package:shared_ui/shared_widgets/buttons/new_selection_page_button.dart';
import 'package:shared_ui/shared_widgets/text_field/validate/text_field_validate.dart';

class BodyTypeWidget extends StatelessWidget {
  const BodyTypeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    SellCubit cubit = getIt.get<SellCubit>();
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        NewSelectionPageButton<CarBodyType>(
          values: CarBodyType.values
              .where((e) => e != CarBodyType.none)
              .toList(),
          currentValue: cubit.car.bodyType,
          search: true,
          dialogAppBarTitle: StringsManager.selecteCarBodyType,
          emptyPage: StringsManager.noCarBodyTypesFound,
          hint: StringsManager.selecteCarBodyType,
          label: StringsManager.carBodyTypeLabel,
          onSelected: (CarBodyType bodyType) => cubit.setBodyType(bodyType),

          labelBuilder: (e) => e.getCarBodyTypeName(),
          onlyInPageLeading: true,
          leadingBuilder: (e) {
            return Icon(e.getCarBodyTypeIcon(), size: AppSize.s40);
          },
          validator: (value) => TextFieldValidator.validateNormal(
            TextFieldValidationType.bodyType,
            value?.getCarBodyTypeName() ?? "",
          ),
        ),
      ],
    );
  }
}
