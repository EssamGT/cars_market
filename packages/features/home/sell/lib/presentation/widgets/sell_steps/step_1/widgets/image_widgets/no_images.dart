import 'dart:math' as math;
import 'package:constants/strings_manager.dart';
import 'package:constants/values_manager.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sell/presentation/cubit/sell_cubit.dart';
import 'package:shared_ui/shared_widgets/buttons/text_button.dart';
import 'package:shared_ui/shared_widgets/loading/loading_c.dart';

class NoImages extends StatelessWidget {
  final bool error;
  final FormFieldState<List<XFile>> field;
  final String? errorText;
  final bool loading;
  const NoImages({
    super.key,
    this.error = false,
    this.loading = false,
    this.errorText,
    required this.field,
  });

  @override
  Widget build(BuildContext context) {
    var cubit = SellCubit.get(context);
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
            options: RoundedRectDottedBorderOptions(
              color: error
                  ? Theme.of(context).colorScheme.error
                  : Theme.of(context).colorScheme.outline,
              strokeWidth: 1.5,
              dashPattern: [8, 6],
              strokeCap: StrokeCap.round,

              radius: const Radius.circular(AppSize.s15),
            ),

            child: Container(
              height: AppSize.s280,
              width: screenSize.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppSize.s15),
                color: Theme.of(context).colorScheme.surfaceContainerHighest,

                // strokeAlign: AppMargin.m12
              ),
              child: loading
                  ? LoadingC()
                  : Column(
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
                            field.didChange(cubit.car.selectedImages);
                            field.validate();
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
          Visibility(
            visible: error,
            child: Padding(
              padding: const EdgeInsets.only(top: AppPadding.p8),
              child: Text(
                "$errorText",
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Theme.of(context).colorScheme.error,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class NoEditImages extends StatelessWidget {
  final bool error;
  final FormFieldState<List<Object>> field;
  final String? errorText;
  final bool loading;
  const NoEditImages({
    super.key,
    this.error = false,
    this.loading = false,
    this.errorText,
    required this.field,
  });

  @override
  Widget build(BuildContext context) {
    var cubit = SellCubit.get(context);
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
            options: RoundedRectDottedBorderOptions(
              color: error
                  ? Theme.of(context).colorScheme.error
                  : Theme.of(context).colorScheme.outline,
              strokeWidth: 1.5,
              dashPattern: [8, 6],
              strokeCap: StrokeCap.round,

              radius: const Radius.circular(AppSize.s15),
            ),

            child: Container(
              height: AppSize.s280,
              width: screenSize.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppSize.s15),
                color: Theme.of(context).colorScheme.surfaceContainerHighest,

                // strokeAlign: AppMargin.m12
              ),
              child: loading
                  ? LoadingC()
                  : Column(
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
                            field.didChange(cubit.onlineImages);
                            field.validate();
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
          Visibility(
            visible: error,
            child: Padding(
              padding: const EdgeInsets.only(top: AppPadding.p8),
              child: Text(
                "$errorText",
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Theme.of(context).colorScheme.error,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
