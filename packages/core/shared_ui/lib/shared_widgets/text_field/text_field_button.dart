import 'package:add/presentation/cubit/add_cubit.dart';
import 'package:constants/strings_manager.dart';
import 'package:constants/values_manager.dart';
import 'package:data/models/car/car_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_ui/shared_widgets/pop_up/pop_up.dart';
import 'package:shared_ui/shared_widgets/slection_page/options_selection_page.dart';
import 'package:shared_ui/shared_widgets/slection_page/selection_page.dart';
import 'package:shared_ui/shared_widgets/text_field/validate/text_filed_validate.dart';

enum TextFieldButtonType {
  brand,
  model,
  paintColor,
  paintCondition,
  fuelType,
  bodyType,
  gearboxType,
  safetyOptions,
  none,
}

class TextFieldButton extends StatefulWidget {
  final TextFieldValidationType validationType;
  // final String hint;
  final String title;
  final String inPageTitle;
  final TextFieldButtonType type;
  final List<String> givenList;
  final bool enable;
  final double width;
  final AddCubit cubit;
  const TextFieldButton({
    super.key,
    // required this.hint,
    required this.inPageTitle,
    required this.givenList,
    required this.title,
    required this.type,
    required this.cubit,
    this.validationType = TextFieldValidationType.none,
    this.enable = true,
    this.width = double.maxFinite,
  });

  @override
  State<TextFieldButton> createState() => _TextFieldButtonState();
}

class _TextFieldButtonState extends State<TextFieldButton> {
  late TextEditingController controller;
  late CarModel car;
  @override
  void initState() {
    controller = TextEditingController();
    car = widget.cubit.car;
    switch (widget.type) {
      case TextFieldButtonType.brand:
        controller.text = car.brand;
      case TextFieldButtonType.model:
        controller.text = car.model;
      case TextFieldButtonType.paintColor:
        controller.text = car.paintColor;
      case TextFieldButtonType.paintCondition:
        controller.text = car.paintCondition;
      case TextFieldButtonType.fuelType:
        controller.text = car.fuelType;
      case TextFieldButtonType.bodyType:
        controller.text = car.bodyType;
      case TextFieldButtonType.gearboxType:
        controller.text = car.gearboxType;

      case TextFieldButtonType.safetyOptions:
        controller.text =
            '${car.safetyOptions.length} ${StringsManager.safetyOptions}';
      case TextFieldButtonType.none:
        controller.text = '';
        break;
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
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: AppPadding.p10),
          child: Text(
            widget.title,
            textAlign: TextAlign.start,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
        SizedBox(
          width: widget.width,
          child: TextFormField(
            readOnly: true,
            enabled: widget.enable,
            controller: controller,
            decoration: InputDecoration(
              hintText: StringsManager.chose,

              hintStyle: Theme.of(context).textTheme.labelLarge,
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Theme.of(context).colorScheme.outline,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(AppSize.s8),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Theme.of(context).colorScheme.outline,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(AppSize.s8),
              ),
              fillColor: Theme.of(context).colorScheme.surfaceContainerHighest,
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Theme.of(context).colorScheme.outline,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(AppSize.s8),
              ),
              suffixIcon: Icon(
                Icons.arrow_forward_ios_sharp,
                color: Theme.of(context).colorScheme.outline,
                size: AppSize.s20,
              ),
            ),
            onTap: () async {
              String selected = widget.type == TextFieldButtonType.safetyOptions
                  ? (await popUpScreen<String>(
                          context: context,
                          child: BlocProvider.value(
                            value: widget.cubit,
                            child: OptionsSelectionPage(
                              givenList: widget.givenList,
                              title: widget.inPageTitle,
                              emptyPage: '',
                            ),
                          ),
                        )) ??
                        ""
                  : (await popUpScreen<String>(
                          context: context,
                          child: BlocProvider.value(
                            value: widget.cubit,
                            child: SelectionPage(
                              givenList: widget.givenList,
                              title: widget.inPageTitle,
                              emptyPage: '',
                            ),
                          ),
                        )) ??
                        "";
              if (selected.isNotEmpty) {
                // widget.cubit.setBrand(selected);
                switch (widget.type) {
                  case TextFieldButtonType.brand:
                    car.brand = selected;
                    controller.text = car.brand;
                    car.model = '';
                    break;
                  case TextFieldButtonType.model:
                    car.model = selected;
                    controller.text = car.model;
                  case TextFieldButtonType.paintColor:
                    car.paintColor = selected;
                    controller.text = car.paintColor;
                  case TextFieldButtonType.paintCondition:
                    car.paintCondition = selected;
                    controller.text = car.paintCondition;
                  case TextFieldButtonType.fuelType:
                    car.fuelType = selected;
                    controller.text = car.fuelType;
                    break;
                  case TextFieldButtonType.bodyType:
                    car.bodyType = selected;
                    controller.text = car.bodyType;
                    break;
                  case TextFieldButtonType.gearboxType:
                    car.gearboxType = selected;
                    controller.text = car.gearboxType;
                    break;
                  case TextFieldButtonType.safetyOptions:
                    // car.safetyOptions = selected;
                    controller.text =
                        "${car.safetyOptions.length} ${StringsManager.safetyOptions}";
                    break;
                  case TextFieldButtonType.none:
                    controller.text = '';
                    break;
                }
              }
            },

            style: Theme.of(context).textTheme.bodyMedium,
            validator: (value) => TextFieldValidator.validateNormal(
              widget.validationType,
              value!,
            ),
            autovalidateMode: AutovalidateMode.onUserInteraction,

            // onSaved: (newValue) {
            //   print(newValue);
            // },
            // onFieldSubmitted: (value) {
            //   print(value);
            // },
            onChanged: (value) {
              switch (widget.type) {
                case TextFieldButtonType.paintColor:
                  controller.text = car.paintColor;
                  break;
                case TextFieldButtonType.brand:
                  controller.text = car.brand;

                  break;
                case TextFieldButtonType.model:
                  controller.text = car.model;
                  break;
                case TextFieldButtonType.paintCondition:
                  controller.text = car.paintCondition;
                  break;
                case TextFieldButtonType.fuelType:
                  controller.text = car.fuelType;
                  break;
                case TextFieldButtonType.bodyType:
                  controller.text = car.bodyType;
                  break;
                case TextFieldButtonType.gearboxType:
                  controller.text = car.gearboxType;
                  break;
                case TextFieldButtonType.safetyOptions:
                  controller.text = car.safetyOptions.length.toString();
                  break;
                case TextFieldButtonType.none:
                  controller.text = '';
                  break;
              }
            },

            // textInputAction: TextInputAction.done,
            // keyboardType: widget.keybordType,
            autofocus: false,

            onTapOutside: (event) {
              FocusScope.of(context).unfocus();
            },
          ),
        ),
      ],
    );
  }
}
