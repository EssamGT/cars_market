import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:constants/values_manager.dart';
import 'package:data/models/car/car_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

class GalleryNetworkPhotoView extends StatefulWidget {
  GalleryNetworkPhotoView({
    super.key,
    this.loadingBuilder,
    this.backgroundDecoration,
    this.minScale,
    this.maxScale,
    this.initialIndex = 0,
    required this.galleryItems,
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
        backgroundColor: Colors.black,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.black,
          statusBarIconBrightness: Brightness.light,
        ) ,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
        actionsPadding: EdgeInsets.all(AppPadding.p12),
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

      heroAttributes: PhotoViewHeroAttributes(
        tag: widget.galleryItems[index].path + index.toString(),
        createRectTween: (begin, end) {
          return MaterialRectCenterArcTween(begin: begin, end: end);
        },
        transitionOnUserGestures: true,
      ),
      basePosition: Alignment.center, // keeps image centered
      tightMode: true,
      gestureDetectorBehavior: HitTestBehavior.opaque,
      
    );
  }
}
