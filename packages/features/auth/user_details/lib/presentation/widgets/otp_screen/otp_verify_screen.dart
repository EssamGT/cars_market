import 'dart:async';

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
import 'package:user_details/presentation/widgets/otp_screen/widgets/otp_text_widget.dart';

class OtpVerifyScreen extends StatefulWidget {
  const OtpVerifyScreen({super.key});

  @override
  State<OtpVerifyScreen> createState() => _OtpVerifyScreenState();
}

class _OtpVerifyScreenState extends State<OtpVerifyScreen> {
  late TextEditingController otpController;
  GlobalKey<FormState> otpKey = GlobalKey<FormState>();

  Timer? _resendTimer;
  final StreamController<int> _resendController =
      StreamController<int>.broadcast();

  @override
  void initState() {
    otpController = TextEditingController();
    startResendCountdown();
    super.initState();
  }

  @override
  void dispose() {
    otpController.dispose();
    _resendTimer?.cancel();
    _resendController.close();
    super.dispose();
  }

  void startResendCountdown([int seconds = 60]) {
    _resendTimer?.cancel();
    int remaining = seconds;
    _resendController.add(remaining);
    _resendTimer = Timer.periodic(Duration(seconds: 1), (timer) {
      remaining--;
      if (remaining <= 0) {
        _resendController.add(0);
        timer.cancel();
      } else {
        _resendController.add(remaining);
      }
    });
  }

  void stopResendCountdown() {
    _resendTimer?.cancel();
    _resendController.add(0);
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
                  key: otpKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      OtpTextWidget(phoneNumber: cubit.userDetails.phoneNumber),

                      Padding(
                        padding: const EdgeInsets.symmetric(
                          // vertical: AppPadding.p12,
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
                            if (otpKey.currentState!.validate()) {
                              cubit.verifyOTP(value);
                            }
                          },
                          onCompleted: (value) {
                            if (otpKey.currentState!.validate()) {
                              cubit.verifyOTP(value);
                            }
                          },
                          onTapOutside: (event) {
                            FocusScope.of(context).unfocus();
                          },
                          hapticFeedbackType: HapticFeedbackType.mediumImpact,
                          useNativeKeyboard: true,
                          keyboardType: TextInputType.number,
                          errorTextStyle: Theme.of(context).textTheme.bodyMedium
                              ?.copyWith(
                                color: Theme.of(context).colorScheme.error,
                              ),
                          errorBuilder: (errorText, pin) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: AppPadding.p12,
                              ),
                              child: Text(
                                errorText!,
                                style: Theme.of(context).textTheme.bodyMedium
                                    ?.copyWith(
                                      color: Theme.of(
                                        context,
                                      ).colorScheme.error,
                                    ),
                              ),
                            );
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: AppPadding.p8,
                        ),
                        child: StreamBuilder<int>(
                          stream: _resendController.stream,
                          initialData: 0,
                          builder: (context, asyncSnapshot) {
                            final remaining = asyncSnapshot.data ?? 0;
                            return TextButton(
                              onPressed: remaining == 0
                                  ? () {
                                      cubit.resendOTP();
                                      startResendCountdown();
                                    }
                                  : null,
                              style: ButtonStyle(
                                overlayColor: WidgetStateProperty.all(
                                  Theme.of(context).colorScheme.surface,
                                ),
                              ),

                              child: Text(
                                remaining == 0
                                    ? StringsManager.resendCode
                                    : "${StringsManager.resendCode} ( $remaining )",
                              ),
                            );
                          },
                        ),
                      ),
                      // Text(state.toString()),
                      Spacer(),
                      CTextButton(
                        onTap: () {
                          FocusScope.of(context).unfocus();
                          if (otpKey.currentState!.validate()) {
                            cubit.verifyOTP(otpController.text);
                          }
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
