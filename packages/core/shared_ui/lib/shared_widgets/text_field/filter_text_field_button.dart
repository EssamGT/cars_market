import 'package:add/presentation/cubit/add_cubit.dart';
import 'package:constants/strings_manager.dart';
import 'package:constants/values_manager.dart';
import 'package:data/models/car/car_filter_model.dart';
import 'package:data/models/car/car_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_ui/shared_widgets/pop_up/pop_up.dart';
import 'package:shared_ui/shared_widgets/slection_page/options_selection_page.dart';
import 'package:shared_ui/shared_widgets/slection_page/selection_page.dart';
import 'package:shared_ui/shared_widgets/text_field/validate/text_field_validate.dart';

enum FilterTextFieldButtonType {
  paintColor,
  paintCondition,
  fuelType,
  minEngineCylinderNumber,
  maxEngineCylinderNumber,
  minEngineCapacity,
  maxEngineCapacity,
  bodyType,
  gearboxType,
  safetyOptions,
  none,
}

class FilterTextFieldButton extends StatefulWidget {
  final TextFieldValidationType validationType;
  // final String hint;
  final String title;
  final String inPageTitle;
  final FilterTextFieldButtonType type;
  final List<String> givenList;
  final bool enable;
  final double width;
  final CarFilterModel car;
  final String? hintText;
  const FilterTextFieldButton({
    super.key,
    // required this.hint,
    required this.inPageTitle,
    required this.givenList,
    required this.title,
    required this.type,
    required this.car,
    this.validationType = TextFieldValidationType.none,
    this.enable = true,
    this.width = double.maxFinite,
    this.hintText,
  });

  @override
  State<FilterTextFieldButton> createState() => _FilterTextFieldButtonState();
}

class _FilterTextFieldButtonState extends State<FilterTextFieldButton> {
  late TextEditingController controller;
  late CarFilterModel car;
  @override
  void initState() {
    controller = TextEditingController();
    car = widget.car;
    switch (widget.type) {
      case FilterTextFieldButtonType.paintColor:
        controller.text = car.paintColor ?? "";
      case FilterTextFieldButtonType.paintCondition:
        controller.text = car.paintCondition ?? "";
      case FilterTextFieldButtonType.fuelType:
        controller.text = car.fuelType ?? "";
      case FilterTextFieldButtonType.bodyType:
        controller.text = car.bodyType ?? "";
      case FilterTextFieldButtonType.gearboxType:
        controller.text = car.gearboxType ?? "";

      case FilterTextFieldButtonType.none:
        controller.text = '';
        break;
      case FilterTextFieldButtonType.minEngineCylinderNumber:
        controller.text = car.minEngineCylinderNumber ?? "";
      case FilterTextFieldButtonType.maxEngineCylinderNumber:
        controller.text = car.maxEngineCylinderNumber ?? "";
      case FilterTextFieldButtonType.minEngineCapacity:
        controller.text = car.minEngineCapacity ?? "";
      case FilterTextFieldButtonType.maxEngineCapacity:
        controller.text = car.maxEngineCapacity ?? "";
      case FilterTextFieldButtonType.safetyOptions:
        controller.text =
            '${car.safetyOptions?.length ?? 0} ${StringsManager.safetyOptions}';
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
              hintText: StringsManager.choose,

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
              String selected =
                  widget.type == FilterTextFieldButtonType.safetyOptions
                  ? (await rightPopUpScreen<String>(
                          context: context,
                          child: OptionsSelectionPage(
                            givenList: widget.givenList,
                            title: widget.inPageTitle,
                            emptyPage: '',
                          ),
                        )) ??
                        ""
                  : (await rightPopUpScreen<String>(
                          context: context,
                          child: SelectionPage(
                            hintText: widget.hintText,
                            givenList: widget.givenList,
                            title: widget.inPageTitle,
                            emptyPage: '',
                          ),
                        )) ??
                        "";
              if (selected.isNotEmpty) {
                // widget.cubit.setBrand(selected);
                switch (widget.type) {
                  case FilterTextFieldButtonType.paintColor:
                    car.paintColor = selected;
                    controller.text = car.paintColor ?? '';
                  case FilterTextFieldButtonType.paintCondition:
                    car.paintCondition = selected;
                    controller.text = car.paintCondition ?? '';
                  case FilterTextFieldButtonType.fuelType:
                    car.fuelType = selected;
                    controller.text = car.fuelType ?? '';
                    break;
                  case FilterTextFieldButtonType.bodyType:
                    car.bodyType = selected;
                    controller.text = car.bodyType ?? '';
                    break;
                  case FilterTextFieldButtonType.gearboxType:
                    car.gearboxType = selected;
                    controller.text = car.gearboxType ?? '';
                    break;
                  case FilterTextFieldButtonType.safetyOptions:
                    // car.safetyOptions = selected;
                    controller.text =
                        "${car.safetyOptions?.length ?? 0} ${StringsManager.safetyOptions}";
                    break;
                  case FilterTextFieldButtonType.none:
                    controller.text = '';
                    break;
                  case FilterTextFieldButtonType.minEngineCapacity:
                    car.minEngineCapacity = selected;
                    controller.text = car.minEngineCapacity ?? '';

                  case FilterTextFieldButtonType.maxEngineCapacity:
                    car.maxEngineCapacity = selected;
                    controller.text = car.maxEngineCapacity ?? '';
                  case FilterTextFieldButtonType.minEngineCylinderNumber:
                    car.minEngineCylinderNumber = selected;
                    controller.text = car.minEngineCylinderNumber ?? '';

                  case FilterTextFieldButtonType.maxEngineCylinderNumber:
                    car.maxEngineCylinderNumber = selected;
                    controller.text = car.maxEngineCylinderNumber ?? '';
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
                case FilterTextFieldButtonType.paintColor:
                  controller.text = car.paintColor ?? "";
                  break;

                case FilterTextFieldButtonType.paintCondition:
                  controller.text = car.paintCondition ?? "";
                  break;
                case FilterTextFieldButtonType.fuelType:
                  controller.text = car.fuelType ?? "";
                  break;
                case FilterTextFieldButtonType.bodyType:
                  controller.text = car.bodyType ?? "";
                  break;
                case FilterTextFieldButtonType.gearboxType:
                  controller.text = car.gearboxType ?? "";
                  break;
                case FilterTextFieldButtonType.safetyOptions:
                  controller.text = car.safetyOptions?.length.toString() ?? "";
                  break;
                case FilterTextFieldButtonType.none:
                  controller.text = '';
                  break;
                case FilterTextFieldButtonType.minEngineCylinderNumber:
                  controller.text = car.minEngineCylinderNumber ?? "";
                  break;
                case FilterTextFieldButtonType.maxEngineCylinderNumber:
                  controller.text = car.maxEngineCylinderNumber ?? "";
                  break;
                case FilterTextFieldButtonType.minEngineCapacity:
                  controller.text = car.minEngineCapacity ?? "";
                  break;
                case FilterTextFieldButtonType.maxEngineCapacity:
                  controller.text = car.maxEngineCapacity ?? "";
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
