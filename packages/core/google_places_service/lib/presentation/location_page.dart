import 'package:cars_market/di/di.dart';
import 'package:constants/strings_manager.dart';
import 'package:constants/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_places_service/presentation/cubit/location_cubit.dart';

class LocationPage extends StatefulWidget {
  // PredictionsEntity assignedValueTo;
  const LocationPage({super.key});

  @override
  State<LocationPage> createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  late TextEditingController controller;
  late List<String> filterdList;

  @override
  void initState() {
    controller = TextEditingController();
    filterdList = [];

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void search(String query) {}

  @override
  Widget build(BuildContext context) {
    // Size screenSize = MediaQuery.of(context).size;

    return BlocProvider<LocationCubit>(
      create: (context) => getIt.get<LocationCubit>(),
      child: Builder(
        builder: (context) => Scaffold(
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
                      StringsManager.location.replaceAll("*", ""),
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
                        // search('');
                      },
                      icon: Icon(Icons.clear),
                    ),
                  ],
                  // search
                  onChanged: (value) =>
                      LocationCubit.get(context).search(value),
                ),

                SizedBox(height: AppSize.s10),
                BlocConsumer<LocationCubit, LocationState>(
                  listener: (context, state) {
                    // TODO: implement listener
                  },
                  builder: (context, state) {
                    if (state is Success) {
                      return Expanded(
                        child: state.selectedLocation.predictions.isEmpty
                            ? Center(child: Text('No results found'))
                            : ListView.builder(
                                itemCount:
                                    state.selectedLocation.predictions.length,

                                itemBuilder: (context, index) {
                                  return ListTile(
                                    leading: Icon(
                                      Icons.location_pin,
                                      color: Theme.of(
                                        context,
                                      ).colorScheme.primary,
                                    ),
                                    title: Text(
                                      state
                                          .selectedLocation
                                          .predictions[index]
                                          .structuredFormatting
                                          .mainText,

                                      style: Theme.of(
                                        context,
                                      ).textTheme.bodyMedium,
                                    ),
                                    subtitle: Text(
                                      state
                                          .selectedLocation
                                          .predictions[index]
                                          .structuredFormatting
                                          .secondaryText
                                          .replaceAll(", Egypt", ""),

                                      style: Theme.of(
                                        context,
                                      ).textTheme.bodySmall,
                                    ),
                                    onTap: () {
                                      Navigator.of(context).pop(
                                        state
                                            .selectedLocation
                                            .predictions[index],
                                      );
                                    },
                                  );
                                },
                              ),
                      );
                    }
                    if (state is Error) {
                      return Expanded(
                        child: Center(
                          child: Text(
                            'Error occurred: ${state.errorMessage.message}',
                          ),
                        ),
                      );
                    } else {
                      return Expanded(
                        child: Center(child: Text('No results found')),
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      ),
    );
  }
}
