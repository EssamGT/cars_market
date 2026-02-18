
import 'package:cars_market/di/di.dart';
import 'package:data/models/car/brands_models/car_catalog.dart';
import 'package:flutter/material.dart';
import 'package:remote/remote/firebase/firebase_db_manager.dart';
import 'package:sell/presentation/widgets/sell_steps/step_1/widgets/car_details.dart';
import 'package:sell/presentation/widgets/sell_steps/step_1/widgets/image_widgets/image_picker.dart';

class Step1 extends StatefulWidget {
  const Step1({super.key});

  @override
  State<Step1> createState() => _Step1State();
}

class _Step1State extends State<Step1> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Column(
      key: ValueKey('step1'),
      children: [
        // MaterialButton(
        //   onPressed: () {
        //     final db = getIt.get<FirebaseHelper>().firestore;
        //     db
        //         .collection('catalog')
        //         .doc("cars")
        //         .set(
        //           CarCatalogModel(
        //             version: 1.0,
        //             brands: CarCatalog.brands,
        //           ).toJson(),
        //         );
        //   },
        //   child: Text("Next Step"),
        // ),
        ImagePicker(),
        CarDetails(),
      ],
    );
  }
}
