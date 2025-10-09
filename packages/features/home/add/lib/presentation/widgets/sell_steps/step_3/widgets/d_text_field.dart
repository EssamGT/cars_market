import 'package:add/presentation/cubit/add_cubit.dart';
import 'package:constants/strings_manager.dart';
import 'package:constants/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class DTextField extends StatefulWidget {
  const DTextField({super.key});

  @override
  State<DTextField> createState() => _DTextFieldState();
}

class _DTextFieldState extends State<DTextField> {
  TextEditingController controller = TextEditingController();
  @override
  @override
  Widget build(BuildContext context) {
    var cubit = AddCubit.get(context);
    return BlocBuilder<AddCubit, AddState>(
      buildWhen: (previous, current) {
        if (current is ValidateDesc) {
          return true;
        } else {
          return false;
        }
      },
      builder: (context, state) {
        controller.text = cubit.car.description;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: AppPadding.p10),
              child: Text(
                StringsManager.description,
                textAlign: TextAlign.start,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
            TextFormField(
              controller: controller,
              maxLength: 1000,
              buildCounter:
                  (
                    context, {
                    required currentLength,
                    required isFocused,
                    required maxLength,
                  }) {
                    return Text(
                      '$currentLength/$maxLength',
                      style: Theme.of(context).textTheme.bodySmall,
                    );
                  },
              decoration: InputDecoration(
                hintText: StringsManager.description,
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
                fillColor: Theme.of(
                  context,
                ).colorScheme.surfaceContainerHighest,
              ),
              minLines: 5,
              maxLines: 50,
              style: Theme.of(context).textTheme.bodyLarge,

              onChanged: (value) => cubit.car.description = value,
              textInputAction: TextInputAction.done,
              onFieldSubmitted: (_) {
                FocusScope.of(context).unfocus();
              },
            ),
            SizedBox(height: AppSize.s10),
            if (state is ValidateDesc)
              Text(
                StringsManager.descriptionError,
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color: Theme.of(context).colorScheme.error,
                ),
              ),
          ],
        );
      },
    );
  }
}
