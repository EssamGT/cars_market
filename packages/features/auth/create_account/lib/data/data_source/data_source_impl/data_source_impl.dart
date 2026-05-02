import 'package:create_account/data/data_source/data_source.dart';
import 'package:dartz/dartz.dart';
import 'package:data/models/auth/auth_model.dart';
import 'package:data/models/failure/failure.dart';
import 'package:error_handler/error_handler/auth_error_handler/auth_error_handler.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:remote/remote/auth/auth_manager.dart';

@LazySingleton(as: DataSource)
class DataSourceImpl extends DataSource {
  AuthManager remote;
  DataSourceImpl(this.remote);
  @override
  Future<Either<Failure, UserCredential>> createAccount(AuthModel auth) async {
    try {
      final response = await remote.createAccount(
        email: auth.email,
        password: auth.password,
      );

      return Right(response);
    } on FirebaseAuthException catch (authError) {
      return left(AuthErrorHandler.handleFirebaseAuthError(authError));
    } catch (e) {
      print('from dataSource error');
      print(e);
      return Left(Failure(code: e.toString(), message: e.toString()));
    }
  }
}
