import 'package:firebase_auth/firebase_auth.dart';


class UserModel {
  final String uid;
  final String? email;
  final String? displayName;

  UserModel({
    required this.uid,
    this.email,
    this.displayName,
  });

  factory UserModel.fromFirebase(User firebaseUser) {
    return UserModel(
      uid: firebaseUser.uid,
      email: firebaseUser.email,
      displayName: firebaseUser.displayName,
    );
  }
}