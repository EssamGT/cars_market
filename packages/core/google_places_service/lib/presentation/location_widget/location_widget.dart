import 'dart:async';
import 'package:cars_market/globle/localization_service.dart';
import 'package:constants/strings_manager.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:constants/values_manager.dart';
import 'package:domain/entity/car_entity.dart';
import 'package:url_launcher/url_launcher.dart';

class LocationWidget extends StatefulWidget {
  final CarEntity car;
  const LocationWidget({super.key, required this.car});

  @override
  State<LocationWidget> createState() => _LocationWidgetState();
}

class _LocationWidgetState extends State<LocationWidget> {
  final Completer<GoogleMapController> _controller = Completer();
  late bool hasLocation;

  late CameraPosition initialCameraPosition;
  @override
  void initState() {
    hasLocation =
        widget.car.googleMapsLocation?.displayName.text != null &&
        widget.car.googleMapsLocation?.displayName.text.isNotEmpty == true;
    if (hasLocation) {
      initialCameraPosition = CameraPosition(
        target: LatLng(
          widget.car.googleMapsLocation!.location.latitude,
          widget.car.googleMapsLocation!.location.longitude,
        ),
        zoom: 12,
      );
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppSize.s250,
      margin: const EdgeInsets.all(AppMargin.m10),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppSize.s20),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).colorScheme.shadow.withAlpha(70),
            blurRadius: AppSize.s6,
            blurStyle: BlurStyle.outer,
            offset: const Offset(0, 0),
          ),
        ],
      ),
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          hasLocation ? maps() : noLocation(),
          Align(alignment: Alignment.bottomCenter, child: bottomLabel()),
        ],
      ),
    );
  }

  Widget noLocation() {
    return Container(
      padding: const EdgeInsets.all(AppPadding.p8),
      width: double.infinity,
      height: AppSize.s230,
      decoration: BoxDecoration(
        // color: Theme.of(context).colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(AppSize.s20),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.location_off_outlined,
            size: AppSize.s28,
            color: Theme.of(context).colorScheme.onSurfaceVariant,
          ),
          const SizedBox(width: AppSize.s8),
          Text(
            StringsManager.noLocationAvailable,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }

  Widget maps() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(AppSize.s20),
      child: SizedBox(
        width: double.infinity,
        height: AppSize.s230,
        child: GoogleMap(
          initialCameraPosition: initialCameraPosition,
          mapType: MapType.normal,

          markers: {
            // Marker(
            //   markerId: MarkerId('car_location'),
            //   position: LatLng(
            //     widget.car.location.latLng.latitude,
            //     widget.car.location.latLng.longitude,
            //   ),
            //   icon: BitmapDescriptor.defaultMarkerWithHue(
            //     BitmapDescriptor.hueAzure,
            //   ),
            // ),
          },
          scrollGesturesEnabled: false,
          zoomControlsEnabled: false,
          zoomGesturesEnabled: false,
          mapToolbarEnabled: false,
          myLocationButtonEnabled: false,
          compassEnabled: false,
          circles: {
            Circle(
              circleId: CircleId('car_location_circle'),
              center: LatLng(
                widget.car.googleMapsLocation!.location.latitude,
                widget.car.googleMapsLocation!.location.longitude,
              ),
              radius: 3000,
              fillColor: Theme.of(context).colorScheme.primary.withAlpha(50),
              strokeColor: Theme.of(context).colorScheme.primary,
              strokeWidth: 1,
            ),
          },
          onMapCreated: (controller) {
            if (!_controller.isCompleted) {
              _controller.complete(controller);
            }
          },
        ),
      ),
    );
  }

  Widget bottomLabel() {
    return Container(
      padding: const EdgeInsets.all(AppPadding.p8),
      width: double.infinity,
      height: AppSize.s70,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainerHighest,

        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(AppSize.s20),
          bottomRight: Radius.circular(AppSize.s20),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(
                Icons.location_pin,
                size: AppSize.s28,
                color: Theme.of(context).colorScheme.primary,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    ' ${widget.car.location.getName(LocalizationService.isRTL)}',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  Text(
                    ' ${widget.car.location.getGovernorate(LocalizationService.isRTL)}',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
            ],
          ),
          TextButton(
            onPressed: hasLocation
                ? () {
                    openLoctionOnMaps(
                      widget.car.googleMapsLocation!.googleMapsLinks.placeUri,
                    );
                  }
                : null,
            child: Text(StringsManager.getDirections),
          ),
        ],
      ),
    );
  }

  Future<void> openLoctionOnMaps(String link) async {
    final Uri uri = Uri.parse(link);
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  }
}
