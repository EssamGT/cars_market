import 'package:add/presentation/cubit/add_cubit.dart';
import 'package:add/presentation/widgets/sell_steps/step_1/widgets/add_image_button.dart';
import 'package:add/presentation/widgets/sell_steps/step_1/widgets/image_widget.dart';
import 'package:constants/strings_manager.dart';
import 'package:constants/values_manager.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:reorderables/reorderables.dart';

class ImagePreview extends StatelessWidget {
  final List<XFile> images;
  final bool error;
  const ImagePreview({super.key, required this.images, this.error = false});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    var cubit = AddCubit.get(context);
    return Padding(
      padding: const EdgeInsets.all(AppPadding.p14),
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
              constraints: BoxConstraints(
                minHeight: AppSize.s150,
                minWidth: screenSize.width,
              ),

              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppSize.s15),
                color: Theme.of(context).colorScheme.surfaceContainerHighest,
              ),
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: screenSize.width / 4 * 3),
                child: ReorderableWrap(
                  scrollPhysics: NeverScrollableScrollPhysics(),
                  needsLongPressDraggable: true,
                  alignment: WrapAlignment.start,
                  crossAxisAlignment: WrapCrossAlignment.start,
                  runAlignment: WrapAlignment.center,
                  spacing: AppSize.s10,
                  runSpacing: AppSize.s10,

                  children: [
                    ...List.generate(images.length, (index) {
                      return ImageWidget(imageIndex: index, images: images);
                    }),

                    AddImageButton(key: const ValueKey('add_image_button')),
                  ],
                  onReorder: (oldIndex, newIndex) {
                    cubit.reorderImages(oldIndex, newIndex);
                  },
                ),
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
