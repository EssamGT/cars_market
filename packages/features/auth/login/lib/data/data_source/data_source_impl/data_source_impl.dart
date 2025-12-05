import 'package:dartz/dartz.dart';
import 'package:data/models/auth/auth_model.dart';
import 'package:data/models/failure/failure.dart';
import 'package:error_handler/error_handler/auth_error_handler/auth_error_handler.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:login/data/data_source/data_source.dart';
import 'package:remote/remote/auth/auth_manager.dart';

@LazySingleton(as: LoginDataSource)
class DataSourceImpl extends LoginDataSource {
  AuthManager remote;
  DataSourceImpl(this.remote);
  @override
  Future<Either<Failure, UserCredential>> login(AuthModel auth) async {
    try {
      final response = await remote.login(
        email: auth.email,
        password: auth.password,
      );
      return Right(response);
    } on FirebaseAuthException catch (error) {
      return Left(AuthErrorHandler.handleFirebaseAuthError(error));
    } catch (e) {
      return Left(Failure(code: e.toString(), message: e.toString()));
    }
  }
}
