import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:constants/constants_manager.dart';
import 'package:data/models/car/car_image.dart';
import 'package:data/models/car/car_model.dart';
import 'package:domain/entity/car_entity.dart';
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
  final carsImagesPath = dotenv.env[AppConstants.carsImagesPathKey];
  final carsCollection = dotenv.env[AppConstants.carsDataBaseKey];
  final usersCollection = dotenv.env[AppConstants.usersDataBaseKey];

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
        .collection(carsCollection!)
        .doc(car.carId)
        .set(car.toJson())
        .then((ture) {
          firestore
              .collection(usersCollection!)
              .doc(auth.currentUser!.uid)
              .update({
                'cars': FieldValue.arrayUnion([car.carId]),
              });
        });
  }

  Future<List<CarEntity>> getMainScreenCars() async {
    final cars = await firestore
        .collection(carsCollection!)
        .orderBy(CarsTableKeys.createdAt, descending: true)
        .limit(10)
        .get(GetOptions(source: Source.server));
    final carEntity = cars.docs
        .map((d) => CarEntity.fromJson(d.data()))
        .toList();
    return carEntity;
  }
}
