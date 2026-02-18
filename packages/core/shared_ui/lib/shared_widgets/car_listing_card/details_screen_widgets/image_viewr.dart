import 'package:cached_network_image/cached_network_image.dart';
import 'package:constants/values_manager.dart';
import 'package:data/models/car/car_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:shared_ui/shared_widgets/car_listing_card/car_card.dart';

class GalleryNetworkPhotoView extends StatefulWidget {
  GalleryNetworkPhotoView({
    super.key,
    this.loadingBuilder,
    this.backgroundDecoration,
    this.minScale,
    this.maxScale,
    this.initialIndex = 0,
    required this.galleryItems,
    required this.carId,
    this.scrollDirection = Axis.horizontal,
  }) : pageController = PageController(
         initialPage: initialIndex,
         viewportFraction: 1.0,
       );

  final LoadingBuilder? loadingBuilder;
  final BoxDecoration? backgroundDecoration;
  final dynamic minScale;
  final dynamic maxScale;
  final int initialIndex;
  final PageController pageController;
  final List<CarImage> galleryItems;
  final Axis scrollDirection;
  final String carId;

  @override
  State<StatefulWidget> createState() {
    return _GalleryNetworkPhotoViewState();
  }
}

class _GalleryNetworkPhotoViewState extends State<GalleryNetworkPhotoView> {
  late int currentIndex = widget.initialIndex;

  void onPageChanged(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.light,
        ),
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
        actionsPadding: EdgeInsets.all(AppPadding.p12),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.arrow_back_ios_sharp, size: AppSize.s20),
        ),
        actions: [
          Text(
            "${currentIndex + 1} / ${widget.galleryItems.length}",
            style: const TextStyle(
              color: Colors.white,
              fontSize: 17.0,
              decoration: null,
            ),
          ),
        ],
      ),
      body: Container(
        decoration: widget.backgroundDecoration,
        constraints: BoxConstraints.expand(
          height: MediaQuery.of(context).size.height,
        ),
        child: PhotoViewGallery.builder(
          // scrollPhysics: const BouncingScrollPhysics(),
          builder: _buildItem,
          itemCount: widget.galleryItems.length,
          loadingBuilder: widget.loadingBuilder,
          backgroundDecoration: widget.backgroundDecoration,
          pageController: widget.pageController,
          onPageChanged: onPageChanged,
          scrollDirection: widget.scrollDirection,
          wantKeepAlive: false,
          gaplessPlayback: true,
          enableRotation: false,
          scrollPhysics: BouncingScrollPhysics(),
          allowImplicitScrolling: true,
          pageSnapping: true,

          // pageSnapping: true,
        ),
      ),
    );
  }

  PhotoViewGalleryPageOptions _buildItem(BuildContext context, int index) {
    return
    // ? PhotoViewGalleryPageOptions.customChild(
    //     child: Container(
    //       width: 300,
    //       height: 300,
    //       child: SvgPicture.asset(item.resource, height: 200.0),
    //     ),
    //     childSize: const Size(300, 300),
    //     initialScale: PhotoViewComputedScale.contained,
    //     minScale: PhotoViewComputedScale.contained * (0.5 + index / 10),
    //     maxScale: PhotoViewComputedScale.covered * 4.1,
    //     heroAttributes: PhotoViewHeroAttributes(tag: item.id),
    //   )
    PhotoViewGalleryPageOptions(
      imageProvider: CachedNetworkImageProvider(widget.galleryItems[index].url),
      initialScale: PhotoViewComputedScale.contained,
      minScale: PhotoViewComputedScale.contained,
      maxScale: PhotoViewComputedScale.covered * 4.1,

      // heroAttributes: PhotoViewHeroAttributes(
      //   tag: heroTag(widget.carId, index), // make tag unique for each image
      //   // createRectTween: (begin, end) {
      //   //   return MaterialRectCenterArcTween(begin: begin, end: end);
      //   // },
      //   flightShuttleBuilder:
      //       (
      //         flightContext,
      //         animation,
      //         flightDirection,
      //         fromHeroContext,
      //         toHeroContext,
      //       ) => toHeroContext.widget,
      //   transitionOnUserGestures: true,
      // ),
      basePosition: Alignment.center, // keeps image centered
      tightMode: true,
      gestureDetectorBehavior: HitTestBehavior.opaque,
    );
  }
}
