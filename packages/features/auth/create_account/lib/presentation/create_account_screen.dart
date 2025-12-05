import 'package:cars_market/di/di.dart';
import 'package:constants/strings_manager.dart';
import 'package:constants/values_manager.dart';
import 'package:create_account/presentation/cubit/create_account_cubit.dart';
import 'package:create_account/presentation/widgets/create_account_text.dart';
import 'package:data/models/auth/auth_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:router/routes_manager.dart';
import 'package:shared_ui/shared_widgets/buttons/colored_text_button.dart';
import 'package:shared_ui/shared_widgets/buttons/text_button.dart';
import 'package:shared_ui/shared_widgets/buttons/two_text_button.dart';
import 'package:shared_ui/shared_widgets/massege_bar/error_message_bar.dart';
import 'package:shared_ui/shared_widgets/text_field/c_text_field.dart';
import 'package:shared_ui/shared_widgets/text_field/validate/text_filed_validate.dart';
import 'package:shared_ui/shared_widgets/text_field/validate/two_password_text_filed.dart';

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({super.key});

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController cpasswordController;
  late GlobalKey<FormState> formKey;
  late FocusNode email;
  late FocusNode passwordFocus;
  late FocusNode cpasswordFoucs;

  @override
  void initState() {
    getIt.resetLazySingleton<CreateAccountCubit>();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    cpasswordController = TextEditingController();
    formKey = GlobalKey<FormState>();
    email = FocusNode();
    passwordFocus = FocusNode();
    cpasswordFoucs = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    cpasswordController.dispose();
    email.dispose();
    passwordFocus.dispose();
    cpasswordFoucs.dispose();
    getIt<CreateAccountCubit>().close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: BlocProvider.value(
        value: getIt.get<CreateAccountCubit>(),
        child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: screenSize.height),
            child: IntrinsicHeight(
              child: BlocListener<CreateAccountCubit, CreateAccountState>(
                listenWhen: (previous, current) {
                  if (current is Error || current is Success) {
                    return true;
                  } else {
                    return false;
                  }
                },
                listener: (context, state) {
                  if (state is Error) {
                    MessageBar.show(context, state.failure.message);
                  }
                  if (state is Success) {
                    // context.pop();
                    context.go(RoutesManager.userDetails);
                    // MessageBar.show(
                    //   context,
                    //   StringsManager.inbox,
                    //   MessageBarType.success,
                    // );
                  }
                },
                child: BlocBuilder<CreateAccountCubit, CreateAccountState>(
                  builder: (context, state) {
                    var cubit = CreateAccountCubit.get(context);
                    return Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: screenSize.height / 6),
                          child: Form(
                            key: formKey,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CreateAccountText(),
                                CTextField(
                                  myNode: email,
                                  label: StringsManager.email,
                                  controller: emailController,
                                  hint: StringsManager.enterEmail,
                                  next: passwordFocus,
                                  validationType: TextFieldValidationType.email,
                                  enabled: state is! Loading,
                                ),
                                TwoPasswordTextFiled(
                                  controller1: passwordController,
                                  controller2: cpasswordController,
                                  hint1: StringsManager.enterPassword,
                                  hint2: StringsManager.cYourpassword,
                                  label1: StringsManager.password,
                                  label2: StringsManager.cpassword,
                                  myNode1: passwordFocus,
                                  myNode2: cpasswordFoucs,
                                  validationType:
                                      TextFieldValidationType.confirmPassword,
                                  supmit: () {
                                    if (formKey.currentState!.validate()) {
                                      cubit.login(
                                        AuthModel(
                                          email: emailController.text,
                                          password: passwordController.text,
                                        ),
                                      );
                                    }
                                  },
                                ),
                                SizedBox(height: AppSize.s10),
                                CTextButton(
                                  onTap: () async {
                                    if (formKey.currentState!.validate()) {
                                      FocusScope.of(context).unfocus();
                                      cubit.login(
                                        AuthModel(
                                          email: emailController.text,
                                          password: passwordController.text,
                                        ),
                                      );
                                    }
                                  },
                                  loading: state is Loading,
                                  text: StringsManager.cAccount,
                                  hight: AppSize.s55,
                                  width: AppSize.s30,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Spacer(),

                        TwoTextButton(
                          onTap: () {
                            context.pop();
                          },
                          loading: state is Loading,
                          t1: StringsManager.haveAccount,
                          t2: StringsManager.login,
                        ),
                        ColoredTextButton(
                          loading: state is Loading,
                          text: StringsManager.guestMode,
                          align: MainAxisAlignment.center,
                          padding: EdgeInsets.only(bottom: AppPadding.p16),
                          style: Theme.of(context).textTheme.bodySmall!,
                          onTap: () {},
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
