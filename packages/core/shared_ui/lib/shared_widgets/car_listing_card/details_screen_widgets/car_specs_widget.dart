import 'package:constants/strings_manager.dart';
import 'package:constants/values_manager.dart';
import 'package:domain/entity/car_entity.dart';
import 'package:flutter/material.dart';

class CarSpecsWidget extends StatelessWidget {
  final CarEntity car;
  const CarSpecsWidget({super.key, required this.car});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppPadding.p10),
      child: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              StringsManager.spec,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ),
          Container(
            child: Row(
              children: [
                Icon(Icons.settings),
                Column(children: [Text('Engine'), Text('3.0L')]),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
