import 'package:add/presentation/cubit/add_cubit.dart';
import 'package:constants/strings_manager.dart';
import 'package:constants/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BrandSlection extends StatefulWidget {
  final SearchCarType type;
  const BrandSlection({super.key, required this.type});

  @override
  State<BrandSlection> createState() => _BrandSlectionState();
}

class _BrandSlectionState extends State<BrandSlection> {
  late TextEditingController controller;

  @override
  void initState() {
    controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Size screenSize = MediaQuery.of(context).size;
    var cubit = AddCubit.get(context);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppPadding.p8),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () => Navigator.pop(context),
                  ),
                  Text(
                    widget.type == SearchCarType.brand
                        ? StringsManager.brands
                        : StringsManager.models,
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                ],
              ),
              SearchBar(
                controller: controller,
                leading: Icon(Icons.search),
                trailing: [
                  IconButton(
                    onPressed: () {
                      controller.clear();
                      switch (widget.type) {
                        case SearchCarType.brand:
                          cubit.search('', SearchCarType.brand);
                        case SearchCarType.model:
                          cubit.search('', SearchCarType.model);
                      }
                    },
                    icon: Icon(Icons.clear),
                  ),
                ],

                onChanged: (value) => cubit.search(value, widget.type),
              ),
              SizedBox(height: AppSize.s10),
              BlocBuilder<AddCubit, AddState>(
                builder: (context, state) {
                  return Expanded(
                    child:
                        widget.type == SearchCarType.brand &&
                            cubit.filterdBrands.isEmpty
                        ? Center(child: Text('No brands found'))
                        : widget.type == SearchCarType.model &&
                              cubit.filterdModels.isEmpty
                        ? Center(child: Text('No models found'))
                        : ListView.builder(
                            itemCount: widget.type == SearchCarType.brand
                                ? cubit.filterdBrands.length
                                : cubit.filterdModels.length,
                            itemBuilder: (context, index) {
                              return ListTile(
                                title: Text(
                                  widget.type == SearchCarType.brand
                                      ? cubit.filterdBrands[index]
                                      : cubit.filterdModels[index],
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                                onTap: () {
                                  Navigator.of(context).pop();
                                  widget.type == SearchCarType.brand
                                      ? cubit.slectBrand(
                                          cubit.filterdBrands[index],
                                        )
                                      : cubit.slectModel(
                                          cubit.filterdModels[index],
                                        );
                                },
                              );
                            },
                          ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
