import 'package:dartz/dartz.dart';
import 'package:data/models/auth/auth_model.dart';
import 'package:data/models/failure/failure.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class CreateAccountRepo {
  Future<Either<Failure, AuthResponse>> createAccount(AuthModel auth);
}
