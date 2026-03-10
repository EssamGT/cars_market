import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:injectable/injectable.dart';

@module
abstract class RemoteModule {
  @singleton
  FirebaseAuth get firebaseAuth => FirebaseAuth.instance;

  @singleton
  FirebaseFirestore get firebaseFirestore =>
      FirebaseFirestore.instanceFor(app: Firebase.app(), databaseId: "default");

  @singleton
  FirebaseStorage get firebaseStorage => FirebaseStorage.instance;
}
