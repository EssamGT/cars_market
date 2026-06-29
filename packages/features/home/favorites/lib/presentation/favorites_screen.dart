import 'package:cars_market/di/di.dart';
import 'package:cars_market/globle/globle.dart';
import 'package:constants/strings_manager.dart';
import 'package:favorites/presentation/cubit/favorites_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_ui/shared_widgets/app_bar/base_app_bar.dart';
import 'package:shared_ui/shared_widgets/car_listing_card/car_card.dart';
import 'package:shared_ui/shared_widgets/loading/loading_c.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: getIt.get<FavoritesCubit>(),
      child: Scaffold(
        appBar: BaseAppBar(title: StringsManager.favoritesL, button: false),

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
                child: state.favCars.isEmpty
                    ? Center(child: Text(StringsManager.noFavCars))
                    : ListView.builder(
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
    );
  }
}
