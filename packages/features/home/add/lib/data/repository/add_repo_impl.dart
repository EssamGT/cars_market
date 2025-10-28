import 'package:add/data/data_source/add_data_source.dart';
import 'package:add/domain/repository/add_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:data/models/car/car_image.dart';
import 'package:data/models/car/car_model.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:remote/network_info/network_info.dart';

@Injectable(as: AddRepository)
class AddRepoImpl implements AddRepository {
  AddDataSource addDataSource;
  NetworkInfo networkInfo;  
  AddRepoImpl({required this.addDataSource,required this.networkInfo});
  @override
  Future<Either<String, List<CarImage>>> uploadImage(List<XFile> images,String uuid) async {
  if(await networkInfo.isConnected){
    return await addDataSource.uploadImage(images,uuid);
  }
  return Left("No Internet Connection");
  }

  @override
  Future<Either<String, void>> uploadCar(CarModel car) async{
    if(await networkInfo.isConnected){
      return await addDataSource.uploadCar(car);
    }
    return Left("No Internet Connection");
  }
}
