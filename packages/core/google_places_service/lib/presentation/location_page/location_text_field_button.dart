import 'package:constants/strings_manager.dart';
import 'package:constants/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:google_places_service/domain/entity/predictions_entity.dart';
import 'package:shared_ui/shared_widgets/pop_up/pop_up.dart';
import 'package:google_places_service/presentation/location_page/location_page.dart';
import 'package:shared_ui/shared_widgets/text_field/text_field_button_decoration.dart';
import 'package:shared_ui/shared_widgets/text_field/validate/text_field_validate.dart';

class LocationTextFieldButton extends StatefulWidget {
  final PredictionsEntity assignedValueTo;
  final bool filter;
  const LocationTextFieldButton({
    super.key,
    required this.assignedValueTo,
    this.filter = false,
  });

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
    if (widget.assignedValueTo.description.isNotEmpty) {
      controller.text = widget.assignedValueTo.description.replaceAll(
        ", Egypt",
        "",
      );
    }
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FormField<String>(
      initialValue: controller.text,
      validator: (value) => TextFieldValidator.validateNormal(
        TextFieldValidationType.location,
        value!,
      ),
      builder: (field) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: AppPadding.p10),
            child: Text(
              widget.filter
                  ? StringsManager.dLocation
                  : StringsManager.location,
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
              decoration:
                  TextFieldButtonDecoration.textfieldButtonInputDecoration(
                    context,
                    error: field.hasError,
                  ),
              onTap: () async {
                PredictionsEntity? selected =
                    (await rightPopUpScreen<PredictionsEntity>(
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
                field.didChange(controller.text);
                field.validate();

                // print('adsdasd');
              },

              style: Theme.of(context).textTheme.bodyMedium,

              // validator: (value) => TextFieldValidator.validateNormal(
              //   TextFieldValidationType.location,
              //   value!,
              // ),
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
          if (field.errorText != null)
            Padding(
              padding: const EdgeInsets.only(top: AppPadding.p8),
              child: Text(
                field.errorText!,
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color: Theme.of(context).colorScheme.error,
                ),
              ),
            ),
        ],
      ),
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
    hintText: StringsManager.choose,
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
