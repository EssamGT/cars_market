import 'package:constants/strings_manager.dart';
import 'package:constants/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:on_bording/presentation/cubit/on_bording_cubit_cubit.dart';
import 'package:on_bording/presentation/widgets/indecator.dart';

class BottomWidget extends StatelessWidget {
  final int length;
  const BottomWidget({super.key, required this.length});

  @override
  Widget build(BuildContext context) {
    var cubit = OnBordingCubit.get(context);

    return Padding(
      padding: const EdgeInsets.only(
        bottom: AppPadding.p40,
        top: AppPadding.p40,
        left: AppPadding.p20,
        right: AppPadding.p20,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            children: [
              BlocBuilder<OnBordingCubit, OnBordingState>(
                builder: (context, state) {
                  return Column(
                    children: [
                      Text(
                        StringsManager.titles[cubit.index]['t']!,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      SizedBox(height: AppSize.s10),
                      Text(
                        StringsManager.titles[cubit.index]['s']!,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
          BlocBuilder<OnBordingCubit, OnBordingState>(
            builder: (context, state) {
              return Indecator(lentgh: length, selected: cubit.index);
            },
          ),
          MaterialButton(
            onPressed: () {
              // controller.jumpToPage(1);
              cubit.changeImage(length);
            },
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadiusGeometry.circular(8),
            ),
            color: Theme.of(context).colorScheme.primary,
            minWidth: MediaQuery.of(context).size.width - 40,
            height: 50,
            child: Text(
              'Get Started',
              style: Theme.of(context).textTheme.displaySmall,
            ),
          ),
        ],
      ),
    );
  }
}
