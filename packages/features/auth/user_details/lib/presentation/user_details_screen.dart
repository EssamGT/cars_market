import 'package:cars_market/di/di.dart';
import 'package:constants/strings_manager.dart';
import 'package:constants/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_ui/shared_widgets/massege_bar/error_message_bar.dart';
import 'package:shared_ui/shared_widgets/pop_up/loading_pop_up.dart';
import 'package:user_details/presentation/cubit/user_details_cubit.dart';
import 'package:user_details/presentation/widgets/continue_button.dart';
import 'package:user_details/presentation/widgets/email_phone_verify.dart';
import 'package:user_details/presentation/widgets/user_image_widget.dart';
import 'package:user_details/presentation/widgets/user_name_text_field.dart';
import 'package:user_details/presentation/widgets/user_phone_number_text_field.dart';

GlobalKey<FormState> formKey = GlobalKey<FormState>();

class UserDetailsScreen extends StatefulWidget {
  const UserDetailsScreen({super.key});

  @override
  State<UserDetailsScreen> createState() => _UserDetailsScreenState();
}

class _UserDetailsScreenState extends State<UserDetailsScreen> {
  @override
  void initState() {
    getIt.resetLazySingleton<UserDetailsCubit>();

    super.initState();
  }

  @override
  void dispose() {
    getIt<UserDetailsCubit>().close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: getIt<UserDetailsCubit>(),
      child: BlocConsumer<UserDetailsCubit, UserDetailsState>(
        buildWhen: (previous, current) {
          if (current is UserDetailsInitial ||
              current is UserDetailsGStopLoading ||
              current is UserDetailsGError) {
            return true;
          } else {
            return false;
          }
        },
        listener: (context, state) {
          if (state is UserDetailsGError) {
            LoadingPopUp.hide();
            MessageBar.show(context, state.failure.message);
          }
          // if (state is UserDetailsInitial) {
          //   LoadingPopUp.show(context: context, type: PopupType.loadingDots);
          // } else {
          //   LoadingPopUp.hide();
          // }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: Text(StringsManager.completeYourProfile),
              centerTitle: true,
              forceMaterialTransparency: true,
            ),
            bottomNavigationBar: ContinueButton(enable: true),
            body: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  spacing: AppSize.s10,
                  children: [
                    UserImageWidget(loading: state is UserDetailsInitial),
                    UserNameTextField(loading: state is UserDetailsInitial),
                    UserPhoneNumberTextField(loading: state is UserDetailsInitial),
                    EmailPhoneVerify(loading: state is UserDetailsInitial),

                    // Spacer(),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
