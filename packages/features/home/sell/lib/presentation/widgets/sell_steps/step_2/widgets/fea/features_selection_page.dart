
import 'package:cars_market/di/di.dart';
import 'package:cars_market/globle/localization_service.dart';
import 'package:constants/strings_manager.dart';
import 'package:constants/values_manager.dart';
import 'package:data/models/car/brands_models/featrues_catalog.dart';
import 'package:data/models/car/brands_models/features_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sell/presentation/cubit/sell_cubit.dart';
import 'package:sell/presentation/widgets/sell_steps/step_2/widgets/fea/buttom_features_button.dart';
import 'package:shared_ui/shared_widgets/selection_page/selection_page_app_bar.dart';

class FeaturesSelectionPage extends StatefulWidget {
  const FeaturesSelectionPage({super.key});

  @override
  State<FeaturesSelectionPage> createState() => _FeaturesSelectionPageState();
}

List<FeaturesList> fraturesList = featuresCatalog;
EdgeInsets searchPadding = const EdgeInsets.symmetric(
  horizontal: AppPadding.p18,
  // vertical: AppPadding.p2,
);

class _FeaturesSelectionPageState extends State<FeaturesSelectionPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: getIt<SellCubit>(),
      child: Scaffold(
        bottomNavigationBar: const ButtomFeaturesButton(),
        appBar: SelectionPageAppBar(title: StringsManager.featuresTitle),
        body: Column(
          children: [
            Padding(
              padding: searchPadding,
              child: SearchBar(
                onTapOutside: (event) {
                  FocusScope.of(context).unfocus();
                },

                // controller: controller,
                leading: Icon(
                  Icons.search,
                  color: Theme.of(context).colorScheme.primary,
                ),
                hintText: StringsManager.searchLabel,

                // onChanged: (value) => search(value),
              ),
            ),

            Expanded(
              child: ListView.builder(
                itemCount: fraturesList.length,
                itemBuilder: (context, index) {
                  final item = fraturesList[index];
                  return _FeaturesGroup(featuresList: item);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _FeaturesGroup extends StatefulWidget {
  final FeaturesList featuresList;
  const _FeaturesGroup({required this.featuresList});

  @override
  State<_FeaturesGroup> createState() => _FeaturesGroupState();
}

class _FeaturesGroupState extends State<_FeaturesGroup> {
  @override
  Widget build(BuildContext context) {
    var cubit = SellCubit.get(context);

    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: AppPadding.p12,
            vertical: AppPadding.p16,
          ),
            alignment: LocalizationService.isRTL
              ? Alignment.centerRight
              : Alignment.centerLeft,
          child: Text(
            widget.featuresList.title,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ),
        LayoutBuilder(
          builder: (context, constraints) {
            const crossAxisSpacing = AppSize.s12;
            const runSpacing = AppSize.s15;

            return Padding(
              padding: const EdgeInsets.all(AppPadding.p12),
              child: Wrap(
                spacing: crossAxisSpacing,
                runSpacing: runSpacing,
                children: List.generate(widget.featuresList.features.length, (
                  index,
                ) {
                  final item = widget.featuresList.features[index];
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        cubit.addFeature(widget.featuresList, index);
                      });
                    },
                    child: _FeatureTile(
                      featuresModel: item,
                      isSelected: cubit.isFeatureSelected(
                        widget.featuresList,
                        index,
                      ),
                    ),
                  );
                }),
              ),
            );
          },
        ),
      ],
    );
  }
}

class _FeatureTile extends StatelessWidget {
  final bool isSelected;
  final FeatureModel featuresModel;
  const _FeatureTile({required this.featuresModel, this.isSelected = false});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(AppSize.s12),
        border: Border.all(
          color: isSelected
              ? Theme.of(context).primaryColor
              : Theme.of(context).colorScheme.surfaceContainerHighest,
          width: AppSize.s1_5,
        ),
      ),

      constraints: BoxConstraints(
        minWidth: size.width / 2.3,
        maxWidth: size.width / 2.3,
        minHeight: AppSize.s100,
      ),
      padding: EdgeInsets.all(AppPadding.p12),
      child: Column(
        spacing: AppSize.s15,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(featuresModel.icon, size: featuresModel.iconSize ?? AppSize.s30),
          Text(
            featuresModel.name,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}
