import 'package:cars_market/di/di.dart';
import 'package:constants/strings_manager.dart';
import 'package:constants/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pinput/pinput.dart';
import 'package:shared_ui/shared_widgets/buttons/text_button.dart';
import 'package:shared_ui/shared_widgets/massege_bar/error_message_bar.dart';
import 'package:shared_ui/shared_widgets/pop_up/loading_pop_up.dart';
import 'package:user_details/presentation/cubit/user_details_cubit.dart';
import 'package:user_details/presentation/user_details_screen.dart';
import 'package:user_details/presentation/widgets/otp_screen/widgets/otp_text_widget.dart';

class OtpVerifyScreen extends StatefulWidget {
  const OtpVerifyScreen({super.key});

  @override
  State<OtpVerifyScreen> createState() => _OtpVerifyScreenState();
}

class _OtpVerifyScreenState extends State<OtpVerifyScreen> {
  late TextEditingController otpController;
  @override
  void initState() {
    otpController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    otpController.dispose();
    super.dispose();
  }

  final int otpLength = 6;
  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: getIt<UserDetailsCubit>(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            StringsManager.phoneVerification,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          centerTitle: true,
          forceMaterialTransparency: true,
        ),
        body: BlocProvider.value(
          value: getIt<UserDetailsCubit>(),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: AppPadding.p20,
              horizontal: AppPadding.p8,
            ),
            child: BlocConsumer<UserDetailsCubit, UserDetailsState>(
              listener: (context, state) {
                if (state is PhoneVerified) {
                  LoadingPopUp.hide();

                  context.pop();
                }
                if (state is PhoneVerificationError) {
                  MessageBar.show(
                    context,
                    state.failure.message,
                    MessageBarType.error,
                  );
                  LoadingPopUp.hide();
                }
                if (state is PhoneVerificationSubmittingInProgress) {
                  LoadingPopUp.show(
                    context: context,
                    type: PopupType.loadingDots,
                  );
                }
              },
              buildWhen: (previous, current) {
                if (current is PhoneVerified ||
                    current is PhoneVerificationError ||
                    current is PhoneVerificationSubmittingInProgress) {
                  return true;
                } else {
                  return false;
                }
              },
              builder: (context, state) {
                var cubit = getIt<UserDetailsCubit>();

                return Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      OtpTextWidget(phoneNumber: cubit.userDetails.phoneNumber),

                      Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: AppPadding.p40,
                          horizontal: AppPadding.p8,
                        ),
                        child: Pinput(
                          length: otpLength,
                          controller: otpController,
                          closeKeyboardWhenCompleted: true,
                          enableSuggestions: true,
                          autofocus: false,
                          validator: (value) {
                            if (value == null ||
                                value.isEmpty ||
                                value.length < otpLength) {
                              return StringsManager.otpValidation;
                            }
                            return null;
                          },
                          defaultPinTheme: getPinTheme(context),
                          onSubmitted: (value) {
                            cubit.verifyOTP(value);
                          },
                          onCompleted: (value) {
                            cubit.verifyOTP(value);
                          },
                          onTapOutside: (event) {
                            FocusScope.of(context).unfocus();
                          },
                          hapticFeedbackType: HapticFeedbackType.mediumImpact,
                          useNativeKeyboard: true,
                          keyboardType: TextInputType.number,
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(StringsManager.resendCode),
                      ),
                      Spacer(),
                      CTextButton(
                        onTap: () {
                          FocusScope.of(context).unfocus();
                          if (formKey.currentState!.validate()) {
                            cubit.verifyOTP(otpController.text);
                          }

                          // print(state);
                        },
                        // enable: false,
                        text: StringsManager.verifyNow,
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

PinTheme getPinTheme(BuildContext context) {
  return PinTheme(
    width: AppSize.s60,
    height: AppSize.s60,
    textStyle: Theme.of(context).textTheme.headlineMedium!.copyWith(
      color: Theme.of(context).colorScheme.primary,
    ),
    decoration: BoxDecoration(
      color: Theme.of(context).colorScheme.surfaceContainerHighest,
      borderRadius: BorderRadius.circular(AppSize.s8),
    ),
  );
}
