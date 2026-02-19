import 'package:sell/presentation/widgets/controller/sell_steps_controller.dart';
import 'package:sell/presentation/widgets/sell_steps/step_2/widgets/Interior_type_widget.dart';
import 'package:sell/presentation/widgets/sell_steps/step_2/widgets/aircon_widget.dart';
import 'package:sell/presentation/widgets/sell_steps/step_2/widgets/seat_number.dart';
import 'package:sell/presentation/widgets/sell_steps/step_2/widgets/top_speed_text_field.dart';
import 'package:sell/presentation/widgets/sell_steps/step_2/widgets/body_type_widget.dart';
import 'package:sell/presentation/widgets/sell_steps/step_2/widgets/consumption_text_filed.dart';
import 'package:sell/presentation/widgets/sell_steps/step_2/widgets/engine_spec_widget.dart';
import 'package:sell/presentation/widgets/sell_steps/step_2/widgets/fuel_type_widget.dart';
import 'package:sell/presentation/widgets/sell_steps/step_2/widgets/paint_condition_widget.dart';
import 'package:sell/presentation/widgets/sell_steps/step_2/widgets/power_text_field.dart';
import 'package:sell/presentation/widgets/sell_steps/step_2/widgets/transmission_type.dart';
import 'package:sell/presentation/widgets/sell_steps/step_2/widgets/modifcations_text_feild.dart';
import 'package:sell/presentation/widgets/sell_steps/step_2/widgets/paint_color_widget.dart';
import 'package:sell/presentation/widgets/sell_steps/step_2/widgets/features_widgt.dart';
import 'package:sell/presentation/widgets/sell_steps/step_2/widgets/service_history_text_feild.dart';
import 'package:constants/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Step2 extends StatefulWidget {
  const Step2({super.key});

  @override
  State<Step2> createState() => _Step2State();
}

class _Step2State extends State<Step2> {
  late SellStepsController controller;
  @override
  void initState() {
    controller = Get.put(SellStepsController());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // var cubit = AddCubit.get(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppPadding.p12),
      child: Column(
        key: ValueKey('step_2'),
        spacing: AppSize.s10,
        children: [
          BodyTypeWidget(),
          TransmissionTypeWidget(),
          FuelTypeWidget(),
          EngineSpecWidget(),
          PowerTextField(),
          TopSpeedTextField(),
          FuelConsumptionTextField(),
          PaintColorWidget(),
          PaintConditionWidget(),
          InteriorTypeWidget(),
          SeatNumber(),
          AirConWidget(),
          ServiceHistoryTextFeild(),
          ModifcationsTextFeild(),
          FeaturesWidget(),
        ],
      ),
    );
  }
}
