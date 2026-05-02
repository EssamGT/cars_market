import 'package:constants/strings_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:router/routes_manager.dart';
import 'package:shared_ui/shared_widgets/alert_bar/error_message_bar.dart';
import 'package:shared_ui/shared_widgets/pop_up/loading_pop_up.dart';
import 'package:user_details/presentation/cubit/user_details_cubit.dart';
import 'package:user_details/presentation/user_details_screen.dart';
import 'package:user_details/presentation/widgets/verify_widget.dart';

class EmailPhoneVerify extends StatelessWidget {
  final bool loading;
  const EmailPhoneVerify({super.key, required this.loading});
  @override
  Widget build(BuildContext context) {
    var cubit = UserDetailsCubit.get(context);

    return Column(
      children: [
        BlocConsumer<UserDetailsCubit, UserDetailsState>(
          buildWhen: (previous, current) {
            if (current is SendEmailVerificationStateError ||
                current is EmailVerified) {
              return true;
            } else {
              return false;
            }
          },
          listener: (context, state) {
            if (state is SendEmailVerificationStateError) {
              MessageBar.show(
                context,
                state.failure.message,
                MessageBarType.error,
              );
            }
            if (state is EmailVerificationSend) {
              MessageBar.show(
                context,
                StringsManager.emailVerificationSent,
                MessageBarType.success,
              );
            }
          },
          builder: (context, state) {
            return VerifyWidget(
              loading: loading,
              verified: state is EmailVerified,
              title: StringsManager.email,
              onVerify: () {
                if (formKey.currentState!.validate()) {
                  // formKey.currentState!.save();
                  cubit.sendEmailVerification();
                }
              },
            );
          },
        ),

        BlocConsumer<UserDetailsCubit, UserDetailsState>(
          buildWhen: (previous, current) {
            if (current is PhoneVerified ||
                current is PhoneVerificationError ||
                current is PhoneVerificationSend ||
                current is PhoneVerificationSendingLoading) {
              return true;
            } else {
              return false;
            }
          },
          listener: (context, state) {
            if (state is PhoneVerificationError) {
              LoadingPopUp.hide();
              MessageBar.show(
                context,
                state.failure.message,
                MessageBarType.error,
              );
            }
            if (state is PhoneVerificationSend) {
              LoadingPopUp.hide();
              context.push(RoutesManager.otpScreen);
            }
            if (state is PhoneVerificationSendingLoading) {
              LoadingPopUp.show(context: context, type: PopupType.loadingDots);
            } else {
              LoadingPopUp.hide();
            }
          },
          builder: (context, state) {
            return VerifyWidget(
              verified: state is PhoneVerified,
              title: StringsManager.phoneNumber,
              loading: loading,
              onVerify: () {
                if (formKey.currentState!.validate()) {
                  // formKey.currentState!.save();
                  cubit.sendOTP(cubit.userDetails.phoneNumber);
                }
              },
            );
          },
        ),
      ],
    );
  }
}
