import 'package:cars_market/di/di.dart';
import 'package:constants/strings_manager.dart';
import 'package:constants/values_manager.dart';
import 'package:data/models/car/brands_models/car_models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sell/presentation/cubit/sell_cubit.dart';
import 'package:shared_ui/shared_widgets/selection_page/selection_page_app_bar.dart';

class ModelSelectionPage extends StatefulWidget {
  final List<CarModel> models;
  const ModelSelectionPage({super.key, required this.models});

  @override
  State<ModelSelectionPage> createState() => _ModelSelectionPageState();
}

class _ModelSelectionPageState extends State<ModelSelectionPage> {
  late TextEditingController controller;
  late List<CarModel> filteredList = [];

  @override
  void initState() {
    controller = TextEditingController();
    filteredList = widget.models;
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void search(String query) {
    final q = query.toLowerCase().trim();
    final models = widget.models;
    filteredList = models
        .where((model) => model.name.toLowerCase().startsWith(q))
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
              SelectionPageAppBar(title: StringsManager.selectModel),
              Padding(
                padding: searchPadding,
                child: SearchBar(
                  hintText: StringsManager.searchForModel,
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
                    ? Center(child: Text(StringsManager.modelNotFound))
                    : ListView.separated(
                        padding: margin,
                        itemCount: filteredList.length,
                        separatorBuilder: (context, index) => Divider(
                          height: 1,
                          color: Theme.of(
                            context,
                          ).colorScheme.onError.withAlpha(20),
                        ),
                        itemBuilder: (context, index) {
                          var cubit = SellCubit.get(context);

                          final item = filteredList[index];
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
                            trailing:
                                cubit.car.brand.selectedModel.id == item.id
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
                            onTap: () {
                              Navigator.of(context).pop(item);
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
