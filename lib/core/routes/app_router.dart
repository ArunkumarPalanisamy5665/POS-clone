
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:new_hrms_flutter/core/routes/route_names.dart';
import 'package:new_hrms_flutter/views/screens/home/home_screen.dart';
import 'package:new_hrms_flutter/views/screens/splashScreen/splash_screen.dart';
import 'package:new_hrms_flutter/views/screens/app_shell.dart';
import '../../main.dart';
import '../../views/screens/auth/emailVerify/email_verify_screen.dart';
import '../../views/screens/auth/forgotPassword/forgot_password_screen.dart';
import '../../views/screens/auth/login/login_screen.dart';
import '../../views/screens/auth/register/register_screen.dart';
import '../../views/screens/home/profile_manager.dart';

class AppRouter {
  static final GoRouter routes = GoRouter(
    initialLocation: RouteNames.splash,
    navigatorKey: navigatorKey,
    redirect: (context, state) {
      return null;
    },
    routes: [

      GoRoute(
        path: '/',
        name: RouteNames.splash,
        builder: (context, state) => const SplashScreen(),
      ),

      GoRoute(
        path: '/login',
        name: RouteNames.login,
        builder: (context, state) =>  LoginScreen(),
      ),

      GoRoute(
        path: '/register',
        name: RouteNames.register,
        builder: (context, state) =>  RegisterScreen(),
      ),

      GoRoute(
        path: '/forgot_password',
        name: RouteNames.forgotPassword,
        builder: (context, state) =>  ForgotPasswordScreen(),
      ),

      GoRoute(
        path: '/email_verify',
        name: RouteNames.emailVerify,
        builder: (context, state) =>  EmailVerifyScreen(),
      ),

      GoRoute(
        path: '/home',
        name: RouteNames.home,
        builder: (context, state) => const HomeScreen(),
      ),

      ShellRoute(
        builder: (context, state, child) {
          return AppShell(state: state, child: child);
        },
        routes: [
          GoRoute(
            path: '/profile',
            name: 'profile',
            builder: (_, __) => ProfileManager(),
            routes: [
              GoRoute(
                path: 'info',
                name: 'profile_info',
                builder: (_, __) =>  const Center(child: Text('profile Info Page')),
              ),
              GoRoute(
                path: 'documents',
                name: 'profile_documents',
                builder: (_, __) =>  const Center(child: Text('profile documents Page')),
              ),
              GoRoute(
                path: 'settings',
                name: 'profile_settings',
                builder: (_, __) => const Center(child: Text('profile settings Page')),
              ),
            ],
          ),
          GoRoute(
            path: '/settings',
            name: RouteNames.settings,
            builder: (context, state) => const Center(
              child: Text('Settings Page - TODO: Implement'),
            ),
          ),
          GoRoute(
            path: '/attendance',
            name: RouteNames.attendance,
            builder: (context, state) => const Center(
              child: Text('Attendance Page - TODO: Implement'),
            ),
          ),
        ],
      ),
    ],
  );
}
