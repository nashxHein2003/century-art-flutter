import 'package:century_art_flutter/features/home/presentation/screens/home_screen.dart';
import 'package:century_art_flutter/features/login/presentation/screens/login_screen.dart';
import 'package:century_art_flutter/features/register/presentation/screens/register_screen.dart';
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
    )
  ],
);
