import 'package:cars_market/di/di.dart';
import 'package:constants/strings_manager.dart';
import 'package:constants/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forgot_password/presentation/cubit/forgot_password_cubit.dart';
import 'package:forgot_password/presentation/widgets/forgot_password_text.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_ui/shared_widgets/buttons/text_button.dart';
import 'package:shared_ui/shared_widgets/alert_bar/error_message_bar.dart';
import 'package:shared_ui/shared_widgets/text_field/c_text_field.dart';
import 'package:shared_ui/shared_widgets/text_field/validate/text_field_validate.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  late TextEditingController emailController;
  late GlobalKey<FormState> formKey;
  @override
  void initState() {
    // getIt.resetLazySingleton<ForgotPasswordCubit>();
    emailController = TextEditingController();
    formKey = GlobalKey<FormState>();
    super.initState();
  }

  @override
  void dispose() {
    // getIt<ForgotPasswordCubit>().close();
    emailController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return BlocProvider.value(
      value: getIt.get<ForgotPasswordCubit>(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(StringsManager.forgotPasswordAppBarTitle),
          centerTitle: true,
          scrolledUnderElevation: 0,
        ),
        body: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: screenSize.height - AppSize.s100,
            ),

            child: IntrinsicHeight(
              child: BlocConsumer<ForgotPasswordCubit, ForgotPasswordState>(
                listener: (context, state) {
                  if (state is Error) {
                    MessageBar.show(context, state.failure.message);
                  }
                  if (state is Success) {
                    context.pop();
                    MessageBar.show(
                      context,
                      StringsManager.inboxF,
                      MessageBarType.success,
                    );
                  }
                },
                builder: (context, state) {
                  var cubit = ForgotPasswordCubit.get(context);
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: AppPadding.p40),
                        child: Form(
                          key: formKey,
                          child: Column(
                            children: [
                              ForgotPasswordText(),
                              CTextField(
                                label: StringsManager.email,
                                controller: emailController,
                                hint: StringsManager.enterEmail,
                                validationType: TextFieldValidationType.email,
                                enabled: state is! Loading,
                                supmit: () {
                                  if (formKey.currentState!.validate()) {
                                    cubit.forgotPassword(emailController.text);
                                  }
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                      Spacer(),
                      CTextButton(
                        onTap: () {
                          if (formKey.currentState!.validate()) {
                            cubit.forgotPassword(emailController.text);
                          }
                        },
                        loading: state is Loading,
                        text: StringsManager.resetPassword,
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
