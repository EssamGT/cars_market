import 'package:cars_market/di/di.dart';
import 'package:constants/strings_manager.dart';
import 'package:constants/values_manager.dart';
import 'package:data/models/auth_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:login/presentation/cubit/login_cubit.dart';
import 'package:login/presentation/widgets/login_page_text.dart';
import 'package:router/routes_manager.dart';
import 'package:shared_ui/shared_widgets/buttons/colored_text_button.dart';
import 'package:shared_ui/shared_widgets/buttons/text_button.dart';
import 'package:shared_ui/shared_widgets/buttons/two_text_button.dart';
import 'package:shared_ui/shared_widgets/massege_bar/error_message_bar.dart';
import 'package:shared_ui/shared_widgets/text_field/c_text_field.dart';
import 'package:shared_ui/shared_widgets/text_field/validate/text_filed_validate.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late FocusNode emailNode;
  late FocusNode passwordNode;
  late GlobalKey<FormState> formKey;
  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    emailNode = FocusNode();
    passwordNode = FocusNode();
    formKey = GlobalKey<FormState>();
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    emailNode.dispose();
    passwordNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => getIt.get<LoginCubit>(),
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: screenSize.height),
            child: IntrinsicHeight(
              child: BlocConsumer<LoginCubit, LoginState>(
                listener: (context, state) {
                  if (state is Error) {
                    MessageBar.show(context, state.failure.message);
                  }
                  if (state is Success) {
                    MessageBar.show(context, 'ss', MessageBarType.sucsses);
                  }
                },
                builder: (context, state) {
                  var cubit = LoginCubit.get(context);
                  return Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: screenSize.height / 3),
                        child: Form(
                          key: formKey,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              LoginPageText(),
                              CTextField(
                                loading: state is Loading,
                                myNode: emailNode,
                                next: passwordNode,
                                validationType: TextFieldValidationType.email,
                                controller: emailController,
                                hint: StringsManager.email,
                              ),
                              CTextField(
                                loading: state is Loading,

                                myNode: passwordNode,
                                validationType:
                                    TextFieldValidationType.loginPassword,
                                controller: passwordController,
                                hint: StringsManager.password,
                                supmit: () {
                                  if (formKey.currentState!.validate()) {
                                    cubit.login(
                                      AuthModel(
                                        email: emailController.text.trim(),
                                        password: passwordController.text
                                            .trim(),
                                      ),
                                    );
                                  }
                                },
                              ),
                              ColoredTextButton(
                                loading: state is Loading,

                                text: StringsManager.forgotPassword,
                                align: MainAxisAlignment.end,
                                padding: EdgeInsets.symmetric(
                                  horizontal: AppPadding.p16,
                                ),
                                onTap: () {
                                  context.push(RoutesManager.forgotPasword);
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                      Spacer(),
                      CTextButton(
                        onTap: () async {
                          if (formKey.currentState!.validate()) {
                            FocusScope.of(context).unfocus();
                            cubit.login(
                              AuthModel(
                                email: emailController.text.trim(),
                                password: passwordController.text.trim(),
                              ),
                            );
                          }
                        },
                        loading: state is Loading,
                        text: StringsManager.login,
                        hight: AppSize.s55,
                        width: AppSize.s30,
                      ),
                      TwoTextButton(
                        onTap: () {
                          context.push(RoutesManager.createAccount);
                        },
                        loading: state is Loading,

                        t1: StringsManager.dontHaveAccount,
                        t2: StringsManager.createOne,
                      ),
                      ColoredTextButton(
                        text: StringsManager.guestMode,
                        align: MainAxisAlignment.center,
                        padding: EdgeInsets.only(bottom: AppPadding.p16),
                        style: Theme.of(context).textTheme.bodySmall!,
                        loading: state is Loading,

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
    );
  }
}
