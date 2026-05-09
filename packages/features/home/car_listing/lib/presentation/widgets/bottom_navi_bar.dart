import 'package:assets/custom_icons_icons.dart';
import '../cubit/car_listing_cubit.dart';
import 'package:cars_market/di/di.dart';
import 'package:constants/values_manager.dart';
import 'package:domain/entity/car_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'shared_func.dart';

class BottomNaviBar extends StatelessWidget {
  final CarEntity car;
  final bool isVisible;
  const BottomNaviBar({super.key, required this.car, required this.isVisible});

  void callLead() async {
    await getIt.get<CarListingCubit>().lead(car.carId, car.userId);
  }

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
        child: BlocBuilder<CarListingCubit, CarListingState>(
          buildWhen: (previous, current) {
            if (current is UserDataLoaded || current is UserDataLoading) {
              return true;
            } else {
              return false;
            }
          },
          builder: (context, state) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                callButton(
                  context: context,
                  icon: CustomIcons.whatsapp,
                  onPressed: state is UserDataLoading
                      ? () {}
                      : () {
                          callLead();
                          whatsapp(
                            state is UserDataLoaded
                                ? state.userData.phoneNumber
                                : '',
                          );
                        },
                ),
                callButton(
                  context: context,
                  icon: Icons.sms,
                  onPressed: state is UserDataLoading
                      ? () {}
                      : () {
                          callLead();

                          dialSms(
                            state is UserDataLoaded
                                ? state.userData.phoneNumber
                                : '',
                          );
                        },
                ),
                callButton(
                  context: context,
                  icon: Icons.call,
                  onPressed: state is UserDataLoading
                      ? () {}
                      : () {
                          callLead();

                          dialPhone(
                            state is UserDataLoaded
                                ? state.userData.phoneNumber
                                : '',
                          );
                        },
                ),
              ],
            );
          },
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
