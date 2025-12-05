import 'package:dartz/dartz.dart';
import 'package:data/models/failure/failure.dart';
import 'package:error_handler/error_handler/base_errors/base_error_type.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:injectable/injectable.dart';
import 'package:remote/network_info/network_info.dart';
import 'package:user_details/data/data_source/user_details_data_source.dart';
import 'package:user_details/domain/repository/user_details_repo.dart';

@Injectable(as: UserDetailsRepo, env: [Environment.dev])
class UserDetailsRepoImpl extends UserDetailsRepo {
  UserDetailsDataSource dataSource;
  NetworkInfo networkInfo;
  UserDetailsRepoImpl(this.dataSource, this.networkInfo);
  //network info to dooooo
  @override
  Future<Either<Failure, void>> sendEmailVerification() async {
    if (await networkInfo.isConnected) {
      await dataSource.sendEmailVerification();
      return Right(null);
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

  // @override
  // Future<AuthResponse> refreshSession() {
  //   try {
  //     return dataSource.refreshSession();
  //   } catch (e) {
  //     print(e);
  //     rethrow;
  //   }
  // }

  @override
  Future<Either<Failure, void>> sendOTP(String phoneNumber) async {
    if (await networkInfo.isConnected) {
      return dataSource.sendOTP(phoneNumber);
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
  Future<Either<Failure, UserCredential>> verifyOTP(String otp) async {
    if (await networkInfo.isConnected) {
      return dataSource.verifyOTP(otp);
    } else {
      return Left(BaseErrorType.noInternet.getFailure());
    }
  }

  @override
  Future<Either<Failure, void>> updateName(String name) async {
    if (await networkInfo.isConnected) {
      return dataSource.updateName(name);
    } else {
      return Left(BaseErrorType.noInternet.getFailure());
    }
  }
}
