import 'package:add/presentation/cubit/add_cubit.dart';
import 'package:constants/strings_manager.dart';
import 'package:constants/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:shared_ui/shared_widgets/text_field/normal_text_field.dart';
import 'package:shared_ui/shared_widgets/text_field/validate/text_filed_validate.dart';

class YearTextField extends StatefulWidget {
  const YearTextField({super.key});

  @override
  State<YearTextField> createState() => _YearTextFieldState();
}

class _YearTextFieldState extends State<YearTextField> {
  @override
  Widget build(BuildContext context) {
    var cubit = AddCubit.get(context);
    return Column(
      children: [
        NormalTextFieldUploadCar(
          car: cubit.car,
          hint: StringsManager.version,
          type: TextFieldUploadCarType.version,
          title: StringsManager.version,
          validationType: TextFieldValidationType.version,
          // keybordType: TextInputType.number,
          // maxLength: 4,
          format: false,
        ),
        SizedBox(height: AppSize.s15),
        NormalTextFieldUploadCar(
          car: cubit.car,
          hint: StringsManager.year,
          type: TextFieldUploadCarType.year,
          title: StringsManager.year,
          validationType: TextFieldValidationType.year,
          keybordType: TextInputType.number,
          maxLength: 4,
          format: false,
        ),
      ],
    );
  }
}
