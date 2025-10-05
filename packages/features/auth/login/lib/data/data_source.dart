import 'package:dartz/dartz.dart';
import 'package:data/models/auth_model.dart';
import 'package:data/models/failure.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class LoginDataSource {
  Future<Either<Failure, AuthResponse>> login(AuthModel auth);
}
