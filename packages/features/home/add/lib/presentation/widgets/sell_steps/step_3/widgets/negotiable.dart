import 'package:add/presentation/cubit/add_cubit.dart';
import 'package:constants/strings_manager.dart';
import 'package:constants/values_manager.dart';
import 'package:flutter/material.dart';

class Negotiable extends StatefulWidget {
  const Negotiable({super.key});

  @override
  State<Negotiable> createState() => _NegotiableState();
}

class _NegotiableState extends State<Negotiable> {
  @override
  Widget build(BuildContext context) {
    var cubit = AddCubit.get(context);
    Size screenSize = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(top: AppPadding.p20,bottom: AppPadding.p20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          FilledButton(
            onPressed: () {
              cubit.car.negotiable = true;
              setState(() {});
            },
            style: FilledButton.styleFrom(
              backgroundColor: Theme.of(
                context,
              ).colorScheme.surfaceContainerHighest,
              side: BorderSide(
                color: cubit.car.negotiable
                    ? Theme.of(context).colorScheme.primary
                    : Theme.of(context).colorScheme.outline,
                width: cubit.car.negotiable ? AppSize.s3 : AppSize.s1,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppSize.s8),
              ),
              minimumSize: Size(screenSize.width / 2.3, AppSize.s55),
              padding: const EdgeInsets.symmetric(
                horizontal: AppPadding.p12,
                vertical: AppPadding.p8,
              ),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: AppSize.s10,
                  backgroundColor: cubit.car.negotiable
                      ? Theme.of(context).colorScheme.primary
                      : Theme.of(context).colorScheme.outline,
                  child: Icon(
                    Icons.circle,
                      size: cubit.car.negotiable 
                        ? AppSize.s10
                        : AppSize.s15,
                    color: Theme.of(context).colorScheme.surfaceContainerHighest,
                  ),
                ),
                SizedBox(width: AppSize.s8),
                Text(
                  StringsManager.negotiable,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ],
            ),
          ),
          FilledButton(
            onPressed: () {
              cubit.car.negotiable = false;
              setState(() {});
            },
            style: FilledButton.styleFrom(
              backgroundColor: Theme.of(
                context,
              ).colorScheme.surfaceContainerHighest,
              side: BorderSide(
                color: cubit.car.negotiable == false
                    ? Theme.of(context).colorScheme.primary
                    : Theme.of(context).colorScheme.outline,
                width: cubit.car.negotiable == false ? AppSize.s3 : AppSize.s1,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppSize.s8),
              ),
              minimumSize: Size(screenSize.width / 2.3, AppSize.s55),
              padding: const EdgeInsets.symmetric(
                horizontal: AppPadding.p12,
                vertical: AppPadding.p8,
              ),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: AppSize.s10,
                  backgroundColor: cubit.car.negotiable == false
                      ? Theme.of(context).colorScheme.primary
                      : Theme.of(context).colorScheme.outline,
                  child: Icon(
                    Icons.circle,
                    size: cubit.car.negotiable == false
                        ? AppSize.s10
                        : AppSize.s15,
                    color: Theme.of(context).colorScheme.surfaceContainerHighest,
                  ),
                ),
                SizedBox(width: AppSize.s8),
                Text(
                  StringsManager.nonNegotiable,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
