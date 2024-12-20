import 'package:century_art_flutter/features/account/presentation/screens/account_screen.dart';
import 'package:century_art_flutter/features/home/presentation/screens/home_screen.dart';
import 'package:century_art_flutter/features/login/presentation/screens/login_screen.dart';
import 'package:century_art_flutter/features/register/presentation/screens/register_screen.dart';
import 'package:century_art_flutter/features/upload/presentation/screens/upload_screen.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: 'Home',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/login',
      name: 'Login',
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: '/register',
      name: 'Register',
      builder: (context, state) => const RegisterScreen(),
    ),
    GoRoute(
      path: '/upload',
      name: 'Upload',
      builder: (context, state) => const UploadScreen(),
    ),
    GoRoute(
      path: '/account',
      name: 'Account',
      builder: (context, state) => const AccountScreen(),
    )
  ],
);
