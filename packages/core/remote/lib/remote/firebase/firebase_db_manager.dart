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
  final int searchResultsLimit = 20;

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
        .limit(searchResultsLimit)
        .get(GetOptions(source: Source.server));
    final carEntity = cars.docs
        .map((d) => CarEntity.fromJson(d.data()))
        .toList();
    return carEntity;
  }

  Future<void> allCatalogs() async {
    final carCatalogs = CarCatalogModel(
      version: 1.0,
      brands: CarCatalog.brands,
    );
    final locations = LocationsCatalog(locationsCatalog: locationCatalog);
    await firestore.collection('catalog').doc("cars").set(carCatalogs.toJson());
    await firestore
        .collection('catalog')
        .doc("locations")
        .set(locations.toJson());
  }

  Future<List<CarEntity>> searchScreenCars(
    CarFilterModelRequest searchModel,
  ) async {
    Query<Map<String, dynamic>> query = firestore.collection(carsDataBase!);
    if (searchModel.isNull()) {
      return getMainScreenCars();
    } else {
      if (searchModel.brandId != null) {
        query = query.where(
          CarsTableKeys.brandId,
          isEqualTo: searchModel.brandId,
        );
      }
      if (searchModel.modelId != null) {
        query = query.where(
          CarsTableKeys.modelId,
          isEqualTo: searchModel.modelId,
        );
      }
      if (searchModel.location != null) {
        query = query.where(
          CarsTableKeys.location,
          isEqualTo: searchModel.location!.toJsonId(),
        );
      }
      if (searchModel.minYear != null) {
        query = query.where(
          CarsTableKeys.year,
          isGreaterThanOrEqualTo: searchModel.minYear,
        );
      }
      if (searchModel.maxYear != null) {
        query = query.where(
          CarsTableKeys.year,
          isLessThanOrEqualTo: searchModel.maxYear,
        );
      }
      if (searchModel.minPrice != null) {
        query = query.where(
          CarsTableKeys.price,
          isGreaterThanOrEqualTo: searchModel.minPrice,
        );
      }
      if (searchModel.maxPrice != null) {
        query = query.where(
          CarsTableKeys.price,
          isLessThanOrEqualTo: searchModel.maxPrice,
        );
      }
      if (searchModel.minKm != null) {
        query = query.where(
          CarsTableKeys.km,
          isGreaterThanOrEqualTo: searchModel.minKm,
        );
      }
      if (searchModel.maxKm != null) {
        query = query.where(
          CarsTableKeys.km,
          isLessThanOrEqualTo: searchModel.maxKm,
        );
      }
      if (searchModel.transmissionType != null) {
        query = query.where(
          CarsTableKeys.transmissionType,
          isEqualTo: searchModel.transmissionType!.name,
        );
      }
      if (searchModel.fuelType != null) {
        query = query.where(
          '${CarsTableKeys.engineSpec}.${CarsTableKeys.fuelType}',
          isEqualTo: searchModel.fuelType!.name,
        );
      }
      if (searchModel.bodyType != null) {
        query = query.where(
          CarsTableKeys.bodyType,
          isEqualTo: searchModel.bodyType!.name,
        );
      }
      if (searchModel.paintColor != null) {
        query = query.where(
          CarsTableKeys.paintColor,
          isEqualTo: searchModel.paintColor!.name,
        );
      }
      if (searchModel.paintCondition != null) {
        query = query.where(
          CarsTableKeys.paintCondition,
          isEqualTo: searchModel.paintCondition!.name,
        );
      }
      if (searchModel.minEngineCapacity != null) {
        query = query.where(
          '${CarsTableKeys.engineSpec}.${CarsTableKeys.engineCapacityValue}',
          isGreaterThanOrEqualTo: searchModel.minEngineCapacity,
        );
      }
      if (searchModel.maxEngineCapacity != null) {
        query = query.where(
          '${CarsTableKeys.engineSpec}.${CarsTableKeys.engineCapacityValue}',
          isLessThanOrEqualTo: searchModel.maxEngineCapacity,
        );
      }

      final cars = await query
          .limit(searchResultsLimit)
          .get(GetOptions(source: Source.server));
      final carEntity = cars.docs
          .map((d) => CarEntity.fromJson(d.data()))
          .toList();
      return carEntity;
    }
  }
}
