import 'package:assets/custom_icons_icons.dart';
import 'package:cars_market/di/di.dart';
import 'package:constants/strings_manager.dart';
import 'package:constants/values_manager.dart';
import 'package:domain/entity/car_entity.dart';
import 'package:flutter/material.dart';
import 'package:remote/remote/auth/auth_manager.dart';
import 'package:shared_ui/shared_widgets/car_listing_card/details_screen_widgets/shared_func.dart';

// done
class SellerInfo extends StatelessWidget {
  final CarEntity car;
  const SellerInfo({super.key, required this.car});

  @override
  Widget build(BuildContext context) {
    return sellerInfoCard(context);
  }

  Widget sellerInfoCard(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: AppSize.s90,
      margin: EdgeInsets.symmetric(
        horizontal: AppMargin.m12,
        vertical: AppMargin.m10,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppSize.s20),
        color: Theme.of(context).colorScheme.surfaceContainerHighest,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppPadding.p12),
                child: CircleAvatar(
                  radius: AppSize.s22,

                  child: Icon(Icons.person_rounded, size: AppSize.s28),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    getIt.get<AuthManager>().getUserName(),
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  SizedBox(height: AppSize.s2),
                  TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                      minimumSize: const Size(AppSize.s40, AppSize.s25),
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      alignment: Alignment.centerLeft,
                    ),
                    child: Text(
                      StringsManager.viewProfile,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppPadding.p12),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                  tooltip: StringsManager.messageSellerOnWhatsApp,
                  icon: CircleAvatar(
                    radius: AppSize.s22,
                    backgroundColor: Theme.of(
                      context,
                    ).colorScheme.primary.withAlpha(50),

                    child: Icon(
                      CustomIcons.whatsapp,
                      color: Theme.of(context).colorScheme.primary,
                      size: AppSize.s22,
                    ),
                  ),
                  onPressed: () {
                    whatsapp(getIt.get<AuthManager>().getPhoneNumber());
                  },
                ),
                IconButton(
                  tooltip: StringsManager.messageSeller,
                  icon: CircleAvatar(
                    radius: AppSize.s22,
                    backgroundColor: Theme.of(
                      context,
                    ).colorScheme.primary.withAlpha(50),

                    child: Icon(
                      Icons.sms_outlined,
                      color: Theme.of(context).colorScheme.primary,
                      size: AppSize.s22,
                    ),
                  ),
                  onPressed: () {
                    dialSms(getIt.get<AuthManager>().getPhoneNumber());
                  },
                ),
                IconButton(
                  tooltip: StringsManager.callSeller,
                  icon: CircleAvatar(
                    radius: AppSize.s22,
                    backgroundColor: Theme.of(
                      context,
                    ).colorScheme.primary.withAlpha(50),
                    child: Icon(
                      Icons.phone_outlined,
                      color: Theme.of(context).colorScheme.primary,
                      size: AppSize.s22,
                    ),
                  ),
                  onPressed: () {
                    dialPhone(getIt.get<AuthManager>().getPhoneNumber());
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
