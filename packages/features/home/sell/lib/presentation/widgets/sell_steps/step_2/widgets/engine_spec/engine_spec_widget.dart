import 'package:cars_market/di/di.dart';
import 'package:constants/strings_manager.dart';
import 'package:data/models/car/brands_models/engine_spec.dart';
import 'package:data/models/car/brands_models/fuel_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sell/presentation/cubit/sell_cubit.dart';
import 'package:shared_ui/shared_widgets/buttons/new_selection_page_button.dart';
import 'package:shared_ui/shared_widgets/text_field/validate/text_field_validate.dart';

class EngineSpecWidget extends StatelessWidget {
  const EngineSpecWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = getIt.get<SellCubit>();
    return BlocBuilder<SellCubit, SellState>(
      buildWhen: (previous, current) {
        if (current is FuelTypeSlected) {
          return true;
        }
        return false;
      },
      builder: (context, state) {
        if (cubit.car.engineSpec.fuelType == FuelType.electric) {
          return SizedBox();
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            NewSelectionPageButtonSameType<
              EngineSpec,
              EngineCylinderNumber,
              EngineCapacityModel
            >(
              currentValue: cubit.car.engineSpec,
              current2Value: (e) => e.value!.engineCylinderNumber,
              current3Value: (e) => e.value!.engineCapacity,
              values: EngineCylinderNumber.values
                  .where((cyl) => cyl != EngineCylinderNumber.none)
                  .toList(),
              onExit: (field) {
                if (field.value!.engineCapacity == EngineCapacity.none) {
                  cubit.car.engineSpec.clear();
                  field.reset();
                }
              },

              secondPageCurrentValue: cubit.car.engineSpec,
              secondPageValues: (cylinderNumber) {
                return cylinderNumber.getEngineCapacity();
              },
              dialogAppBarTitle: StringsManager.selectEngineCylinder,
              emptyPage: StringsManager.noEngineCylinderNumbersFound,
              hint: StringsManager.engineCylinderNumberLabel,
              label: StringsManager.engineSpec,

              search: true,
              labelBuilder: (EngineCylinderNumber engine) =>
                  engine.getEngineCylinderNumberName(),
              buttonLabelBuilder: (EngineSpec engine) {
                if (engine.engineCapacity.engineCapacity ==
                    EngineCapacity.none) {
                  return engine.engineCylinderNumber
                      .getEngineCylinderNumberName();
                }
                return engine.getEngineSpec();
              },

              onSecondPageSelected:
                  (
                    EngineCylinderNumber cylinderNumber,
                    EngineCapacityModel capacity,
                    FormFieldState<EngineSpec> field,
                  ) {
                    final newEngine = EngineSpec(
                      engineCapacity: capacity,
                      engineCylinderNumber: cylinderNumber,
                    );
                    field.didChange(newEngine);
                    field.validate();
                    cubit.setEngine(newEngine);
                  },
              secondPageLabelBuilder: (EngineCapacityModel engine) =>
                  engine.engineCapacity.getEngineCapacityName(),
              secondPageDialogAppBarTitle: StringsManager.selectEngineCapacity,
              secondPageEmptyPage: StringsManager.noEngineCapacityFound,
              validator: (value) => TextFieldValidator.validateNormal(
                TextFieldValidationType.engineCapacity,
                value?.engineCapacity.engineCapacity.getEngineCapacityName() ??
                    "",
              ),
            ),
          ],
        );
      },
    );
  }
}
