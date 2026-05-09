import 'package:cars_market/di/di.dart';
import 'package:constants/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:profile/presentation/cubit/profile_cubit.dart';
import 'package:profile/presentation/widgets/account_list.dart';
import 'package:profile/presentation/widgets/pref_list.dart';
import 'package:profile/presentation/widgets/support_list.dart';
import 'widgets/user_details_widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: BlocProvider.value(
        value: getIt.get<ProfileCubit>(),
        child: Scaffold(
          body: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              spacing: AppSize.s15,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                UserDetailsWidget(),
                AccountList(),
                PrefList(),
                SupportList(),
                SizedBox(height: AppSize.s100),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
