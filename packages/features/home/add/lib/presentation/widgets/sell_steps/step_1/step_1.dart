import 'package:add/presentation/widgets/sell_steps/step_1/widgets/car_details.dart';
import 'package:add/presentation/widgets/sell_steps/step_1/widgets/image_picker.dart';
import 'package:flutter/material.dart';

class Step1 extends StatelessWidget {
  const Step1({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      ImagePicker(), 
      CarDetails()
      ]);
  }
}
