import 'package:cars_market/globle/globle.dart';
import 'package:constants/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:profile/presentation/cubit/profile_cubit.dart';

class UserDetailsWidget extends StatelessWidget {
  const UserDetailsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.sizeOf(context);
    return Container(
      margin: const EdgeInsets.only(top: AppMargin.m20),
      padding: const EdgeInsets.symmetric(vertical: AppPadding.p16),
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: AppSize.s20,
        children: [
          CircleAvatar(
            radius: AppSize.s50,
            child: Icon(Icons.person, size: AppSize.s50),
          ),
          BlocBuilder<ProfileCubit, ProfileState>(
            buildWhen: (previous, current) {
              if (current is ProfileNameUpdate) {
                return true;
              }
              return false;
            },
            builder: (context, state) {
              return Text(
                userData.name,
                style: Theme.of(context).textTheme.headlineSmall,
              );
            },
          ),
        ],
      ),
    );
  }
}
