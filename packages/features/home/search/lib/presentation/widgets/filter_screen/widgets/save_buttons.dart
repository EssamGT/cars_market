import 'package:constants/strings_manager.dart';
import 'package:constants/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:router/routes_manager.dart';
import 'package:search/presentation/cubit/search_screen_cubit.dart';
import 'package:shared_ui/shared_widgets/animated/animated_container.dart';

class SaveButtons extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  const SaveButtons({super.key, required this.formKey});

  @override
  Widget build(BuildContext context) {
    SearchScreenCubit cubit = SearchScreenCubit.get(context);
    Size size = MediaQuery.of(context).size;
    double buttonWidth = 0.4;
    double buttonHeight = AppSize.s50;
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: AppSize.s80,
        minHeight: AppSize.s60,
        maxWidth: size.width,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: AppPadding.p10,
          horizontal: AppPadding.p20,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppSize.s8),
                boxShadow: [
                  BoxShadow(
                    color: Theme.of(context).colorScheme.shadow,
                    blurRadius: 10,
                    spreadRadius: 2,
                    offset: const Offset(0, 6),
                  ),
                ],
              ),
              width: size.width * buttonWidth,
              height: buttonHeight,
              child: FilledButton(
                onPressed: () {
                  formKey.currentState!.reset();
                  cubit.resetFilter();
                },
                style: FilledButton.styleFrom(
                  alignment: Alignment.center,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(AppSize.s8),
                  ),

                  elevation: AppSize.s10,
                  backgroundColor: Theme.of(context).colorScheme.surface,
                  shadowColor: Theme.of(context).colorScheme.shadow,
                  foregroundColor: Theme.of(context).colorScheme.primary,
                ),
                child: Text(
                  StringsManager.reset,
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onError,
                  ),
                ),
              ),
            ),
            AnimatedBar(isActive: true, inline: true),
            SizedBox(
              width: size.width * buttonWidth,
              height: buttonHeight,
              child: FilledButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    cubit.filterSearch();
                    context.push(RoutesManager.searchResults);
                  }
                },
                style: FilledButton.styleFrom(
                  alignment: Alignment.center,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(AppSize.s8),
                  ),
                  elevation: AppSize.s10,
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  shadowColor: Theme.of(context).colorScheme.shadow,
                  foregroundColor: Theme.of(context).colorScheme.surface,
                ),
                child: Text(
                  StringsManager.search,
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: Theme.of(context).colorScheme.surface,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
