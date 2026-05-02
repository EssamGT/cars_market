import 'package:dartz/dartz.dart';
import 'package:data/models/failure/failure.dart';
import 'package:data/models/user/user_data.dart';
import 'package:error_handler/error_handler/base_errors/base_error_type.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:remote/network_info/network_info.dart';
import 'package:update_user_data/data/data_source/edit_user_data_daw.dart';
import 'package:update_user_data/domain/repository/update_user_data_repo.dart';

@Injectable(as: UpdateUserDataRepo)
class UpdateUserDataRepoImpl extends UpdateUserDataRepo {
  UpdateUserDataDaw dataSource;
  NetworkInfo networkInfo;
  UpdateUserDataRepoImpl(this.dataSource, this.networkInfo);
  @override
  Future<Either<Failure, void>> userNameUpdate(String newName) async {
    if (await networkInfo.isConnected) {
      return await dataSource.userNameUpdate(newName);
    } else {
      return Left(BaseErrorType.noInternet.getFailure());
    }
  }

  @override
  Future<Either<Failure, void>> userEmailUpdate(String newEmail) async {
    if (await networkInfo.isConnected) {
      return await dataSource.userEmailUpdate(newEmail);
    } else {
      return Left(BaseErrorType.noInternet.getFailure());
    }
  }

  @override
  Future<Either<Failure, Stream<User?>>> authStateChanges() async {
    if (await networkInfo.isConnected) {
      return dataSource.authStateChanges();
    } else {
      return Left(BaseErrorType.noInternet.getFailure());
    }
  }

  @override
  Future<Either<Failure, UserData>> getUserData() async {
    if (await networkInfo.isConnected) {
      return await dataSource.getUserData();
    } else {
      return Left(BaseErrorType.noInternet.getFailure());
    }
  }

  @override
  Future<Either<Failure, void>> userPhoneUpdate(String newPhone) async {
    if (await networkInfo.isConnected) {
      return await dataSource.userPhoneUpdate(newPhone);
    } else {
      return Left(BaseErrorType.noInternet.getFailure());
    }
  }

  @override
  Future<Either<Failure, void>> resendOTP(String phoneNumber) async {
    if (await networkInfo.isConnected) {
      return dataSource.resendOTP(phoneNumber);
    } else {
      return Left(BaseErrorType.noInternet.getFailure());
    }
  }

  @override
  Future<Either<Failure, void>> verifyOTP(String otp) async {
    if (await networkInfo.isConnected) {
      return dataSource.verifyOTP(otp);
    } else {
      return Left(BaseErrorType.noInternet.getFailure());
    }
  }

  @override
  Future<Either<Failure, void>> userPasswordUpdate(String newPassword) async {
    if (await networkInfo.isConnected) {
      return dataSource.userPasswordUpdate(newPassword);
    } else {
      return Left(BaseErrorType.noInternet.getFailure());
    }
  }
}
