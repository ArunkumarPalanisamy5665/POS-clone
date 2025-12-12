import 'package:flutter/material.dart';
import 'package:new_hrms_flutter/di/app_module.dart';
import 'package:new_hrms_flutter/views/screens/auth/login/login_vm.dart';
import 'package:new_hrms_flutter/views/screens/auth/register/register_vm.dart';
import 'package:new_hrms_flutter/views/screens/dashboard/home_vm.dart';
import 'package:new_hrms_flutter/views/screens/splashScreen/splash_vm.dart';
import 'package:provider/provider.dart';

import 'core/routes/app_router.dart';
import 'core/state/app_state_notifier.dart';
import 'core/state/app_state_provider.dart';
import 'core/theme/app_theme.dart';
import 'views/widgets/common/common_widgets.dart';



CommonWidgets commonWidgets = CommonWidgets();



void main() {

  setupLocator();

  runApp(
    MultiProvider(
      providers: [

        ChangeNotifierProvider(create: (_) => AppStateNotifier()),

        ChangeNotifierProvider(create: (_) => SplashVm()),
        ChangeNotifierProvider(create: (_) => LoginVm()),
        ChangeNotifierProvider(create: (_) => HomeVm()),
        ChangeNotifierProvider(create: (_) => RegisterVm()),
        // ChangeNotifierProvider(create: (_) => ThemeProvider()),
        // ChangeNotifierProvider(create: (_) => ConnectivityProvider()),
        // ChangeNotifierProvider(create: (_) => AppLifecycleProvider()),
      ],
      child: const _AppRoot(),
    ),
  );
}


class _AppRoot extends StatelessWidget {
  const _AppRoot({super.key});

  @override
  Widget build(BuildContext context) {
    final appState = context.watch<AppStateNotifier>();

    return

      AppStateProvider(
      state: appState,
      child: const MyApp(),
    );
  }
}


final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final app = AppStateProvider.of(context);

    return MediaQuery(
      data: MediaQuery.of(context).copyWith(
        textScaler: const TextScaler.linear(1.0),
      ),
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.light(context),
        darkTheme: AppTheme.dark(context),
        themeMode: app.isDarkMode ? ThemeMode.dark : ThemeMode.light,
        routerConfig: AppRouter.routes,
        // routeInformationProvider: PlatformRouteInformationProvider(
        //   initialRouteInformation: RouteInformation(
        //     uri: Uri.parse('/'),
        //   ), // Clean URLs: /home, /profile
        // ),
      ),
    );
  }
}
