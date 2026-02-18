import 'package:dartz/dartz.dart';
import 'package:data/models/car/car_image.dart';
import 'package:data/models/car/sell_car_model.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:remote/network_info/network_info.dart';
import 'package:sell/data/data_source/sell_data_source.dart';
import 'package:sell/domain/repository/sell_repository.dart';

@LazySingleton(as: SellRepository)
class SellRepoImpl implements SellRepository {
  SellDataSource sellDataSource;
  NetworkInfo networkInfo;  
  SellRepoImpl({required this.sellDataSource,required this.networkInfo});
  @override
  Future<Either<String, List<CarImage>>> uploadImage(List<XFile> images,String uuid) async {
  if(await networkInfo.isConnected){
    return await sellDataSource.uploadImage(images,uuid);
  }
  return Left("No Internet Connection");
  }

  @override
  Future<Either<String, void>> uploadCar(SellCarUploadModel car) async{
    if(await networkInfo.isConnected){
      return await sellDataSource.uploadCar(car);
    }
    return Left("No Internet Connection");
  }
}
