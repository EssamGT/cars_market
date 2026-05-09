import 'dart:math';
import 'package:assets/custom_icons_icons.dart';
import '../cubit/car_listing_cubit.dart';
import 'package:cars_market/di/di.dart';
import 'package:constants/strings_manager.dart';
import 'package:constants/values_manager.dart';
import 'package:data/models/user/user_data.dart';
import 'package:domain/entity/car_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:redacted/redacted.dart';
import 'shared_func.dart';

// done
class SellerInfo extends StatelessWidget {
  final CarEntity car;
  const SellerInfo({super.key, required this.car});
  void callLead() async {
    await getIt.get<CarListingCubit>().lead(car.carId, car.userId);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CarListingCubit, CarListingState>(
      buildWhen: (previous, current) {
        if (current is UserDataLoaded || current is UserDataLoaded) {
          return true;
        } else {
          return false;
        }
      },
      builder: (context, state) {
        if (state is UserDataLoaded) {
          return sellerInfoCard2(context, state.userData);
        }
        return sellerInfoCard2(context, UserData.init(), true);
      },
    );
  }

  Widget sellerInfoCard2(
    BuildContext context,
    UserData userData, [
    bool isLoading = false,
  ]) {
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
        title: FittedBox(
          fit: BoxFit.scaleDown,
          child:
              Text(
                userData.name,
                style: Theme.of(context).textTheme.bodyMedium,
              ).redacted(
                context: context,
                redact: isLoading,
                configuration: RedactedConfiguration(
                  autoFillTexts: true,
                  autoFillText: ".......................",
                ),
              ),
        ),
        subtitle: InkWell(
          onTap: isLoading ? null : () {},
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
              onPressed: isLoading
                  ? null
                  : () {
                      callLead();

                      whatsapp(userData.phoneNumber);
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
              onPressed: isLoading
                  ? null
                  : () {
                      callLead();
                      dialSms(userData.phoneNumber);
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

              onPressed: isLoading
                  ? null
                  : () {
                      callLead();
                      dialPhone(userData.phoneNumber);
                    },
            ),
          ],
        ),
      ),
    );
  }
}
