import 'package:add/presentation/cubit/add_cubit.dart';
import 'package:cars_market/di/di.dart';
import 'package:constants/strings_manager.dart';
import 'package:constants/values_manager.dart';
import 'package:data/models/car/brands_models/brands.dart';
import 'package:data/models/car/brands_models/car_models.dart';
import 'package:flutter/material.dart';
import 'package:router/routes_manager.dart';
import 'package:shared_ui/shared_widgets/pop_up/pop_up.dart';

enum CarSelectionType { brand, model }

class CarSelectionPage extends StatefulWidget   {
  final CarSelectionType type;
  const CarSelectionPage({super.key, this.type = CarSelectionType.brand});

  @override
  State<CarSelectionPage> createState() => _CarSelectionPageState();
}

class _CarSelectionPageState extends State<CarSelectionPage> {
  late TextEditingController controller;
  late List<String> filterdList;
  String brand = getIt<AddCubit>().car.brand;
  String model = getIt<AddCubit>().car.model;

  @override
  void initState() {
    controller = TextEditingController();
  
    widget.type == CarSelectionType.brand
        ? filterdList = allCarBrands
        : filterdList = carModels[brand] ?? [];
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void search(String query) {
    widget.type == CarSelectionType.brand
        ? filterdList = allCarBrands
              .where((val) => val.toLowerCase().contains(query.toLowerCase()))
              .toList()
        : filterdList = carModels[getIt<AddCubit>().car.brand]!
              .where((val) => val.toLowerCase().contains(query.toLowerCase()))
              .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                  icon: Icon(
                    Icons.arrow_back_ios_new_outlined,
                    color: Theme.of(context).colorScheme.onError,
                  ),
                  onPressed: () => Navigator.pop(context),
                ),
                SizedBox(
                  // alignment: Alignment.center,
                  width: MediaQuery.sizeOf(context).width - 100,
                  child: Text(
                    widget.type == CarSelectionType.brand
                        ? StringsManager.selectBrand
                        : StringsManager.selectModel,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppPadding.p8,
                vertical: AppPadding.p4,
              ),
              child: SearchBar(
                controller: controller,
                leading: Icon(
                  Icons.search,
                  color: Theme.of(context).colorScheme.primary,
                ),
                trailing: [
                  IconButton(
                    onPressed: () {
                      controller.clear();
                      search('');
                    },
                    icon: Icon(
                      Icons.clear,
                      color: Theme.of(context).colorScheme.onError,
                    ),
                  ),
                ],
                // search
                onChanged: (value) => search(value),
              ),
            ),
            SizedBox(height: AppSize.s10),
            Expanded(
              child: filterdList.isEmpty
                  ? Center(child: Text(StringsManager.noResultsFound))
                  : ListView.builder(
                      padding: EdgeInsets.all(AppPadding.p8),
                      itemCount: filterdList.length,

                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(
                            filterdList[index],

                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          trailing: widget.type == CarSelectionType.model
                              ? null
                              : Icon(
                                  Icons.arrow_forward_ios,
                                  size: AppSize.s18,
                                  color: Theme.of(context).colorScheme.onError,
                                ),
                          onTap: () {
                            if (widget.type == CarSelectionType.brand) {
                              // Navigator.of(context).pop(filterdList[index]);
                              getIt<AddCubit>().car.brand = filterdList[index];
                              getIt<AddCubit>().car.model = '';
                              rightPopUpScreen(
                                context: context,
                                child: CarSelectionPage(
                                  type: CarSelectionType.model,
                                ),
                              );
                            } else {
                              // Navigator.of(context).pop(filterdList[index]);
                              getIt<AddCubit>().car.model = filterdList[index];
                              Navigator.of(context).popUntil(
                                ModalRoute.withName(RoutesManager.add),
                              );
                            }
                          },
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
