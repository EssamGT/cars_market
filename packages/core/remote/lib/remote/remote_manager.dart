import 'dart:io';
import 'package:constants/constants_manager.dart';
import 'package:data/models/car/car_image.dart';
import 'package:data/models/car/car_model.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

@singleton
class RemoteManager {
  final Supabase supabase;
  RemoteManager(this.supabase);

  Future<AuthResponse> login({
    required String email,
    required String password,
  }) async {
    return await supabase.client.auth.signInWithPassword(
      email: email,
      password: password,
    );
  }

  Future<AuthResponse> createAccount({
    required String email,
    required String password,
  }) async {
    return await supabase.client.auth.signUp(email: email, password: password);
  }

  Future<void> logout() async {
    await supabase.client.auth.signOut(scope: SignOutScope.local);
  }

  Future<void> requestOTP(String email) async {
    await supabase.client.auth.verifyOTP(type: OtpType.email, email: email);
  }

  Future<void> forgotPassword(String email) async {
    await supabase.client.auth.resetPasswordForEmail(email);
  }

  Future<List<CarImage>> uploadImages(List<XFile> images, String uuid) async {
    List<CarImage> carImages = [];
    // var id = UuidV4().generate();
    for (var image in images.asMap().entries) {
      int index = image.key;
      String path = image.value.path;
      final response = await supabase.client.storage
          .from(AppConstants.imagesBucketId)
          .upload('$uuid/$index', File(path));
      CarImage carImage = CarImage(
        path: response.replaceRange(
          0,
          AppConstants.imagesBucketId.length + 1,
          '',
        ),
        url: supabase.client.storage
            .from(AppConstants.imagesBucketId)
            .getPublicUrl(
              response.replaceRange(
                0,
                AppConstants.imagesBucketId.length + 1,
                '',
              ),
            ),
      );
      carImages.add(carImage);
      // print(carImage.path);
      // print(carImage.url);
    }
    // print(carImages);

    return carImages;
  }

  Future<void> uploadCar(CarModel car) async {
    await supabase.client.from(AppConstants.carTable).insert(car.toJson());
  }
}
