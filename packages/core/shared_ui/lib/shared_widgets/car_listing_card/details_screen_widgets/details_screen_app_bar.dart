import 'package:constants/values_manager.dart';
import 'package:domain/entity/car_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_ui/shared_widgets/car_listing_card/details_screen_widgets/shared_func.dart';
// done
class DetailsScreenAppBar extends StatelessWidget {
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
            onPressed: () {},
            icon: Icon(
              Icons.favorite_border,
              color: getIconColor(context),
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
          opacity: isAppBarTransparent ? 0.0 : 1.0,
          duration: Duration(milliseconds: 300),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${car.brand} ${car.model} ${car.year} ${car.version}",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              Text(
                "${priceFormater(car.price)} EGP",
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
    ).colorScheme.surface.withAlpha(startBackgroundChange);
  }

  Color getIconColor(BuildContext context) {
    if (startBackgroundChange < 100) {
      return Theme.of(
        context,
      ).colorScheme.surface.withAlpha(255 - startBackgroundChange);
    }
    return Theme.of(
      context,
    ).colorScheme.onError.withAlpha(startBackgroundChange);
  }

  Brightness getIconBrightness() {
    return Brightness.values[startBackgroundChange > 180 ? 0 : 1];
  }
}

