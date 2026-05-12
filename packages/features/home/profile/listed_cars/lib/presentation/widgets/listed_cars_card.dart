import 'package:cached_network_image/cached_network_image.dart';
import 'package:constants/strings_manager.dart';
import 'package:constants/values_manager.dart';
import 'package:data/models/car/car_status.dart';
import 'package:domain/entity/car_entity.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:listed_cars/presentation/cubit/listed_cars_cubit.dart';
import 'package:listed_cars/presentation/widgets/status_widget.dart';
import 'package:redacted/redacted.dart';
import 'package:router/routes_manager.dart';
import 'package:shared_ui/shared_widgets/car_listing_card/brand_logo_builder.dart';

String heroTag(String carId, int index) => 'carImageHeroTag_${carId}_$index';

class ListedCarCard extends StatefulWidget {
  final CarEntity car;
  const ListedCarCard({super.key, required this.car});

  @override
  State<ListedCarCard> createState() => _ListedCarCardState();
}

class _ListedCarCardState extends State<ListedCarCard>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return GestureDetector(
      onTap: () async {
        context.push(RoutesManager.carDetails, extra: widget.car);
      },
      child: Container(
        height: AppSize.s400,
        margin: EdgeInsets.all(AppMargin.m14),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.onSecondary,
          borderRadius: BorderRadius.circular(AppSize.s20),
          boxShadow: [
            BoxShadow(
              color: Theme.of(
                context,
              ).shadowColor.withAlpha(20), // very light (5%)
              blurRadius: AppSize.s6, // smaller blur for subtle depth
              spreadRadius: AppSize.s1, // minimal spread
              offset: const Offset(0, 2), // small downward offset
            ),
          ],
        ),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              transitionOnUserGestures: true,
              tag: heroTag(widget.car.carId, 0),
              // make tag unique for each car
              flightShuttleBuilder:
                  (
                    flightContext,
                    animation,
                    flightDirection,
                    fromHeroContext,
                    toHeroContext,
                  ) {
                    return toHeroContext.widget;
                  },
              child: ClipRRect(
                borderRadius: BorderRadiusGeometry.only(
                  topLeft: Radius.circular(AppSize.s20),
                  topRight: Radius.circular(AppSize.s20),
                ),
                child: CachedNetworkImage(
                  imageUrl: widget.car.carImages.first.url,
                  height: AppSize.s200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  placeholder: (context, url) =>
                      Container(
                        color: Theme.of(
                          context,
                        ).colorScheme.surfaceContainerHighest,
                        height: AppSize.s200,
                        width: double.infinity,
                      ).redacted(
                        context: context,
                        redact: true,
                        configuration: RedactedConfiguration(
                          defaultBorderRadius: BorderRadius.only(
                            topLeft: Radius.circular(AppSize.s20),
                            topRight: Radius.circular(AppSize.s20),
                          ),
                        ),
                      ),

                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppPadding.p12,
                vertical: AppPadding.p16,
              ),
              child: Column(
                spacing: 5,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    carInfoBuilderListedCar(widget.car),
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),

                  Transform.translate(
                    offset: Offset(-4, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      // spacing: AppSize.s,
                      children: [
                        Icon(Icons.location_on_outlined, size: AppSize.s20),

                        Text(
                          widget.car.location.getLocationName(),
                          style: Theme.of(context).textTheme.labelLarge,
                        ),
                      ],
                    ),
                  ),
                  Row(
                    spacing: AppSize.s12,
                    children: [
                      StatusWidget(status: widget.car.status),
                      IconsWidget(
                        count: widget.car.views.length.toString(),
                        icon: Icons.remove_red_eye_outlined,
                        label: StringsManager.views,
                      ),
                      IconsWidget(
                        count: widget.car.leads.length.toString(),
                        icon: Icons.person_search_outlined,
                        label: StringsManager.leads,
                      ),
                    ],
                  ),
                  Text(
                    widget.car.getPrice(),
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  SizedBox(height: AppSize.s5),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      ListedCarsButton(
                        label: StringsManager.edit,
                        iconData: Icons.edit_outlined,
                        onPressed: () {
                          context.push(
                            RoutesManager.editCar,
                            extra: widget.car.toEditModel(),
                          );
                        },
                      ),
                      ListedCarsButton(
                        label: widget.car.status == CarStatus.deactivated
                            ? StringsManager.reactivate
                            : StringsManager.deactivate,
                        outlined: true,
                        iconData: widget.car.status == CarStatus.deactivated
                            ? Icons.public_outlined
                            : Icons.public_off_outlined,
                        onPressed: () {
                          if (widget.car.status == CarStatus.deactivated) {
                            var cubit = ListedCarsCubit.get(context);
                            cubit.reactivateCar(widget.car.carId);
                          } else {
                            var cubit = ListedCarsCubit.get(context);
                            cubit.deactivateCar(widget.car.carId);
                          }
                        },
                        isActivateButton:
                            widget.car.status == CarStatus.deactivated,
                      ),
                      ListedCarsButton(
                        label: StringsManager.delete,
                        iconData: Icons.delete_outline,
                        outlined: true,
                        onPressed: () {
                          var cubit = ListedCarsCubit.get(context);
                          cubit.deleteCar(widget.car.carId);
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class IconsWidget extends StatelessWidget {
  final IconData icon;
  final String count;
  final String label;
  const IconsWidget({
    super.key,
    required this.icon,
    required this.count,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          size: AppSize.s20,
          // color: Theme.of(context).colorScheme.primary,
        ),
        SizedBox(width: AppSize.s4),
        Text(count, style: Theme.of(context).textTheme.labelLarge),
        SizedBox(width: AppSize.s4),

        Text(label, style: Theme.of(context).textTheme.labelLarge),
      ],
    );
  }
}

class ListedCarsButton extends StatelessWidget {
  final IconData iconData;
  final bool outlined;
  final VoidCallback? onPressed;
  final String label;
  final bool isActivateButton;
  const ListedCarsButton({
    super.key,
    this.outlined = false,
    this.onPressed,
    required this.label,
    required this.iconData,
    this.isActivateButton = false,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    EdgeInsets padding = MediaQuery.paddingOf(context);
    return FilledButton(
      onPressed: onPressed,

      style: FilledButton.styleFrom(
        padding: const EdgeInsets.all(AppPadding.p10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSize.s8),
          side: isActivateButton
              ? BorderSide(color: Theme.of(context).colorScheme.primary)
              : outlined
              ? BorderSide(color: Theme.of(context).colorScheme.error)
              : BorderSide.none,
        ),
        minimumSize: Size(
          (size.width + padding.left + padding.right) / 4,
          AppSize.s50,
        ),

        // maximumSize: Size(size.width / 2, AppSize.s50),
        backgroundColor: outlined
            ? Colors.transparent
            : Theme.of(context).colorScheme.primary,
        overlayColor: isActivateButton
            ? Theme.of(context).colorScheme.primary.withAlpha(30)
            : outlined
            ? Theme.of(context).colorScheme.error.withAlpha(30)
            : null,
      ),

      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            iconData,
            size: AppSize.s20,
            color: isActivateButton
                ? Theme.of(context).colorScheme.primary
                : outlined
                ? Theme.of(context).colorScheme.error
                : Theme.of(context).colorScheme.surface,
          ),
          SizedBox(width: AppSize.s4),
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              label,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: isActivateButton
                    ? Theme.of(context).colorScheme.primary
                    : outlined
                    ? Theme.of(context).colorScheme.error
                    : Theme.of(context).colorScheme.surface,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
