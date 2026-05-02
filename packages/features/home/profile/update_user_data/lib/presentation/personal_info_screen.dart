import 'package:constants/strings_manager.dart';
import 'package:flutter/material.dart';
import 'package:update_user_data/presentation/widgets/contact_details.dart';
import 'package:update_user_data/presentation/widgets/delete_account_button.dart';
import 'package:update_user_data/presentation/widgets/profile_icon.dart';
import 'package:shared_ui/shared_widgets/app_bar/base_app_bar.dart';

class PersonalInfoScreen extends StatelessWidget {
  const PersonalInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(title: StringsManager.profileAccount),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            ProfileIcon(),
            ContactDetails(),
            DeleteAccountButton(),
          ],
        ),
      ),
    );
  }
}
