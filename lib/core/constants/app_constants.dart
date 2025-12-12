import 'package:flutter/cupertino.dart';

class AppConstants {

  //Api Key
 static const String apiKey = "AIzaSyCuJdNpusU4dcIqB2PGPDkEIRz0_FsD2-U";

  // Storage Keys
  static const String themeKey = "theme";
  static const String userKey = "user";
  static const String locationKey = "location";

  // Routes
  static const String onboardingRoute = '/onboarding';
  static const String homeRoute = '/home';
  static const String loginRoute = '/login';
  static const String otpRoute = '/otp';

  // Validation
  static const int phoneNumberLength = 10;
  static const int otpLength = 4;
  static const int otpResendTime = 60; // seconds

  // Theme Types
  static const String lightTheme = 'light';
  static const String darkTheme = 'dark';
  static const String systemTheme = 'system';

  // Storage
  static const double maxStorageForUser = 15.0; // GB




}