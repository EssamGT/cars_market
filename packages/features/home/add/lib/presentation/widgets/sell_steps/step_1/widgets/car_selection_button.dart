import 'package:add/presentation/cubit/add_cubit.dart';
import 'package:add/presentation/widgets/sell_steps/step_1/widgets/car_selection_page.dart';
import 'package:cars_market/di/di.dart';
import 'package:constants/strings_manager.dart';
import 'package:constants/values_manager.dart';
import 'package:data/models/car/car_model.dart';
import 'package:flutter/material.dart';
import 'package:shared_ui/shared_widgets/pop_up/pop_up.dart';
import 'package:shared_ui/shared_widgets/text_field/text_field_button_decoration.dart';
import 'package:shared_ui/shared_widgets/text_field/validate/text_field_validate.dart';

class CarSelectionButton extends StatefulWidget {
  final bool enable;
  final double width;

  const CarSelectionButton({
    super.key,
    this.enable = true,
    this.width = double.maxFinite,
  });

  @override
  State<CarSelectionButton> createState() => _CarSelectionButtonState();
}

class _CarSelectionButtonState extends State<CarSelectionButton> {
  late TextEditingController controller;

  late CarModel car;
  @override
  void initState() {
    controller = TextEditingController();

    car = getIt<AddCubit>().car;
    if (car.brand.isNotEmpty && car.model.isNotEmpty) {
      controller.text = "${car.brand} ${car.model}";
    }

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: AppPadding.p10),
              child: Text(
                StringsManager.selectedCar,
                textAlign: TextAlign.start,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
            SizedBox(
              height: TextFieldButtonDecoration.textFieldButtonHeight,
              width: widget.width,
              child: TextFormField(
                readOnly: true,
                enabled: widget.enable,
                controller: controller,
                decoration:
                    TextFieldButtonDecoration.textfieldButtonInputDecoration(
                      context,
                    ),
                onTap: () async {
                  await rightPopUpScreen(
                    context: context,
                    child: CarSelectionPage(),
                  );
                  if (car.brand.isEmpty || car.model.isEmpty) {
                    controller.clear();
                  } else {
                    controller.text = "${car.brand} ${car.model}";
                  }
                },

                style: Theme.of(context).textTheme.bodyMedium,
                validator: (value) => TextFieldValidator.validateNormal(
                  TextFieldValidationType.car,
                  value!,
                ),
                autovalidateMode: AutovalidateMode.onUserInteraction,

                autofocus: false,
                canRequestFocus: false,

                onTapOutside: (event) {
                  FocusScope.of(context).unfocus();
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}
