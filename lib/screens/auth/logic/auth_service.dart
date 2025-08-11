// lib/services/auth_service.dart
import 'package:go_you/models/auth/user_model.dart'; //
class AuthService {
  Future<void> signInWithEmail(String email, String password) async {
    throw UnimplementedError();
  }

  Future<void> signUpWithEmail(String email, String password) async {
    throw UnimplementedError();
  }

  Future<void> signInWithGoogle() async {
    throw UnimplementedError();
  }

  Future<void> signOut() async {
    throw UnimplementedError();
  }

  Stream<UserModel?> get userChanges {


    throw UnimplementedError();
  }
}
