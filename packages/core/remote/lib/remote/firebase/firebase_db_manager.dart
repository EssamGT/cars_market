import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:constants/constants_manager.dart';
import 'package:data/models/car/brands_models/car_catalog.dart';
import 'package:data/models/car/car_filter_model.dart';
import 'package:data/models/car/car_image.dart';
import 'package:data/models/car/sell_car_model.dart';
import 'package:data/models/location/locations_catalog.dart';
import 'package:domain/entity/car_entity.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:path/path.dart';

@singleton
class FirebaseDbManager {
  FirebaseFirestore firestore;
  FirebaseStorage storage;
  FirebaseAuth auth;
  FirebaseDbManager({
    required this.firestore,
    required this.storage,
    required this.auth,
  });
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
      String downloadUrl = await carImagesRef.getDownloadURL();
      carImages.add(CarImage(url: downloadUrl, path: carImagesRef.fullPath));
    }
    return carImages;
  }

  Future<void> uploadCar(SellCarUploadModel car) async {
    car.userId = auth.currentUser!.uid;
    await firestore
        .collection(carsDataBase!)
        .doc(car.carId)
        .set(car.toJson())
        .then((ture) {
          firestore
              .collection(usersDataBase!)
              .doc(auth.currentUser!.uid)
              .update({
                'cars': FieldValue.arrayUnion([car.carId]),
              });
        });
  }

  Future<CarCatalogModel> getCarCatalog() async {
    final doc = await firestore.collection('catalog').doc("cars").get();
    if (doc.exists) {
      return CarCatalogModel.fromJson(doc.data()!);
    }
    throw Exception("server error");
  }

  Future<LocationsCatalog> getLocationsCatalog() async {
    final doc = await firestore.collection('catalog').doc("locations").get();
    if (doc.exists) {
      return LocationsCatalog.fromJson(doc.data()!);
    }
    throw Exception("server error");
  }

  Future<List<CarEntity>> getMainScreenCars() async {
    final cars = await firestore
        .collection(carsDataBase!)
        .orderBy(CarsTableKeys.createdAt, descending: true)
        .limit(10)
        .get(GetOptions(source: Source.server));
    final carEntity = cars.docs
        .map((d) => CarEntity.fromJson(d.data()))
        .toList();
    return carEntity;
  }

  Future<List<CarEntity>> searchScreenCars(CarFilterModel searchModel) async {
    final cars = await firestore
        .collection(carsDataBase!)
        .where(CarsTableKeys.brandId, isEqualTo: searchModel.brand.id)
        .where(
          CarsTableKeys.modelId,
          isEqualTo: searchModel.brand.selectedModel.id,
        )
        .where(CarsTableKeys.location, isEqualTo: searchModel.location)
        .where(
          CarsTableKeys.year,
          isGreaterThanOrEqualTo: searchModel.minYear,
          isLessThanOrEqualTo: searchModel.maxYear,
        )
        .where(
          CarsTableKeys.price,
          isGreaterThanOrEqualTo: searchModel.minPrice,
          isLessThanOrEqualTo: searchModel.maxPrice,
        )
        .where(
          CarsTableKeys.km,
          isGreaterThanOrEqualTo: searchModel.minKm,
          isLessThanOrEqualTo: searchModel.maxKm,
        )
        .where(CarsTableKeys.fuelType, isEqualTo: searchModel.fuelType)
        .where(CarsTableKeys.bodyType, isEqualTo: searchModel.bodyType)
        .where(CarsTableKeys.paintColor, isEqualTo: searchModel.paintColor)
        .where(
          CarsTableKeys.paintCondition,
          isEqualTo: searchModel.paintCondition,
        )
        .where(
          CarsTableKeys.transmissionType,
          isEqualTo: searchModel.transmissionType,
        )
        .limit(10)
        .get(GetOptions(source: Source.server));
    final carEntity = cars.docs
        .map((d) => CarEntity.fromJson(d.data()))
        .toList();
    return carEntity;
  }
}
