import 'package:cars_market/di/di.dart';
import 'package:constants/strings_manager.dart';
import 'package:constants/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:go_router/go_router.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:remote/remote/auth/auth_manager.dart';
import 'package:router/routes_manager.dart';
import 'package:shared_ui/shared_widgets/alert_bar/error_message_bar.dart';
import 'package:shared_ui/shared_widgets/text_field/validate/two_password_text_filed.dart';
import 'package:update_user_data/data/models/card_model.dart';
import 'package:shared_ui/shared_widgets/app_bar/base_app_bar.dart';
import 'package:shared_ui/shared_widgets/buttons/text_button.dart';
import 'package:shared_ui/shared_widgets/text_field/c_text_field.dart';
import 'package:shared_ui/shared_widgets/text_field/p_text_field.dart';
import 'package:shared_ui/shared_widgets/text_field/validate/text_field_validate.dart';
import 'package:update_user_data/presentation/cubit/update_user_data_cubit.dart';

class EditUserProfile extends StatefulWidget {
  final PersonalInfoEditType editType;
  const EditUserProfile({super.key, required this.editType});

  @override
  State<EditUserProfile> createState() => _EditUserProfileState();
}

class _EditUserProfileState extends State<EditUserProfile> {
  late TextEditingController controller;
  late TextEditingController controller2;
  late FocusNode myNode;
  late FocusNode myNode2;
  late PersonalInfoEditType editType;
  late String appBarTitle;
  late String title;
  late String textFieldTitle;
  late String hintText;
  late TextFieldValidationType validationType;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  void initState() {
    controller = TextEditingController();
    editType = widget.editType;
    if (editType == PersonalInfoEditType.password) {
      controller2 = TextEditingController();
      myNode = FocusNode();
      myNode2 = FocusNode();
    }
    setEditTypeData();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    if (editType == PersonalInfoEditType.password) {
      controller2.dispose();
      myNode.dispose();
      myNode2.dispose();
    }
    super.dispose();
  }

  void setEditTypeData() {
    switch (editType) {
      case PersonalInfoEditType.name:
        appBarTitle = StringsManager.updateName;
        title = StringsManager.updateNameTitle;
        textFieldTitle = StringsManager.newName;
        hintText = StringsManager.fullNameEx;
        validationType = TextFieldValidationType.newName;
        break;
      case PersonalInfoEditType.email:
        appBarTitle = StringsManager.updateEmail;
        title = StringsManager.updateEmailTitle;
        textFieldTitle = StringsManager.newEmail;
        hintText = StringsManager.email;
        validationType = TextFieldValidationType.newEmail;
        break;

      case PersonalInfoEditType.phone:
        appBarTitle = StringsManager.updatePhoneNumber;
        title = StringsManager.updatePhoneNumberTitle;
        textFieldTitle = StringsManager.newPhoneNumber;
        hintText = StringsManager.phoneNumber;
        validationType = TextFieldValidationType.newPhone;
        break;
      case PersonalInfoEditType.none:
        break;
      case PersonalInfoEditType.password:
        appBarTitle = StringsManager.updatePassword;
        title = StringsManager.updatePasswordTitle;
        textFieldTitle = StringsManager.newPassword;
        hintText = StringsManager.password;
        validationType = TextFieldValidationType.newPassword;
        break;
    }
  }

