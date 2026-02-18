import 'package:cached_network_image/cached_network_image.dart';
import 'package:domain/entity/car_entity.dart';
import 'package:flutter/material.dart';
import 'package:shared_ui/shared_widgets/car_listing_card/details_screen_widgets/image_viewr.dart';

class MinCarGallaryWidget extends StatefulWidget {
  final CarEntity car;
  const MinCarGallaryWidget({super.key, required this.car});

  @override
  State<MinCarGallaryWidget> createState() => _MinCarGallaryWidgetState();
}

class _MinCarGallaryWidgetState extends State<MinCarGallaryWidget> {
  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      itemCount: widget.car.carImages.length,
      padEnds: true,

      itemBuilder: (context, index) => GestureDetector(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => GalleryNetworkPhotoView(
                galleryItems: widget.car.carImages,
                initialIndex: index,
                carId: widget.car.carId,
              ),
            ),
          );
        },
        child: CachedNetworkImage(
          imageUrl: widget.car.carImages[index].url,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
