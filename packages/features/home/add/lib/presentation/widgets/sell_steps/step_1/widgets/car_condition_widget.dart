import 'package:add/presentation/cubit/add_cubit.dart';
import 'package:constants/strings_manager.dart';
import 'package:constants/values_manager.dart';
import 'package:data/models/car/brands_models/car_condition.dart';
import 'package:flutter/material.dart';

class CarConditionWidget extends StatefulWidget {
  const CarConditionWidget({super.key});

  @override
  State<CarConditionWidget> createState() => _CarConditionWidgetState();
}

class _CarConditionWidgetState extends State<CarConditionWidget> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: AppSize.s8),
          child: Text(
            StringsManager.carConditionLabel,
            textAlign: TextAlign.start,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          spacing: AppSize.s20,
          children: [
            _button(StringsManager.usedLabel, CarConditionType.usedCar),
            _button(StringsManager.newLabel, CarConditionType.newCar),
          ],
        ),
      ],
    );
  }

  Widget _button(String text, CarConditionType condition) {
    int index = condition == CarConditionType.usedCar ? 0 : 1;
    final isSelected = selectedIndex == index;
    Size size = MediaQuery.of(context).size;
    double width = (size.width) / 3;

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: isSelected
            ? Theme.of(context).primaryColor
            : Theme.of(context).colorScheme.surfaceContainerHighest,

        padding: const EdgeInsets.symmetric(
          horizontal: AppSize.s24,
          vertical: AppSize.s14,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSize.s8),
          side: BorderSide(
            color: isSelected
                ? Theme.of(context).primaryColor
                : Theme.of(context).colorScheme.outline,
            width: AppSize.s0_5,
          ),
        ),
        minimumSize: Size(width, AppSize.s50),
      ),

      onPressed: () {
        setState(() {
          selectedIndex = index;
          AddCubit cubit = AddCubit.get(context);
          cubit.car.carCondition = selectedIndex == 0
              ? CarConditionType.usedCar
              : CarConditionType.newCar;
        });
      },
      child: Text(
        text,
        style: Theme.of(context).textTheme.labelLarge!.copyWith(
          color: isSelected
              ? Theme.of(context).colorScheme.surface
              : Theme.of(context).colorScheme.onError,
        ),
      ),
    );
  }
}
