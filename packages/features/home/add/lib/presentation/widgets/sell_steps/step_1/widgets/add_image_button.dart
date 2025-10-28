import 'package:add/presentation/cubit/add_cubit.dart';
import 'package:constants/values_manager.dart';
import 'package:flutter/material.dart';

class AddImageButton extends StatelessWidget {
  const AddImageButton({super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    var cubit = AddCubit.get(context);
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
        },
        child: Icon(Icons.add, size: 40),
      ),
    );
  }
}
