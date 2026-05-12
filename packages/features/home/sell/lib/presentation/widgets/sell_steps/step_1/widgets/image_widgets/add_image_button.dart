import 'package:constants/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sell/presentation/cubit/sell_cubit.dart';

class AddImageButton extends StatelessWidget {
  final FormFieldState<List<XFile>> field;
  const AddImageButton({super.key, required this.field});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    var cubit = SellCubit.get(context);
    return Container(
      margin: const EdgeInsets.all(AppMargin.m8),
      height: AppSize.s93,
      width: screenSize.width / 4,
      child: FilledButton(
        style: FilledButton.styleFrom(
          backgroundColor: Theme.of(context).colorScheme.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSize.s8),
          ),
        ),
        onPressed: () async {
          await cubit.addImages();
          field.didChange(cubit.car.selectedImages);
          field.validate();
        },
        child: Icon(Icons.add, size: 40),
      ),
    );
  }
}

class AddEditImageWidget extends StatelessWidget {
  final FormFieldState<List<Object>> field;
  const AddEditImageWidget({super.key, required this.field});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    var cubit = SellCubit.get(context);
    return Container(
      margin: const EdgeInsets.all(AppMargin.m8),
      height: AppSize.s93,
      width: screenSize.width / 4,
      child: FilledButton(
        style: FilledButton.styleFrom(
          backgroundColor: Theme.of(context).colorScheme.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSize.s8),
          ),
        ),
        onPressed: () async {
          await cubit.addImagesToEdit();
          field.didChange(cubit.onlineImages);
          field.validate();
        },
        child: Icon(Icons.add, size: 40),
      ),
    );
  }
}
