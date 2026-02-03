import 'dart:math' as math;
import 'package:add/presentation/cubit/add_cubit.dart';
import 'package:constants/strings_manager.dart';
import 'package:constants/values_manager.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:shared_ui/shared_widgets/buttons/text_button.dart';

class NoImages extends StatelessWidget {
  final bool error;
  const NoImages({super.key, this.error = false});

  @override
  Widget build(BuildContext context) {
    var cubit = AddCubit.get(context);
    Size screenSize = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppPadding.p14,
        vertical: AppPadding.p5,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          DottedBorder(
            color: Theme.of(context).colorScheme.outline,
            strokeWidth: 1.5,
            dashPattern: [8, 6],
            borderType: BorderType.RRect,
            radius: const Radius.circular(AppSize.s15),
            child: Container(
              height: AppSize.s280,
              width: screenSize.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppSize.s15),
                color: Theme.of(context).colorScheme.surfaceContainerHighest,

                // strokeAlign: AppMargin.m12
              ),
              child: Column(
                spacing: AppSize.s5,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Transform(
                    transform: Matrix4.rotationY(math.pi),
                    alignment: Alignment.center,
                    child: Icon(
                      Icons.add_a_photo_outlined,
                      size: AppSize.s50,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  SizedBox(height: AppSize.s5),
                  Column(
                    spacing: AppSize.s5,
                    children: [
                      Text(
                        StringsManager.addPhotos,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      Text(
                        StringsManager.addPhotosSubTitle,
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                    ],
                  ),
                  CTextButton(
                    onTap: () async {
                      await cubit.getImages();
                    },
                    text: StringsManager.uploadPhotos,
                    radius: BorderRadius.circular(AppSize.s30),
                    width: screenSize.width / 1.8,
                    loading: false,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: AppSize.s8),
          Visibility(
            visible: error,
            child: Text(
              StringsManager.pleaseAddAtLeast3Images,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: Theme.of(context).colorScheme.error,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
