import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:new_hrms_flutter/core/routes/route_names.dart';
import 'package:new_hrms_flutter/views/screens/auth/otp/otp_screen.dart';
import 'package:new_hrms_flutter/views/screens/auth/resetPassword/reset_password_screen.dart';
import 'package:new_hrms_flutter/views/screens/dashboard/dashboard_screen.dart'
    hide DashboardScreen;
import 'package:new_hrms_flutter/views/screens/home/home_screen.dart';
import 'package:new_hrms_flutter/views/screens/home/home_screen_two.dart'
    hide MainHome;
import 'package:new_hrms_flutter/views/screens/home/home_screen_two.dart' hide MainHome;
import 'package:new_hrms_flutter/views/screens/settings/delivery_screen.dart';
import 'package:new_hrms_flutter/views/screens/settings/integration_api_screen.dart';
import 'package:new_hrms_flutter/views/screens/settings/notification_settings_screen.dart';
import 'package:new_hrms_flutter/views/screens/settings/payment_types.dart';
import 'package:new_hrms_flutter/views/screens/settings/print_settings_screen.dart';
import 'package:new_hrms_flutter/views/screens/settings/store_settings.dart';
import 'package:new_hrms_flutter/views/screens/settings/tax_settings_screen.dart';
import 'package:new_hrms_flutter/views/screens/splashScreen/splash_screen.dart';
import 'package:new_hrms_flutter/views/screens/app_shell.dart';
import '../../main.dart';
import '../../views/screens/auth/emailVerify/email_verify_screen.dart';
import '../../views/screens/auth/forgotPassword/forgot_password_screen.dart';
import '../../views/screens/auth/login/login_screen.dart';
import '../../views/screens/auth/register/register_screen.dart';
import '../../views/screens/home/main_home.dart';
import '../../views/screens/home/main/main_shell.dart';
import '../../views/screens/home/pos/pos_shell.dart';
import '../../views/screens/home/profile_manager.dart';
import '../../views/screens/kitchen/kitchen_kds_screen.dart';
import '../../views/screens/menuManagement/addOns/add_ons_screen.dart';
import '../../views/screens/orders/order_screen.dart';
import '../../views/screens/reservation/reservation_screen.dart';
import '../../views/screens/table/table_screen.dart';

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
        builder: (context, state) => const LoginScreen(),
      ),

      GoRoute(
        path: '/register',
        name: RouteNames.register,
        builder: (context, state) => const RegisterScreen(),
      ),

      GoRoute(
        path: '/forgot_password',
        name: RouteNames.forgotPassword,
        builder: (context, state) => const ForgotPasswordScreen(),
      ),
      GoRoute(
        path: '/reset_password',
        name: RouteNames.resetPassword,
        builder: (context, state) => const ResetPasswordScreen(),
      ),

      GoRoute(
        path: '/email_verify',
        name: RouteNames.emailVerify,
        builder: (context, state) => const EmailVerifyScreen(),
      ),

      GoRoute(
        path: '/otp',
        name: RouteNames.otp,
        builder: (context, state) => const OtpScreen(),
      ),






      // GoRoute(
      //   path: '/dashboard',
      //   name: RouteNames.dashboard,
      //   builder: (context, state) => const DashboardScreen(),
      // ),

      // GoRoute(
      //   path: '/home_main',
      //   name: RouteNames.homeMain,
      //   builder: (context, state) =>   HomeScreenTwo(),
      // ),
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
                builder: (_, __) =>
                    const Center(child: Text('profile Info Page')),
              ),
              GoRoute(
                path: 'documents',
                name: 'profile_documents',
                builder: (_, __) =>
                    const Center(child: Text('profile documents Page')),
              ),
              GoRoute(
                path: 'settings',
                name: 'profile_settings',
                builder: (_, __) =>
                    const Center(child: Text('profile settings Page')),
              ),
            ],
          ),
          GoRoute(
            path: '/settings',
            name: RouteNames.settings,
            builder: (context, state) =>
                const Center(child: Text('Settings Page - TODO: Implement')),
          ),
          GoRoute(
            path: '/attendance',
            name: RouteNames.attendance,
            builder: (context, state) =>
                const Center(child: Text('Attendance Page - TODO: Implement')),
          ),
        ],
      ),
      ShellRoute(
        builder: (_, __, child) {
          return MainShell(child: child);
        },
        routes: [

          GoRoute(
            path: '/dashboard',
            name: RouteNames.dashboard,
            // builder: (context, state) => MainHome(),
            builder: (context, state) => AddOnsScreen(),
          ),

          // GoRoute(
          //   path: '/dashboard',
          //   name: RouteNames.dashboard,
          //   builder: (_, __) => const DashboardScreen(),
          // ),
          GoRoute(
            path: '/orders',
            name: RouteNames.order,
            builder: (_, __) => const OrderScreen(),
          ),
          GoRoute(
            path: '/kitchen',
            name: RouteNames.kitchen,
            builder: (_, __) => const KitchenKdsScreen(),
          ),
          GoRoute(
            path: '/reservation',
            name: RouteNames.reservation,
            builder: (_, __) => const ReservationScreen(),
          ),

          GoRoute(
            path: '/table',
            name: RouteNames.table,
            builder: (_, __) => const TableScreen(),
          ),
          GoRoute(
            path: '/integration-api',
            name: RouteNames.integrationApi,
            builder: (_, __) => const IntegrationApiScreen(),
          ),
          GoRoute(
            path: '/notification-settings',
            name: RouteNames.notificationSettings,
            builder: (_, __) => const NotificationSettingsScreen(),
          ),
          GoRoute(
            path: '/delivery',
            name: RouteNames.delivery,
            builder: (_, __) => const DeliveryScreen(),
          ),
          GoRoute(
            path: '/payment-types',
            name: RouteNames.paymentTypes,
            builder: (_, __) => const PaymentTypes(),
          ),
          GoRoute(
            path: '/print-settings',
            name: RouteNames.printSettings,
            builder: (_, __) => const PrintSettingsScreen(),
          ),
          GoRoute(
            path: '/tax-settings',
            name: RouteNames.taxSettings,
            builder: (_, __) => const TaxSettingsScreen(),
          ),
          GoRoute(
            path: '/store-settings',
            name: RouteNames.storeSettings,
            builder: (_, __) => const StoreSettings(),
          ),
        ],
      ),

      ShellRoute(
        builder: (_, __, child) {
          return PosShell(child: child);
        },
        routes: [
          GoRoute(
            path: '/pos',
            name: RouteNames.pos,
            builder: (_, __) => const PosScreen(),
          ),

          // GoRoute(
          //   path: '/pos',
          //   name: RouteNames.pos,
          //   builder: (context, state) {
          //     final args = state.extra as Map<String, dynamic>?;
          //
          //     final List<OrderStatusCardData> orderDeliveredList =
          //         args?['order_delivered_list'] as List<OrderStatusCardData>? ?? [];
          //
          //     return OrderStatusCardOne(
          //       list: orderDeliveredList,
          //     );
          //   },
          // ),

          GoRoute(
            path: '/profile/documents',
            builder: (_, __) => const ProfileDocumentsPage(),
          ),
          GoRoute(
            path: '/profile/settings',
            builder: (_, __) => const ProfileSettingsPage(),
          ),
        ],
      ),
    ],
  );
}