  String initialCountry = 'EG';
  PhoneNumber number = PhoneNumber(isoCode: 'EG');
  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: getIt.get<UpdateUserDataCubit>(),
      child: BlocConsumer<UpdateUserDataCubit, UpdateUserDataState>(
        listener: (context, state) {
          if (state is UpdateUserDataFailure) {
            MessageBar.show(
              context,
              state.failure.message,
              MessageBarType.error,
            );
          }
          if (state is UpdateUserDataSuccess) {
            context.pop();

            MessageBar.show(
              context,
              StringsManager.updateSuccess(editType.name.capitalizeFirst!),
              MessageBarType.success,
            );
          }
          if (state is PhoneVerified) {
            context.pop();
          }
          if (state is PhoneVerificationSubmittingInProgress) {
            context.push(RoutesManager.otpScreenForPhoneUpdate);
          }
          if (state is UpdateUserDataPending) {
            MessageBar.show(
              context,
              StringsManager.checkYourMailBox,
              MessageBarType.success,
            );
            Future.delayed(Duration(seconds: 5), () {
              getIt.get<AuthManager>().logout();
              context.go(RoutesManager.login);
            });
          }
        },
        builder: (context, state) {
          var cubit = UpdateUserDataCubit.get(context);
          final blockPop =
              state is UpdateUserDataLoading || state is UpdateUserDataPending;

          return PopScope(
            canPop: !blockPop,

            child: Scaffold(
              appBar: BaseAppBar(title: appBarTitle, blockPop: blockPop),
              body: Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(AppPadding.p40),
                      child: Text(
                        title,
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                    ),
                    if (editType == PersonalInfoEditType.name ||
                        editType == PersonalInfoEditType.email)
                      CTextField(
                        controller: controller,
                        label: textFieldTitle,
                        hint: hintText,
                        validationType: validationType,
                        enabled: state is! UpdateUserDataLoading,
                        submit: () {
                          if (formKey.currentState!.validate()) {
                            switch (editType) {
                              case PersonalInfoEditType.name:
                                cubit.userNameUpdate(controller.text);
                                break;
                              case PersonalInfoEditType.email:
                                cubit.userEmailUpdate(controller.text);
                                break;
                              case PersonalInfoEditType.phone:
                                break;
                              case PersonalInfoEditType.password:
                                break;
                              case PersonalInfoEditType.none:
                                break;
                            }
                          }
                        },
                      ),
                    if (editType == PersonalInfoEditType.phone)
                      PhoneNumberTextField(
                        controller: controller,
                        loading: false,
                        isEnabled: state is! UpdateUserDataLoading,
                        number: number,
                        onInputChanged: (phone) {
                          cubit.newPhoneNumber = phone.phoneNumber ?? '';
                        },
                        phoneUpdate: true,
                      ),
                    if (editType == PersonalInfoEditType.password)
                      TwoPasswordTextFiled(
                        controller1: controller,
                        controller2: controller2,
                        label1: textFieldTitle,
                        hint1: hintText,
                        label2: StringsManager.confirmNewPassword,
                        hint2: StringsManager.confirmPassword,
                        validationType: validationType,
                        loading: state is UpdateUserDataLoading,
                        myNode1: myNode,
                        myNode2: myNode2,
                        submit: () {
                          if (formKey.currentState!.validate()) {
                            UpdateUserDataCubit.get(
                              context,
                            ).userPasswordUpdate(controller.text);
                          }
                        },
                      ),
                    Spacer(),
                    CTextButton(
                      enable: state is! UpdateUserDataPending,
                      onTap: () async {
                        if (formKey.currentState!.validate()) {
                          switch (editType) {
                            case PersonalInfoEditType.name:
                              UpdateUserDataCubit.get(
                                context,
                              ).userNameUpdate(controller.text);
                              break;
                            case PersonalInfoEditType.email:
                              UpdateUserDataCubit.get(
                                context,
                              ).userEmailUpdate(controller.text);
                              break;
                            case PersonalInfoEditType.phone:
                              UpdateUserDataCubit.get(
                                context,
                              ).sendUserPhoneUpdate(cubit.newPhoneNumber);
                              break;
                            case PersonalInfoEditType.password:
                              UpdateUserDataCubit.get(
                                context,
                              ).userPasswordUpdate(controller.text);
                              break;
                            case PersonalInfoEditType.none:
                              break;
                          }
                        }
                      },
                      loading: state is UpdateUserDataLoading,
                      text: StringsManager.update,
                      height: AppSize.s55,
                      width: AppSize.s30,
                    ),
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
