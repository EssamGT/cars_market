import 'package:constants/values_manager.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:reorderables/reorderables.dart';
import 'package:sell/presentation/cubit/sell_cubit.dart';
import 'package:sell/presentation/widgets/sell_steps/step_1/widgets/image_widgets/add_image_button.dart';
import 'package:sell/presentation/widgets/sell_steps/step_1/widgets/image_widgets/image_widget.dart';

class ImagePreview extends StatelessWidget {
  final List<XFile> images;
  final FormFieldState<List<XFile>> field;
  final bool error;
  final String? errorText;
  const ImagePreview({
    super.key,
    required this.images,
    required this.field,
    this.error = false,
    this.errorText,
  });

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    var cubit = SellCubit.get(context);
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
                      return ImageWidget(
                        imageIndex: index,
                        images: images,
                        field: field,
                      );
                    }),

                    AddImageButton(
                      key: const ValueKey('add_image_button'),
                      field: field,
                    ),
                  ],
                  onReorder: (oldIndex, newIndex) {
                    cubit.reorderImages(oldIndex, newIndex);
                  },
                ),
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
