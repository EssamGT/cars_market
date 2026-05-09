
import 'package:constants/strings_manager.dart';
import 'package:constants/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sell/presentation/cubit/sell_cubit.dart';
import 'package:sell/presentation/widgets/sell_steps/step_1/widgets/image_widgets/image_preview.dart';
import 'package:sell/presentation/widgets/sell_steps/step_1/widgets/image_widgets/no_images.dart';
import 'package:shared_ui/shared_widgets/text_field/validate/text_field_validate.dart';

class ImagePicker extends StatelessWidget {
  const ImagePicker({super.key});

  @override
  Widget build(BuildContext context) {
    // Size screenSize = MediaQuery.of(context).size;
    var cubit = SellCubit.get(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppPadding.p14),
          child: Text(
            StringsManager.photos,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
        FormField<List<XFile>>(
          builder: (FormFieldState<List<XFile>> field) {
            if (cubit.car.selectedImages.isNotEmpty) {
              return ImagePreview(
                field: field,
                images: cubit.car.selectedImages,
                error: field.hasError,
                errorText: field.errorText,
              );
            }
            return NoImages(
              error: field.hasError,
              errorText: field.errorText,
              field: field,
            );
          },
          validator: (value) => TextFieldValidator.validateNormal(
            TextFieldValidationType.images,
            cubit.car.selectedImages.length.toString(),
          ),
        ),
      ],
    );
  }
}

  // BlocBuilder<AddCubit, AddState>(
  //         buildWhen: (previous, current) {
  //           if (current is ImagesSelected ||
  //               current is EmptyImages ||
  //               current is EmptyErrorImages ||
  //               current is LessThan3ErrorImages) {
  //             return true;
  //           } else {
  //             return false;
  //           }
  //         },
  //         builder: (context, state) {
  //           if (state is ImagesSelected) {
  //             return ImagePreview(images: state.images);
  //           }
  //           if (state is LessThan3ErrorImages) {
  //             return ImagePreview(images: state.images,error: true);
  //           }
  //           if (state is EmptyErrorImages) {
  //             return NoImages(error: true);
  //           }
  //           return NoImages();
        //   },
        // ),