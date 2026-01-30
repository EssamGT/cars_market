import 'package:assets/custom_icons_icons.dart';
import 'package:cars_market/di/di.dart';
import 'package:constants/values_manager.dart';
import 'package:domain/entity/car_entity.dart';
import 'package:flutter/material.dart';
import 'package:remote/remote/auth/auth_manager.dart';
import 'package:shared_ui/shared_widgets/car_listing_card/details_screen_widgets/shared_func.dart';

class BottomNaviBar extends StatelessWidget {
  final CarEntity car;
  final bool isVisible;
  const BottomNaviBar({super.key, required this.car, required this.isVisible});

  @override
  Widget build(BuildContext context) {
    return AnimatedSlide(
      duration: const Duration(milliseconds: 300),
      offset: isVisible ? Offset.zero : const Offset(0, 1),
      child: Container(
        height: AppSize.s70,
        width: double.maxFinite,
        color: Theme.of(context).colorScheme.surface,
        padding: const EdgeInsets.symmetric(
          horizontal: AppPadding.p16,
          // vertical: AppPadding.p10,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            callButton(
              context: context,
              icon: CustomIcons.whatsapp,
              onPressed: () {
                whatsapp(getIt.get<AuthManager>().getPhoneNumber());
              },
            ),
            callButton(
              context: context,
              icon: Icons.sms,
              onPressed: () {
                dialSms(getIt.get<AuthManager>().getPhoneNumber());
              },
            ),
            callButton(
              context: context,
              icon: Icons.call,
              onPressed: () {
                dialPhone(getIt.get<AuthManager>().getPhoneNumber());
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget callButton({
    required BuildContext context,
    required IconData icon,
    required VoidCallback onPressed,
  }) {
    Size size = MediaQuery.of(context).size;
    return FilledButton(
      onPressed: onPressed,
      style: FilledButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSize.s8),
        ),
        maximumSize: Size(size.width / 3, AppSize.s50),
        minimumSize: Size(size.width / 3.5, AppSize.s50),
        
      ),
      child: Icon(icon, size: AppSize.s25),
    );
  }
}


