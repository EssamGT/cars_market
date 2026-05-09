import 'package:cars_market/di/di.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:listed_cars/presentation/cubit/listed_cars_cubit.dart';
import 'package:listed_cars/presentation/widgets/listed_cars_card.dart';
import 'package:shared_ui/shared_widgets/loading/loading_c.dart';

class ListedCarsScreen extends StatelessWidget {
  const ListedCarsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: getIt.get<ListedCarsCubit>(),
      child: Scaffold(
        body: BlocBuilder<ListedCarsCubit, ListedCarsState>(
          builder: (context, state) {
            if (state is ListedCarsLoaded) {
              if (state.listedCars.isEmpty) {
                return Center(child: Text('No listed cars found.'));
              }
              final cars = state.listedCars;
              return RefreshIndicator(
                onRefresh: () {
                  return ListedCarsCubit.get(context).getListedCars();
                },
                child: ListView.builder(
                  itemCount: cars.length,
                  itemBuilder: (context, index) {
                    final car = cars[index];
                    return ListedCarCard(car: car);
                  }
                ),
              );
            }
            if (state is ListedCarsError) {
              return Center(child: Text(state.failure.message));
            }

            return LoadingC();
          },
        ),
      ),
    );
  }
}
