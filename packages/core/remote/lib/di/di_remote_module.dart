import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

@module
abstract class RemoteModule {
  @singleton
  Supabase get supabase => Supabase.instance;
  @singleton
  FirebaseAuth get firebaseAuth => FirebaseAuth.instance;
}
