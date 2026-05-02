import 'package:cars_market/globle/globle.dart';
import 'package:constants/values_manager.dart';
import 'package:flutter/material.dart';

class ProfileIcon extends StatelessWidget {
  const ProfileIcon({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);

    return Container(
      constraints: BoxConstraints(
        minHeight: size.height * .13,
        minWidth: size.width,
      ),
      alignment: Alignment.center,
      margin: const EdgeInsets.symmetric(vertical: AppPadding.p20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: AppSize.s20,
        children: [
          CircleAvatar(
            radius: AppSize.s60,
            child: Icon(Icons.person, size: AppSize.s60),
          ),
          Text(
            userData.name,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ],
      ),
    );
  }
}
