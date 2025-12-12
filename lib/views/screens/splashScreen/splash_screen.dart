import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:new_hrms_flutter/core/constants/app_assets.dart';
import 'package:new_hrms_flutter/core/routes/route_names.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../../../../core/state/app_state_provider.dart';
import '../../widgets/responsive/responsive.dart';
import '../home/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  Timer? timer;
  bool firstCheckDone = false;
  String appVersion = "";

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {

      if(Responsive.isMobile(context) || Responsive.isTablet(context)){
        _loadAppVersion();
        Future.delayed(const Duration(milliseconds: 1000), () {
          _checkInternetLoop();
        });
      }else{
        navigateToLogin();
      }

    });
  }

  Future<void> _loadAppVersion() async {
    final info = await PackageInfo.fromPlatform();
    if (mounted) {
      setState(() {
        appVersion = 'v${info.version}';
      });
    }
  }

  Future<void> _checkInternetLoop() async {
    final app = AppStateProvider.of(context);

    await Future.delayed(const Duration(milliseconds: 500));

    bool online = await app.checkInitialInternet();
    firstCheckDone = true;
    setState(() {});

    if (online) {
      navigateToLogin();
      return;
    }

    // OFFLINE → keep checking every 1 sec
    timer = Timer.periodic(const Duration(seconds: 1), (_) async {
      bool status = await app.checkInitialInternet();
      if (status) {
        timer?.cancel();
        navigateToLogin();
      }
    });
  }

  void navigateToLogin() {
      GoRouter.of(context).go(RouteNames.register);
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return  Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [

          Image.asset(
            AppAssets.logoBG,
            fit: BoxFit.cover,
          ),

          Positioned(
            left: 0,
            right: 0,
            top: MediaQuery.of(context).size.height * 0.3,
            child: Image.asset(
            AppAssets.centerBG,
            fit: BoxFit.cover,
          ),),

          Positioned(
            bottom: 30,
            left: 0,
            right: 0,
            child: Column(
              children: [
                const SizedBox(
                  height: 12,
                  width: 12,
                  child: CircularProgressIndicator(
                      color: Colors.white, strokeWidth: 2),
                ),
                const SizedBox(height: 10),
                Text(
                  appVersion,
                  textAlign: TextAlign.center,
                  style:
                  const TextStyle(color: Colors.white, fontSize: 12),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

}

