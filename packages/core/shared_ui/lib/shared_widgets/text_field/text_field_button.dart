// import 'package:add/presentation/cubit/add_cubit.dart';
// import 'package:constants/strings_manager.dart';
// import 'package:constants/values_manager.dart';
// import 'package:data/models/car/sell_car_model.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:shared_ui/shared_widgets/pop_up/pop_up.dart';
// import 'package:shared_ui/shared_widgets/selection_page/selection_page.dart';
// import 'package:shared_ui/shared_widgets/text_field/text_field_button_decoration.dart';
// import 'package:shared_ui/shared_widgets/text_field/validate/text_field_validate.dart';

// enum TextFieldButtonType {
//   features,
//   none,
// }

// class TextFieldButton extends StatefulWidget {
//   final TextFieldValidationType validationType;
//   // final String hint;
//   final String title;
//   final String inPageTitle;
//   final TextFieldButtonType type;
//   final List<String> givenList;
//   final bool enable;
//   final double width;
//   final AddCubit cubit;
//   final String? hintText;
//   const TextFieldButton({
//     super.key,
//     // required this.hint,
//     required this.inPageTitle,
//     required this.givenList,
//     required this.title,
//     required this.type,
//     required this.cubit,
//     this.validationType = TextFieldValidationType.none,
//     this.enable = true,
//     this.width = double.maxFinite,
//     this.hintText,
//   });

//   @override
//   State<TextFieldButton> createState() => _TextFieldButtonState();
// }

// class _TextFieldButtonState extends State<TextFieldButton> {
//   late TextEditingController controller;
//   late SellCarModel car;
//   @override
//   void initState() {
//     controller = TextEditingController();
//     car = widget.cubit.car;
//     switch (widget.type) {
    
//       // case TextFieldButtonType.fuelType:
//       //   controller.text = car.fuelType.name;

    
//       case TextFieldButtonType.none:
//         controller.text = '';
//         break;
    
    
//     }
//     super.initState();
//   }

//   @override
//   void dispose() {
//     controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Padding(
//           padding: const EdgeInsets.symmetric(vertical: AppPadding.p10),
//           child: Text(
//             widget.title,
//             textAlign: TextAlign.start,
//             style: Theme.of(context).textTheme.bodyMedium,
//           ),
//         ),
//         SizedBox(
//           width: widget.width,

//           child: TextFormField(
//             readOnly: true,
//             enabled: widget.enable,
//             controller: controller,
//             decoration:
//                 TextFieldButtonDecoration.textfieldButtonInputDecoration(
//                   context,
//                   // color: widget.type == TextFieldButtonType.paintColor,
//                 ),

//             onTap: () async {
//               String selected =
//                   (await rightPopUpScreen<String>(
//                     context: context,
//                     child: BlocProvider.value(
//                       value: widget.cubit,
//                       child: SelectionPage(
//                         hintText: widget.hintText,
//                         givenList: widget.givenList,
//                         title: widget.inPageTitle,
//                         emptyPage: '',
//                       ),
//                     ),
//                   )) ??
//                   "";
//               if (selected.isNotEmpty) {
//                 switch (widget.type) {
                

//                   // case TextFieldButtonType.fuelType:
//                   //   car.fuelType = selected;
//                   //   controller.text = car.fuelType.name;
//                   //   break;

//                   case TextFieldButtonType.features:
//                     // car.safetyOptions = selected;
//                     controller.text =
//                         "${car.safetyOptions.length} ${StringsManager.featuresLabel}";
//                     break;
//                   case TextFieldButtonType.none:
//                     controller.text = '';
//                     break;
                
//                 }
//               }
//             },

//             style: Theme.of(context).textTheme.bodyMedium,
//             validator: (value) => TextFieldValidator.validateNormal(
//               widget.validationType,
//               value!,
//             ),
//             autovalidateMode: AutovalidateMode.onUserInteraction,

//             // onSaved: (newValue) {
//             //   print(newValue);
//             // },
//             // onFieldSubmitted: (value) {
//             //   print(value);
//             // },
//             onChanged: (value) {
//               switch (widget.type) {
              

//                 // case TextFieldButtonType.fuelType:
//                 //   controller.text = car.fuelType;
//                 //   break;

//                 case TextFieldButtonType.features:
//                   controller.text = car.safetyOptions.length.toString();
//                   break;
//                 case TextFieldButtonType.none:
//                   controller.text = '';
//                   break;
              
                
//               }
//             },

//             // textInputAction: TextInputAction.done,
//             // keyboardType: widget.keybordType,
//             autofocus: false,

//             onTapOutside: (event) {
//               FocusScope.of(context).unfocus();
//             },
//           ),
//         ),
//       ],
//     );
//   }
// }
