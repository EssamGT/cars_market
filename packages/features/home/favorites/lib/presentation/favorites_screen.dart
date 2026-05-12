import 'package:cars_market/di/di.dart';
import 'package:cars_market/globle/globle.dart';
import 'package:favorites/presentation/cubit/favorites_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_ui/shared_widgets/car_listing_card/car_card.dart';
import 'package:shared_ui/shared_widgets/loading/loading_c.dart' show LoadingC;

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: getIt.get<FavoritesCubit>(),
      child: SafeArea(
        bottom: false,
        child: Scaffold(
          // appBar: BaseAppBar(title: StringsManager.favoritesL, button: false),

          body: BlocBuilder<FavoritesCubit, FavoritesState>(
            builder: (context, state) {
              if (state is Error) {
                return RefreshIndicator(
                  onRefresh: () {
                    return getIt.get<FavoritesCubit>().getFavCars(
                      userData.favoriteCarsIds,
                    );
                  },

                  child: Center(child: Text(state.failure.message)),
                );
              }
              if (state is Success) {
                return RefreshIndicator(
                  onRefresh: () {
                    return getIt.get<FavoritesCubit>().getFavCars(
                      userData.favoriteCarsIds,
                    );
                  },
                  child: ListView.builder(
                    itemCount: state.favCars.length,

                    itemBuilder: (context, index) =>
                        CarCard(car: state.favCars[index]),
                  ),
                );
              }
              return LoadingC();
            },
          ),
        ),
      ),
    );
  }
}
