import 'package:cached_network_image/cached_network_image.dart';
import 'package:redacted/redacted.dart';
import 'image_viewer.dart';
import 'package:domain/entity/car_entity.dart';
import 'package:flutter/material.dart';

class MinCarGalleryWidget extends StatefulWidget {
  final CarEntity car;
  const MinCarGalleryWidget({super.key, required this.car});

  @override
  State<MinCarGalleryWidget> createState() => _MinCarGalleryWidgetState();
}

class _MinCarGalleryWidgetState extends State<MinCarGalleryWidget> {
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

          placeholder: (context, url) {
            return Container().redacted(
              context: context,
              redact: true,
              configuration: RedactedConfiguration(
                defaultBorderRadius: BorderRadius.zero,
              ),
            );
          },
          errorWidget: (context, url, error) => Icon(Icons.error),
        ),
      ),
    );
  }
}
