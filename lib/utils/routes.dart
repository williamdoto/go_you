// lib/utils/routes.dart

import 'package:flutter/material.dart';
import '../../screens/auth/login_screen.dart';
import '../screens/auth/signup_screen.dart';
import '../screens/home/home_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Routes {
  static const login  = '/login';
  static const signup = '/signup';
  static const home   = '/home';

  /// Call this from `onGenerateRoute:` in your MaterialApp
  static Route<dynamic> generate(RouteSettings settings) {
    switch (settings.name) {
      case login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case signup:
        return MaterialPageRoute(builder: (_) => const SignUpScreen());
        /*
      case home:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      */
      default:
      // Fallback to Login if unknown
        return MaterialPageRoute(builder: (_) => const LoginScreen());


    }
  }
}
