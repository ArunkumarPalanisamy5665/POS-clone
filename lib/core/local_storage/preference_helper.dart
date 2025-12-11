import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class PreferenceHelper {


  static const String FCM_KEY = 'fcm_key';
  static const String DEVICE_ID_KEY = 'device_id';
  static const String accessToken = 'accessToken';
  static const String refreshToken = 'refreshToken';
  static const String isLoggedIn = 'is_logged_in';
  static const String language = 'language';
  static const String userData = 'user_data';
  static const String userWorkSpace = 'userWorkSpace';
  static const String themeMode = 'theme_mode';
  static const String onboardingCompleted = 'onboarding_completed';
  static const String locationPermissionGranted = 'location_permission_granted';
  static const String appFirstLaunch = 'app_first_launch';

  static const String currentLatitude = 'current_latitude';
  static const String currentLongitude = 'current_longitude';
  static const String currentAddress = 'current_address';


  static Future<SharedPreferences> get _instance async => await SharedPreferences.getInstance();


  /// Save integer value
  static Future<bool> saveInt(String key, int value) async {
    final prefs = await _instance;
    return prefs.setInt(key, value);
  }

  /// Get integer value
  static Future<int?> getInt(String key) async {
    final prefs = await _instance;
    return prefs.getInt(key);
  }

  /// Save string value
  static Future<bool> saveString(String key, String value) async {
    final prefs = await _instance;
    return prefs.setString(key, value);
  }

  /// Get string value
  static Future<String?> getString(String key) async {
    final prefs = await _instance;
    return prefs.getString(key);
  }

  /// Save boolean value
  static Future<bool> saveBool(String key, bool value) async {
    final prefs = await _instance;
    return prefs.setBool(key, value);
  }

  /// Get boolean value
  static Future<bool?> getBool(String key) async {
    final prefs = await _instance;
    return prefs.getBool(key);
  }

  /// Save double value
  static Future<bool> saveDouble(String key, double value) async {
    final prefs = await _instance;
    return prefs.setDouble(key, value);
  }

  /// Get double value
  static Future<double?> getDouble(String key) async {
    final prefs = await _instance;
    return prefs.getDouble(key);
  }


  /// Save map as JSON string
  static Future<bool> saveMap(String key, Map<String, dynamic> map) async {
    final prefs = await _instance;
    return prefs.setString(key, jsonEncode(map));
  }

  /// Get map from JSON string
  static Future<Map<String, dynamic>?> getMap(String key) async {
    final prefs = await _instance;
    final jsonString = prefs.getString(key);
    if (jsonString == null) return null;
    return jsonDecode(jsonString) as Map<String, dynamic>;
  }

  /// Save model as JSON string
  static Future<bool> saveModel<T>(String key, T model) async {
    final prefs = await _instance;
    final jsonString = jsonEncode((model as dynamic).toJson());
    return prefs.setString(key, jsonString);
  }

  /// Get model from JSON string
  static Future<T?> getModel<T>(String key, T Function(Map<String, dynamic>) fromJson) async {
    final prefs = await _instance;
    final jsonString = prefs.getString(key);
    if (jsonString == null) return null;

    final Map<String, dynamic> jsonMap = jsonDecode(jsonString);
    return fromJson(jsonMap);
  }

  /// Save list as JSON string
  static Future<bool> saveList<T>(String key, List<T> list) async {
    final prefs = await _instance;
    final jsonString = jsonEncode(list);
    return prefs.setString(key, jsonString);
  }

  /// Get list from JSON string
  static Future<List<T>?> getList<T>(String key, T Function(dynamic) fromJson) async {
    final prefs = await _instance;
    final jsonString = prefs.getString(key);
    if (jsonString == null) return null;

    final List<dynamic> jsonList = jsonDecode(jsonString);
    return jsonList.map(fromJson).toList();
  }


  /// Remove specific key
  static Future<bool> remove(String key) async {
    final prefs = await _instance;
    return prefs.remove(key);
  }

  /// Clear all preferences
  static Future<bool> clearAll() async {
    final prefs = await _instance;
    return prefs.clear();
  }

  /// Check if key exists
  static Future<bool> containsKey(String key) async {
    final prefs = await _instance;
    return prefs.containsKey(key);
  }

  /// Get all keys
  static Future<Set<String>> getKeys() async {
    final prefs = await _instance;
    return prefs.getKeys();
  }


  /// Save authentication tokens
  static Future<bool> saveAuthTokens({
    required String accessToken,
    required String refreshToken,
  }) async {
    final prefs = await _instance;
    await prefs.setString(PreferenceHelper.accessToken, accessToken);
    await prefs.setString(PreferenceHelper.refreshToken, refreshToken);
    return await prefs.setBool(PreferenceHelper.isLoggedIn, true);
  }

  /// Get access token
  static Future<String?> getAccessToken() async {
    return await getString(accessToken);
  }

  /// Get refresh token
  static Future<String?> getRefreshToken() async {
    return await getString(refreshToken);
  }

  /// Check if user is logged in
  static Future<bool> isUserLoggedIn() async {
    return await getBool(isLoggedIn) ?? false;
  }

  /// Check if access token is not empty
  static Future<bool> hasValidToken() async {
    final token = await getAccessToken();
    return token != null && token.isNotEmpty;
  }

  /// Clear authentication data
  static Future<bool> clearAuthData() async {
    final prefs = await _instance;
    await prefs.remove(accessToken);
    await prefs.remove(refreshToken);
    await prefs.remove(isLoggedIn);
    return await prefs.setBool(isLoggedIn, false);
  }


  /// Check if this is the first app launch
  static Future<bool> isFirstAppLaunch() async {
    return await getBool(appFirstLaunch) ?? true;
  }

  /// Mark app as launched (not first time anymore)
  static Future<bool> markAppLaunched() async {
    return await saveBool(appFirstLaunch, false);
  }

  /// Check if onboarding is completed
  static Future<bool> isOnboardingCompleted() async {
    return await getBool(onboardingCompleted) ?? false;
  }

  /// Mark onboarding as completed
  static Future<bool> markOnboardingCompleted() async {
    return await saveBool(onboardingCompleted, true);
  }

  /// Check if location permission is granted
  static Future<bool> isLocationPermissionGranted() async {
    return await getBool(locationPermissionGranted) ?? false;
  }

  /// Mark location permission as granted
  static Future<bool> markLocationPermissionGranted() async {
    return await saveBool(locationPermissionGranted, true);
  }

  /// Check if user should see intro screen
  static Future<bool> shouldShowIntroScreen() async {
    final isFirstLaunch = await isFirstAppLaunch();
    final isOnboardingDone = await isOnboardingCompleted();
    return isFirstLaunch && !isOnboardingDone;
  }

  /// Check if user should go directly to home
  static Future<bool> shouldGoToHome() async {
    final isLoggedIn = await isUserLoggedIn();
    final isOnboardingDone = await isOnboardingCompleted();
    final hasLocationPermission = await isLocationPermissionGranted();
    
    return isLoggedIn && isOnboardingDone && hasLocationPermission;
  }

  /// Reset app state (for testing or logout)
  static Future<bool> resetAppState() async {
    final prefs = await _instance;
    await prefs.remove(onboardingCompleted);
    await prefs.remove(locationPermissionGranted);
    await prefs.remove(appFirstLaunch);
    return true;
  }
}
