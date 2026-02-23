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
    return sellerInfoCard2(context);
  }

  Widget sellerInfoCard2(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(AppSize.s20),
      ),
      margin: EdgeInsets.symmetric(
        horizontal: AppMargin.m12,
        // vertical: AppMargin.m5,
      ),
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(
          horizontal: AppPadding.p10,
          vertical: AppPadding.p10,
        ),

        leading: CircleAvatar(
          radius: AppSize.s22,

          child: Icon(Icons.person_rounded, size: AppSize.s28),
        ),
        title: Text(
          getIt.get<AuthManager>().getUserName(),
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        subtitle: InkWell(
          onTap: () {},
          child: Text(
            StringsManager.viewProfile,
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
        ),
        trailing: Row(
          mainAxisSize: .min,
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
    );
  }
}
