import 'package:cars_market/di/di.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:shared_ui/shared_widgets/text_field/p_text_field.dart';
import 'package:user_details/presentation/cubit/user_details_cubit.dart';

class UserPhoneNumberTextField extends StatefulWidget {
  final bool loading;
  const UserPhoneNumberTextField({super.key, required this.loading});

  static FocusNode phoneFocusNode = FocusNode();
  @override
  State<UserPhoneNumberTextField> createState() =>
      _UserPhoneNumberTextFieldState();
}

class _UserPhoneNumberTextFieldState extends State<UserPhoneNumberTextField> {
  late TextEditingController controller;
  String initialCountry = 'EG';
  PhoneNumber number = PhoneNumber(isoCode: 'EG');
  @override
  void initState() {
    controller = TextEditingController(
      text: getIt<UserDetailsCubit>().userDetails.phoneNumber,
    );
    UserPhoneNumberTextField.phoneFocusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    UserPhoneNumberTextField.phoneFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var cubit = UserDetailsCubit.get(context);
    return BlocConsumer<UserDetailsCubit, UserDetailsState>(
      buildWhen: (previous, current) {
        if (current is PhoneVerified) {
          return true;
        } else {
          return false;
        }
      },
      listener: (context, state) {
        if (state is PhoneVerified) {
          // controller.text = cubit.userDetails.phoneNumber;
          number = PhoneNumber(
            isoCode: 'EG',
            phoneNumber: cubit.userDetails.phoneNumber,
          );
          controller.text = number.phoneNumber ?? '';
        }
      },
      builder: (context, state) {
        return PhoneNumberTextField(
          phoneFocusNode: UserPhoneNumberTextField.phoneFocusNode,
          controller: controller,
          loading: widget.loading,
          isEnabled: state is! PhoneVerified,
          number: number,
          onInputChanged: (phone) {
            cubit.setUserPhoneNumber(phone.phoneNumber ?? '');
            // print(cubit.userDetails.phoneNumber);
            // print(phone);
          },
        );
      },
    );
  }
}
