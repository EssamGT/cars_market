import 'package:constants/strings_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_ui/shared_widgets/text_field/c_text_field.dart';
import 'package:shared_ui/shared_widgets/text_field/validate/text_field_validate.dart';
import 'package:user_details/presentation/cubit/user_details_cubit.dart';
import 'package:user_details/presentation/widgets/user_phone_number_text_field.dart';

class UserNameTextField extends StatefulWidget {
  final bool loading;
  const UserNameTextField({super.key, required this.loading});

  @override
  State<UserNameTextField> createState() => _UserNameTextFieldState();
}

class _UserNameTextFieldState extends State<UserNameTextField> {
  late TextEditingController nameController;
  late FocusNode nameFocusNode;
  @override
  void initState() {
    var cubit = UserDetailsCubit.get(context);
    nameController = TextEditingController(text: cubit.userDetails.name);
    nameFocusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    nameController.dispose();
    nameFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var cubit = UserDetailsCubit.get(context);
    // nameController.text = cubit.userDetails.name;
    return BlocConsumer<UserDetailsCubit, UserDetailsState>(
      buildWhen: (previous, current) {
        if (current is EmailVerified) {
          return true;
        } else {
          return false;
        }
      },
      listener: (context, state) {
        if (state is EmailVerified) {
          nameController.text = cubit.userDetails.name;
        }
      },
      builder: (context, state) {
        return CTextField(
          controller: nameController,
          hint: StringsManager.fullNameEx,
          label: StringsManager.fullName,
          validationType: TextFieldValidationType.name,
          myNode: nameFocusNode,
          next: UserPhoneNumberTextField.phoneFocusNode,
          enabled: state is! EmailVerified,
          loading: widget.loading,
          onChanged: (name) {
            cubit.setUserName(name);
          },
        );
      },
    );
  }
}
