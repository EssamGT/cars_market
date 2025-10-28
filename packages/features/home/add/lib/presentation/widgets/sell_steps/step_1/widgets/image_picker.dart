import 'package:add/presentation/cubit/add_cubit.dart';
import 'package:add/presentation/widgets/sell_steps/step_1/widgets/image_preview.dart';
import 'package:add/presentation/widgets/sell_steps/step_1/widgets/no_images.dart';
import 'package:constants/strings_manager.dart';
import 'package:constants/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ImagePicker extends StatelessWidget {
  const ImagePicker({super.key});

  @override
  Widget build(BuildContext context) {
    // Size screenSize = MediaQuery.of(context).size;
    // var cubit = AddCubit.get(context);
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
        BlocBuilder<AddCubit, AddState>(
          buildWhen: (previous, current) {
            if (current is ImagesSelected ||
                current is EmptyImages ||
                current is EmptyErrorImages ||
                current is LessThan3ErrorImages) {
              return true;
            } else {
              return false;
            }
          },
          builder: (context, state) {
            if (state is ImagesSelected) {
              return ImagePreview(images: state.images);
            }
            if (state is LessThan3ErrorImages) {
              return ImagePreview(images: state.images,error: true);
            }
            if (state is EmptyErrorImages) {
              return NoImages(error: true);
            }
            return NoImages();
          },
        ),
      ],
    );
  }
}
