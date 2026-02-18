import 'package:sell/presentation/cubit/sell_cubit.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:constants/strings_manager.dart';
import 'package:constants/values_manager.dart';
import 'package:data/models/car/brands_models/brands.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:router/routes_manager.dart';
import 'package:shared_ui/shared_widgets/buttons/elevated_button_decoration.dart';
import 'package:shared_ui/shared_widgets/text_field/validate/text_field_validate.dart';

class CarSelectionButton extends StatelessWidget {
  const CarSelectionButton({super.key});
  String? validator(CarBrand? carBrand) {
    return TextFieldValidator.validateNormal(
      TextFieldValidationType.car,
      carBrand?.selectedModel.id ?? "",
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double buttonWidth = size.width - AppSize.s24;
    SellCubit cubit = SellCubit.get(context);
    return FormField<CarBrand>(
      initialValue: cubit.car.brand,
      validator: validator,

      builder: (FormFieldState<CarBrand> field) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: AppPadding.p10),
              child: Text(
                StringsManager.selectedCar,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),

            ElevatedButton(
              style:
                  CustomElevatedButtonDecoration.customElevatedbuttonStyleNonSelectable(
                    context: context,
                    width: buttonWidth,
                    error: field.hasError,
                  ),
              onPressed: () async {
                final brand = await context.push<CarBrand>(
                  RoutesManager.sellBrandSelection,
                );
                if (brand == null) return;
                cubit.setCarBrand(brand);
                field.didChange(brand);
                field.validate();
              },

              child: SizedBox(
                width: buttonWidth - AppSize.s16,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        brandLogoBuilder(field.value!, context),
                        SizedBox(width: AppSize.s12),
                        Text(
                          carTextBuilder(field.value!),
                          style: Theme.of(context).textTheme.labelLarge,
                        ),
                      ],
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: field.hasError
                          ? Theme.of(context).colorScheme.error
                          : Theme.of(context).colorScheme.primary,
                    ),
                  ],
                ),
              ),
            ),

            if (field.hasError)
              Padding(
                padding: const EdgeInsets.only(top: AppPadding.p8),
                child: Text(
                  field.errorText!,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Theme.of(context).colorScheme.error,
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}

Widget brandLogoBuilder(CarBrand carBrand, BuildContext context) {
  return carBrand.logoUrl.isNotEmpty
      ? Container(
          width: AppSize.s40,
          height: AppSize.s40,
          alignment: Alignment.center,
          decoration: BoxDecoration(shape: BoxShape.circle),
          child: CachedNetworkImage(
            imageUrl: carBrand.logoUrl,
            fit: BoxFit.contain,
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
        )
      : Container(
          width: AppSize.s35,
          height: AppSize.s35,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Theme.of(context).colorScheme.outline),
          ),
          child: const Icon(Icons.directions_car),
        );
}

String carTextBuilder(CarBrand? carBrand) {
  if (carBrand == null ||
      carBrand.name.isEmpty ||
      carBrand.selectedModel.name.isEmpty) {
    return StringsManager.selectCar;
  }
  return "${carBrand.name} ${carBrand.selectedModel.name}";
}
