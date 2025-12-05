import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:constants/constants_manager.dart';
import 'package:data/models/car/car_image.dart';
import 'package:data/models/car/car_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:path/path.dart';

@singleton
class StorageManager {
  FirebaseFirestore firestore;
  FirebaseStorage storage;
  FirebaseAuth auth;
  StorageManager({
    required this.firestore,
    required this.storage,
    required this.auth,
  });
  final storageBaseUrl = dotenv.env[AppConstants.storageBaseUrlKey];
  final carsImagesPath = dotenv.env[AppConstants.carsImagesPathKey];
  final carsDataBase = dotenv.env[AppConstants.carsDataBaseKey];
  final usersDataBase = dotenv.env[AppConstants.usersDataBaseKey];

  Future<List<CarImage>> uploadCarImages(List<XFile> images, String id) async {
    List<CarImage> carImages = [];
    final storageRef = storage.ref();
    for (var image in images) {
      String imageName =
          '${DateTime.now().millisecondsSinceEpoch}_${basename(image.path)}';
      final carImagesRef = storageRef.child('$carsImagesPath/$id/$imageName');

      await carImagesRef.putFile(File(image.path));
      // print("Uploading image: $imageName");
      String downloadUrl = await carImagesRef.getDownloadURL();
      carImages.add(CarImage(url: downloadUrl, path: carImagesRef.fullPath));
      // print("Image uploaded successfully: $downloadUrl");
    }
    return carImages;
  }

  Future<void> uploadCar(CarModel car) async {
    car.userId = auth.currentUser!.uid;
    await firestore
        .collection(carsDataBase!)
        .doc(car.id)
        .set(car.toJson())
        .then((ture) {
          firestore.collection(usersDataBase!).doc(auth.currentUser!.uid).update({
            'cars': FieldValue.arrayUnion([car.id]),
          });
        });
  }
}
