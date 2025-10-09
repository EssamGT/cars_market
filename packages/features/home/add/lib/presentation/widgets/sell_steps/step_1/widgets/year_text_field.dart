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
        NormalTextField(
          gvalue: cubit.car.description,
          hint: StringsManager.version,
          onChanged: (valu) {},
          title: StringsManager.version,
        ),
        SizedBox(height: AppSize.s15),
        NormalTextField(
          gvalue: cubit.car.year.toString(),
          hint: StringsManager.year,
          onChanged: (valu) {
            cubit.car.setYear = valu;
          },
          title: StringsManager.year,
          validationType: TextFieldValidationType.year,
          keybordType: TextInputType.number,
          maxLength: 4,
        ),
      ],
    );
  }
}
