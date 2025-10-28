import 'package:dartz/dartz.dart';
import 'package:data/models/failure/failure.dart';

abstract class ForgotPasswordRepo {
  Future<Either<Failure, void>> forgotPassword(String email);
}
