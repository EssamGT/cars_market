import 'package:dartz/dartz.dart';
import 'package:data/models/failure.dart';
import 'package:forgot_password/data/data_source/forgot_password_data_soure.dart';
import 'package:forgot_password/domain/repository/forgot_password_repo.dart';
import 'package:injectable/injectable.dart';
import 'package:remote/network_info/network_info.dart';

@LazySingleton(as: ForgotPasswordRepo)
class ForgotPasswordRepoImpl extends ForgotPasswordRepo {
  ForgotPasswordDataSoure dataSoure;
  NetworkInfo networkInfo;
  ForgotPasswordRepoImpl(this.dataSoure, this.networkInfo);
  @override
  Future<Either<Failure, void>> forgotPassword(String email) async {
    if (await networkInfo.isConnected) {
      return dataSoure.forgotPassword(email);
    } else {
      return Left(Failure(code: 'no internet', message: 'nointer'));
    }
  }
}
