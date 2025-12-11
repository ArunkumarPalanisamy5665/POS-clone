import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../network/internetConnectivity/network_utils.dart';

class AppStateNotifier extends ChangeNotifier {
  bool internetAvailable = false;
  double internetSpeed = 0.0;

  Timer? _internetTimer;
  bool _isDarkMode = false;
  bool get isDarkMode => _isDarkMode;

  AppStateNotifier() {
    _loadTheme();
    _startMonitoring();
  }

  void _startMonitoring() {
    _internetTimer = Timer.periodic(const Duration(seconds: 2), (_) async {
      bool prevStatus = internetAvailable;

      await _checkInternet();

      if (prevStatus != internetAvailable) {
        notifyListeners();
      }
    });
  }

  Future<void> _checkInternet() async {
    bool oldStatus = internetAvailable;

    internetAvailable = await NetworkUtils.isAvailable();

    if (internetAvailable) {
      internetSpeed = await NetworkUtils.checkConnectivityHigh();
    } else {
      internetSpeed = 0;
    }

    if (oldStatus != internetAvailable) {
      notifyListeners();
    }
  }


  Future<bool> checkInitialInternet() async {
    internetAvailable = await NetworkUtils.isAvailable();
    notifyListeners();
    return internetAvailable;
  }


  void toggleTheme() async {
    _isDarkMode = !_isDarkMode;
    notifyListeners();
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('isDarkMode', _isDarkMode);
  }

  void _loadTheme() async {
    final prefs = await SharedPreferences.getInstance();
    _isDarkMode = prefs.getBool('isDarkMode') ?? false;
    notifyListeners();
  }

  @override
  void dispose() {
    _internetTimer?.cancel();
    super.dispose();
  }
}


// class AppStateNotifier extends ChangeNotifier {
//   bool internetAvailable = false;
//   double internetSpeed = 0.0;
//
//   ProfileModel? profileData;
//   MainModel? mainData;
//
//   Timer? timer;
//
//   bool _isDarkMode = false;
//   bool get isDarkMode => _isDarkMode;
//
//   AppStateNotifier() {
//     _loadTheme();
//     // _startMonitoring();
//   }
//
//   // Continuous Monitoring (every 2 sec)
//   void _startMonitoring() {
//     timer = Timer.periodic(const Duration(seconds: 2), (_) async {
//       bool previousStatus = internetAvailable;
//       await _checkInternet();
//
//       // If internet status changed
//       if (previousStatus != internetAvailable) {
//         notifyListeners();
//         _handleInternetChange();
//       }
//     });
//   }
//
//   void _handleInternetChange() {
//     final navigator = AppNavigator.navigatorKey.currentState;
//
//     if (!internetAvailable) {
//       navigator?.pushReplacement(
//         MaterialPageRoute(builder: (_) => const NoInternetScreen()),
//       );
//     }
//
//     else {
//       navigator?.pushReplacement(
//         MaterialPageRoute(builder: (_) => const HomeScreen()),
//       );
//     }
//   }
//
//   // INITIAL INTERNET CHECK (Used in Splash Screen)
//   Future<bool> checkInitialInternet() async {
//     internetAvailable = await NetworkUtils.isAvailable();
//     notifyListeners();
//     return internetAvailable;
//   }
//
//
//   // Internet + Speed Check
//   Future<void> _checkInternet() async {
//     bool oldStatus = internetAvailable;
//     double oldSpeed = internetSpeed;
//
//     // Check availability
//     internetAvailable = await NetworkUtils.isAvailable();
//
//     // Check speed ONLY when online
//     if (internetAvailable) {
//       internetSpeed = await NetworkUtils.checkConnectivityHigh();
//     } else {
//       internetSpeed = 0.0;
//     }
//
//     // Notify ONLY when values changed
//     if (oldStatus != internetAvailable || oldSpeed != internetSpeed) {
//       notifyListeners();
//     }
//   }
//
//
//   // theme mode change
//   void toggleTheme() async {
//     _isDarkMode = !_isDarkMode;
//     notifyListeners();
//     final prefs = await SharedPreferences.getInstance();
//     prefs.setBool('isDarkMode', _isDarkMode);
//   }
//
//   void _loadTheme() async {
//     final prefs = await SharedPreferences.getInstance();
//     _isDarkMode = prefs.getBool('isDarkMode') ?? false;
//     notifyListeners();
//   }
//
//
//   // Profile fetch
//   Future<void> loadProfile() async {
//     if (!internetAvailable) return;
//
//     // profileData = await api.fetchProfile();
//     notifyListeners();
//   }
//
//
//   // Main Data fetch
//   Future<void> loadMainData() async {
//     if (!internetAvailable) return;
//
//     // mainData = await api.fetchMainData();
//     notifyListeners();
//   }
//
//   @override
//   void dispose() {
//     timer?.cancel();
//     super.dispose();
//   }
// }





