import 'package:constants/strings_manager.dart';
import 'package:constants/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:google_places_service/domain/entity/predictions_entity.dart';
import 'package:shared_ui/shared_widgets/pop_up/pop_up.dart';
import 'package:google_places_service/presentation/location_page.dart';
import 'package:shared_ui/shared_widgets/text_field/validate/text_filed_validate.dart';

class LocationTextFieldButton extends StatefulWidget {
  final PredictionsEntity assignedValueTo;
  const LocationTextFieldButton({super.key, required this.assignedValueTo});

  @override
  State<LocationTextFieldButton> createState() =>
      _LocationTextFieldButtonState();
}

class _LocationTextFieldButtonState extends State<LocationTextFieldButton> {
  late TextEditingController controller;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: AppPadding.p10),
          child: Text(
            StringsManager.location,
            textAlign: TextAlign.start,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
        SizedBox(
          width: double.maxFinite,
          child: TextFormField(
            readOnly: true,
            enabled: true,
            controller: controller,
            decoration: textFieldButtonDecoration(context),
            onTap: () async {
              PredictionsEntity? selected =
                  (await popUpScreen<PredictionsEntity>(
                    context: context,
                    child: LocationPage(),
                  ));

              if (selected != null) {
                // setState(() {
                // widget.assignedValueTo.description = selected.description;
                // widget.assignedValueTo.placeId = selected.placeId;
                // widget.assignedValueTo.structuredFormatting =
                //     selected.structuredFormatting;
                setLocation(selected);
                // print(widget.assignedValueTo.structuredFormatting.mainText);

                controller.text = selected.description.replaceAll(
                  ", Egypt",
                  "",
                );
                // });
              }
              // print('adsdasd');
            },

            style: Theme.of(context).textTheme.bodyMedium,
            validator: (value) => TextFieldValidator.validateNormal(
              TextFieldValidationType.location,
              value!,
            ),
            autovalidateMode: AutovalidateMode.onUserInteraction,

            // onSaved: (newValue) {
            //   print(newValue);
            // },
            // onFieldSubmitted: (value) {
            //   print(value);
            // },
            onChanged: (value) {},

            // textInputAction: TextInputAction.done,
            // keyboardType: widget.keybordType,
            autofocus: false,

            onTapOutside: (event) {
              FocusScope.of(context).unfocus();
            },
          ),
        ),
      ],
    );
  }

  setLocation(PredictionsEntity locEntity) {
    widget.assignedValueTo.description = locEntity.description;
    widget.assignedValueTo.placeId = locEntity.placeId;
    widget.assignedValueTo.structuredFormatting =
        locEntity.structuredFormatting;
    widget.assignedValueTo.reference = locEntity.reference;
    widget.assignedValueTo.types = locEntity.types;
  }
}

InputDecoration textFieldButtonDecoration(BuildContext context) {
  return InputDecoration(
    hintText: StringsManager.chose,
    hintStyle: Theme.of(context).textTheme.labelLarge,
    border: OutlineInputBorder(
      borderSide: BorderSide(
        color: Theme.of(context).colorScheme.outline,
        width: 1,
      ),
      borderRadius: BorderRadius.circular(AppSize.s8),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: Theme.of(context).colorScheme.outline,
        width: 1,
      ),
      borderRadius: BorderRadius.circular(AppSize.s8),
    ),
    fillColor: Theme.of(context).colorScheme.surfaceContainerHighest,
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: Theme.of(context).colorScheme.outline,
        width: 1,
      ),
      borderRadius: BorderRadius.circular(AppSize.s8),
    ),
    suffixIcon: Icon(
      Icons.arrow_forward_ios_sharp,
      color: Theme.of(context).colorScheme.outline,
      size: AppSize.s20,
    ),
  );
}
