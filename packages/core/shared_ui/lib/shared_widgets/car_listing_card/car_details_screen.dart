import 'package:constants/values_manager.dart';
import 'package:domain/entity/car_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_ui/shared_widgets/car_listing_card/details_screen_widgets/bottom_navi_bar.dart';
import 'package:shared_ui/shared_widgets/car_listing_card/details_screen_widgets/car_features_widget.dart';
import 'package:shared_ui/shared_widgets/car_listing_card/details_screen_widgets/car_gallary_widget.dart';
import 'package:shared_ui/shared_widgets/car_listing_card/details_screen_widgets/car_location_widget.dart';
import 'package:shared_ui/shared_widgets/car_listing_card/details_screen_widgets/car_specs_widget.dart';
import 'package:shared_ui/shared_widgets/car_listing_card/details_screen_widgets/details_screen_app_bar.dart';
import 'package:shared_ui/shared_widgets/car_listing_card/details_screen_widgets/description_widget.dart';
import 'package:shared_ui/shared_widgets/car_listing_card/details_screen_widgets/detailed_info_widget.dart';
import 'package:shared_ui/shared_widgets/car_listing_card/details_screen_widgets/modifications_widget.dart';
import 'package:shared_ui/shared_widgets/car_listing_card/details_screen_widgets/seller_info.dart';
import 'package:shared_ui/shared_widgets/car_listing_card/details_screen_widgets/service_history_widget.dart';
import 'package:get/get.dart';

// done
class CarDetailsScreen extends StatefulWidget {
  final CarEntity car;
  const CarDetailsScreen({super.key, required this.car});

  @override
  State<CarDetailsScreen> createState() => _CarDetailsScreenState();
}

class _CarDetailsScreenState extends State<CarDetailsScreen> {
  late ScrollController _scrollController;
  bool visibility = false;
  Rx<bool> isVisible = false.obs;
  Rx<bool> isAppBarTransparent = true.obs;
  Rx<int> startBackChange = 0.obs;
  double divider = 1.568627451;
  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);
    _scrollController.addListener(_appBarOnScroll);
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.removeListener(_appBarOnScroll);
    _scrollController.dispose();
    if (isAppBarTransparent.value) {
      SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.light,
        ),
      );
    }
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.offset > 800 && !isVisible.value) {
      isVisible.value = true;
    } else if (_scrollController.offset <= 800 && isVisible.value) {
      isVisible.value = false;
    }
  }

  void _appBarOnScroll() {
    if (_scrollController.offset <= 200 && !isAppBarTransparent.value) {
      isAppBarTransparent.value = true;
    } else if (_scrollController.offset > 200 && isAppBarTransparent.value) {
      isAppBarTransparent.value = false;
    }
    if (_scrollController.offset <= 400) {
      startBackChange.value = (_scrollController.offset / divider).toInt();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              spacing: AppSize.s30,
              children: [
                CarGallaryWidget(car: widget.car),
                CarSpecsWidget(car: widget.car),
                SellerInfo(car: widget.car),
                CarLocationWidget(car: widget.car),
                DescriptionWidget(car: widget.car),
                DetailedInfoWidget(car: widget.car),
                CarFeaturesWidget(car: widget.car),
                ServiceHistoryWidget(car: widget.car),
                Modifications(car: widget.car),
                SizedBox(height: AppSize.s80),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Obx(
              () => BottomNaviBar(car: widget.car, isVisible: isVisible.value),
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Obx(
              () => DetailsScreenAppBar(
                isAppBarTransparent: isAppBarTransparent.value,
                startBackgroundChange: startBackChange.value,
                car: widget.car,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
