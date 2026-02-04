import 'package:constants/strings_manager.dart';
import 'package:constants/values_manager.dart';
import 'package:data/models/car/brands_models/brands.dart';
import 'package:data/models/car/brands_models/car_models.dart';
import 'package:data/models/car/car_filter_model.dart';
import 'package:flutter/material.dart';
import 'package:shared_ui/shared_widgets/pop_up/pop_up.dart';
import 'package:shared_ui/shared_widgets/slection_page/selection_page.dart';

import 'validate/text_field_validate.dart';

class FilterTextFieldButtonBrandAndModel extends StatefulWidget {
  final bool enable;
  final double width;
  final CarFilterModel car;
  const FilterTextFieldButtonBrandAndModel({
    super.key,
    required this.car,
    this.enable = true,
    this.width = double.maxFinite,
  });

  @override
  State<FilterTextFieldButtonBrandAndModel> createState() =>
      _FilterTextFieldButtonBrandAndModelState();
}

class _FilterTextFieldButtonBrandAndModelState
    extends State<FilterTextFieldButtonBrandAndModel> {
  late TextEditingController brandController;
  late TextEditingController modelController;

  late CarFilterModel car;
  @override
  void initState() {
    brandController = TextEditingController();
    modelController = TextEditingController();
    car = widget.car;
    brandController.text = car.brand ?? '';
    modelController.text = car.model ?? '';
    super.initState();
  }

  @override
  void dispose() {
    brandController.dispose();
    modelController.dispose();
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
                StringsManager.dbrand,
                textAlign: TextAlign.start,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
            SizedBox(
              width: widget.width,
              child: TextFormField(
                readOnly: true,
                enabled: widget.enable,
                controller: brandController,
                decoration: _inputDecoration(context),
                onTap: () async {
                  String selectedBrand =
                      (await rightPopUpScreen<String>(
                        context: context,
                        child: SelectionPage(
                          givenList: allCarBrands,
                          title: StringsManager.selectBrand,
                          emptyPage: '',
                        ),
                      )) ??
                      "";
                  if (selectedBrand.isNotEmpty) {
                    if (selectedBrand == car.brand) return;
                    car.brand = selectedBrand;
                    brandController.text = car.brand ?? "";
                    car.model = '';
                    modelController.clear();
                    setState(() {});
                    print(car.brand);
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
        SizedBox(height: AppSize.s15),

        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: AppPadding.p10),
              child: Text(
                StringsManager.dmodel,
                textAlign: TextAlign.start,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
            SizedBox(
              width: widget.width,
              child: TextFormField(
                readOnly: true,
                enabled: widget.enable,
                controller: modelController,
                decoration: _inputDecoration(context),

                onTap: () async {
                  if (car.brand?.isEmpty ?? true) {
                    String selectedBrand =
                        (await rightPopUpScreen<String>(
                          context: context,
                          child: SelectionPage(
                            givenList: allCarBrands,
                            title: StringsManager.selectBrand,
                            emptyPage: '',
                          ),
                        )) ??
                        "";
                    if (selectedBrand.isNotEmpty) {
                      if (selectedBrand == car.brand) return;
                      car.brand = selectedBrand;
                      brandController.text = car.brand ?? "";
                      car.model = '';
                      modelController.clear();
                      setState(() {});
                    }
                  } else {
                    String selectedModel =
                        (await rightPopUpScreen<String>(
                          context: context,
                          child: SelectionPage(
                            givenList: carModels[car.brand] ?? [],
                            title: StringsManager.selectModel,
                            emptyPage: '',
                          ),
                        )) ??
                        "";
                    if (selectedModel.isNotEmpty) {
                      car.model = selectedModel;
                      modelController.text = car.model ?? "";
                    }
                  }
                },

                style: Theme.of(context).textTheme.bodyMedium,
                validator: (value) => TextFieldValidator.validateNormal(
                  TextFieldValidationType.model,
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

InputDecoration _inputDecoration(BuildContext context) {
  return InputDecoration(
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
  );
}
