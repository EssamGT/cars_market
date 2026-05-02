import 'package:cars_market/globle/globle.dart';
import 'package:constants/strings_manager.dart';
import 'package:constants/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:router/routes_manager.dart';
import 'package:update_user_data/data/models/card_model.dart';

class ContactDetails extends StatelessWidget {
  ContactDetails({super.key});

  final List<CardModel> cards = [
    CardModel(
      title: StringsManager.fullName,
      value: userData.name,
      editType: PersonalInfoEditType.name,
    ),
    CardModel(
      title: StringsManager.email,
      value: userData.email,
      isVerified: userData.verifiedEmail,
      editType: PersonalInfoEditType.email,
    ),
    CardModel(
      title: StringsManager.phoneNumber,
      value: userData.phoneNumber,
      isVerified: true,
      editType: PersonalInfoEditType.phone,
    ),
    CardModel(
      title: StringsManager.password,
      value: '********',
      showEditIcon: true,
      editType: PersonalInfoEditType.password,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: AppMargin.m18,
        horizontal: AppMargin.m18,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onSecondary,
        borderRadius: BorderRadius.circular(AppSize.s12),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).colorScheme.shadow.withAlpha(40),
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppPadding.p20,
              vertical: AppPadding.p20,
            ),
            child: Row(
              spacing: AppSize.s20,
              children: [
                Icon(
                  Icons.quick_contacts_mail_outlined,
                  color: Theme.of(context).colorScheme.primary,
                ),
                Text(
                  StringsManager.contactDetails,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ],
            ),
          ),
          Divider(
            color: Theme.of(context).colorScheme.shadow.withAlpha(100),
            thickness: 1,
            height: 1,
            endIndent: 20,
            indent: 20,
          ),
          ...cards.map(
            (card) => DCard(
              title: card.title,
              value: card.value,
              isVerified: card.isVerified,
              showEditIcon: card.showEditIcon,
              onEdit: () {
                switch (card.editType) {
                  case PersonalInfoEditType.name:
                    context.push(
                      RoutesManager.editUserProfile,
                      extra: PersonalInfoEditType.name,
                    );
                    break;
                  case PersonalInfoEditType.email:
                    context.push(
                      RoutesManager.editUserProfile,
                      extra: PersonalInfoEditType.email,
                    );
                    break;
                  case PersonalInfoEditType.phone:
                    context.push(
                      RoutesManager.editUserProfile,
                      extra: PersonalInfoEditType.phone,
                    );
                    break;
                  case PersonalInfoEditType.none:
                    break;
                  case PersonalInfoEditType.password:
                    context.push(
                      RoutesManager.editUserProfile,
                      extra: PersonalInfoEditType.password,
                    );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

class DCard extends StatelessWidget {
  final bool isVerified;
  final bool showEditIcon;
  final String title;
  final String value;
  final VoidCallback onEdit;
  const DCard({
    super.key,
    this.isVerified = false,
    this.showEditIcon = true,
    required this.title,
    required this.value,
    required this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(
        horizontal: AppPadding.p20,
        vertical: AppPadding.p2,
      ),

      title: Text(title, style: Theme.of(context).textTheme.labelLarge),
      subtitle: Row(
        children: [
          Text(value, style: Theme.of(context).textTheme.bodyMedium),
          SizedBox(width: AppSize.s10),
          isVerified
              ? Icon(
                  Icons.verified,
                  color: Theme.of(context).colorScheme.primary,
                )
              : SizedBox(),
        ],
      ),
      trailing: showEditIcon
          ? IconButton(
              onPressed: onEdit,
              icon: Icon(
                Icons.mode_edit_outlined,
                size: AppSize.s20,
                color: Theme.of(context).colorScheme.onError,
              ),
            )
          : SizedBox(),
    );
  }
}
