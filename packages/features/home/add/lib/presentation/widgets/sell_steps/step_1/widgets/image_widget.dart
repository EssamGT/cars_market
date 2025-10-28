import 'dart:io';
import 'package:add/presentation/cubit/add_cubit.dart';
import 'package:cars_market/di/di.dart';
import 'package:constants/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

class ImageWidget extends StatelessWidget {
  final int imageIndex;
  final List<XFile> images;

  const ImageWidget({
    super.key,
    required this.imageIndex,
    required this.images,
  });

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => getIt.get<AddCubit>(),
      child: InkWell(
        onTap: () {
          open(context, imageIndex);
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppSize.s8),
          ),
          margin: const EdgeInsets.all(AppMargin.m8),
          height: AppSize.s93,
          width: screenSize.width / 4,
          child: Stack(
            fit: StackFit.expand,
            alignment: AlignmentGeometry.center,

            children: [
              ClipRRect(
                borderRadius: BorderRadiusGeometry.circular(AppSize.s8),
                child: Image.file(
                  File(images[imageIndex].path),
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: -10,
                right: -10,
                child: IconButton(
                  onPressed: () {
                    AddCubit.get(context).deleteImage(imageIndex);
                    
                  },
                  icon: Icon(
                    Icons.delete,
                    color: Theme.of(context).colorScheme.error,
                    size: AppSize.s20,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void open(BuildContext context, final int index) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => GalleryPhotoViewWrapper(
          galleryItems: images,
          backgroundDecoration: const BoxDecoration(color: Colors.black),
          initialIndex: index,
          scrollDirection: Axis.horizontal,
        ),
      ),
    );
  }

  // void open2(BuildContext context, final int index) {
  //   Navigator.push(
  //     context,
  //     MaterialPageRoute(
  //       builder: (context) => PV(images: images, initialIndex: index),
  //     ),
  //   );
  // }
}

class GalleryPhotoViewWrapper extends StatefulWidget {
  GalleryPhotoViewWrapper({
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
  final List<XFile> galleryItems;
  final Axis scrollDirection;

  @override
  State<StatefulWidget> createState() {
    return _GalleryPhotoViewWrapperState();
  }
}

class _GalleryPhotoViewWrapperState extends State<GalleryPhotoViewWrapper> {
  late int currentIndex = widget.initialIndex;

  void onPageChanged(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
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
      imageProvider: Image.file(File(widget.galleryItems[index].path)).image,
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
