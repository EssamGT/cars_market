
import 'package:cars_market/di/di.dart';
import 'package:constants/strings_manager.dart';
import 'package:constants/values_manager.dart';
import 'package:data/models/car/brands_models/brands.dart';
import 'package:data/models/car/brands_models/car_catalog.dart';
import 'package:data/models/car/brands_models/car_models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:router/routes_manager.dart';
import 'package:sell/presentation/cubit/sell_cubit.dart';
import 'package:sell/presentation/widgets/sell_steps/step_1/widgets/car_selection/car_selection_button.dart';
import 'package:shared_ui/shared_widgets/selection_page/selection_page_app_bar.dart';

class BrandSelectionPage extends StatefulWidget {
  const BrandSelectionPage({super.key});

  @override
  State<BrandSelectionPage> createState() => _BrandSelectionPageState();
}

class _BrandSelectionPageState extends State<BrandSelectionPage> {
  late TextEditingController controller;
  late List<CarBrand> filteredList = [];

  @override
  void initState() {
    controller = TextEditingController();
    filteredList = CarCatalog.brands;
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void search(String query) {
    final q = query.toLowerCase().trim();
    filteredList = CarCatalog.brands
        .where((brand) => brand.name.toLowerCase().startsWith(q))
        .toList();
    setState(() {});
  }

  EdgeInsets margin = const EdgeInsets.symmetric(
    horizontal: AppPadding.p10,
    vertical: AppPadding.p12,
  );
  EdgeInsets searchPadding = const EdgeInsets.symmetric(
    horizontal: AppPadding.p10,
  );
  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: getIt.get<SellCubit>(),
      child: Scaffold(
        body: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              SelectionPageAppBar(title: StringsManager.selectBrand),
              Padding(
                padding: searchPadding,
                child: SearchBar(
                  hintText: StringsManager.searchForBrand,
                  controller: controller,
                  leading: Icon(
                    Icons.search,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  onChanged: search,
                ),
              ),
              const SizedBox(height: AppSize.s10),
              Expanded(
                child: filteredList.isEmpty
                    ? Center(child: Text(StringsManager.brandNotFound))
                    : ListView.separated(
                        padding: margin,
                        itemCount: filteredList.length,
                        physics: BouncingScrollPhysics(),

                        separatorBuilder: (context, index) => Divider(
                          height: 1,
                          color: Theme.of(
                            context,
                          ).colorScheme.onError.withAlpha(20),
                        ),
                        itemBuilder: (context, index) {
                          final item = filteredList[index];
                          var cubit = SellCubit.get(context);

                          return ListTile(
                            visualDensity: VisualDensity.comfortable,
                            splashColor: Theme.of(
                              context,
                            ).colorScheme.primary.withAlpha(50),
                            titleAlignment: ListTileTitleAlignment.center,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(AppSize.s12),
                            ),
                            title: Text(
                              item.name,
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                            leading: brandLogoBuilder(item, context),
                            trailing: cubit.car.brand.id == item.id
                                ? Icon(
                                    Icons.check_circle_outline_rounded,
                                    size: AppSize.s22,
                                    color: Theme.of(
                                      context,
                                    ).colorScheme.primary,
                                  )
                                : Icon(
                                    Icons.arrow_forward_ios,
                                    size: AppSize.s18,
                                    color: Theme.of(
                                      context,
                                    ).colorScheme.onError,
                                  ),
                            onTap: () async {
                              // cubit.car.setBrand(item);
                              final model = await context.push<CarModel>(
                                RoutesManager.sellModelSelection,
                                extra: item.models,
                              );
                              if (model != null) {
                                final oldBrand = item;
                                CarBrand updatedBrand = CarBrand(
                                  id: oldBrand.id,
                                  name: oldBrand.name,
                                  models: oldBrand.models,
                                  selectedModel: model,
                                );
                                Navigator.of(context).pop(updatedBrand);
                              }
                            },
                          );
                        },
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
