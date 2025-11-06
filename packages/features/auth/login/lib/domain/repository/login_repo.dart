import 'package:dartz/dartz.dart';
import 'package:data/models/auth/auth_model.dart';
import 'package:data/models/failure/failure.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class LoginRepo {
  Future<Either<Failure, UserCredential>> login(AuthModel auth);
}
