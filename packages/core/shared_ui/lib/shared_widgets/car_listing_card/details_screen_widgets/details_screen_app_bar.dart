import 'package:cars_market/di/di.dart';
import 'package:cars_market/globle/globle.dart';
import 'package:constants/values_manager.dart';
import 'package:domain/entity/car_entity.dart';
import 'package:favorites/presentation/cubit/favorites_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:remote/remote/firebase/firebase_db_manager.dart';

// done
class DetailsScreenAppBar extends StatefulWidget {
  final CarEntity car;
  final bool isAppBarTransparent;
  final int startBackgroundChange;
  const DetailsScreenAppBar({
    super.key,
    required this.car,
    required this.isAppBarTransparent,
    required this.startBackgroundChange,
  });

  @override
  State<DetailsScreenAppBar> createState() => _DetailsScreenAppBarState();
}

class _DetailsScreenAppBarState extends State<DetailsScreenAppBar> {
  final fire = getIt.get<FirebaseDbManager>();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      width: size.width,
      color: getBackgroundColor(context),
      child: AppBar(
        forceMaterialTransparency: true,
        // backgroundColor: getBackgroundColor(context),
        systemOverlayStyle: SystemUiOverlayStyle(
          // statusBarColor: getBackgroundColor(context),
          statusBarIconBrightness: getIconBrightness(),
          statusBarBrightness: getIconBrightness(),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.arrow_back_ios_sharp,
            color: getIconColor(context),
            size: AppSize.s20,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              if (userData.favoriteCarsIds.contains(widget.car.carId)) {
                removeFromFavorite();
              } else {
                addToFavorite();
              }
              setState(() {});
            },
            icon: Icon(
              userData.favoriteCarsIds.contains(widget.car.carId)
                  ? Icons.favorite
                  : Icons.favorite_border,
              color: userData.favoriteCarsIds.contains(widget.car.carId)
                  ? Theme.of(context).colorScheme.error
                  : getIconColor(context),
              size: AppSize.s20,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.share,
              color: getIconColor(context),
              size: AppSize.s20,
            ),
          ),
        ],
        title: AnimatedOpacity(
          opacity: widget.isAppBarTransparent ? 0.0 : 1.0,
          duration: Duration(milliseconds: 300),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${widget.car.brand} ${widget.car.model} ${widget.car.year} ${widget.car.version}",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              Text(
                widget.car.getPrice(),
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Color getBackgroundColor(BuildContext context) {
    return Theme.of(
      context,
    ).colorScheme.surface.withAlpha(widget.startBackgroundChange);
  }

  Color getIconColor(BuildContext context) {
    if (widget.startBackgroundChange < 100) {
      return Theme.of(
        context,
      ).colorScheme.surface.withAlpha(255 - widget.startBackgroundChange);
    }
    return Theme.of(
      context,
    ).colorScheme.onError.withAlpha(widget.startBackgroundChange);
  }

  Brightness getIconBrightness() {
    return Brightness.values[widget.startBackgroundChange > 180 ? 0 : 1];
  }

  Future<void> addToFavorite() async {
    userData.favoriteCarsIds.add(widget.car.carId);
    await fire.addCarToFavorites(widget.car.carId);
    getIt.get<FavoritesCubit>().getFavCars(userData.favoriteCarsIds);
  }

  Future<void> removeFromFavorite() async {
    userData.favoriteCarsIds.remove(widget.car.carId);
    await fire.removeCarFromFavorites(widget.car.carId);
    getIt.get<FavoritesCubit>().getFavCars(userData.favoriteCarsIds);
  }
}
