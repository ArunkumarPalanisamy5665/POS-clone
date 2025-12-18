import 'package:flutter/material.dart';

class AppTheme {
  static const String fontFamily = "InstrumentSans";

  static const TextTheme textThemeLight = TextTheme(
    displayLarge: TextStyle(fontSize: 36, fontWeight: FontWeight.bold, color: Colors.black, fontFamily: fontFamily),
    headlineMedium: TextStyle(fontSize: 24, fontWeight: FontWeight.w600, color: Colors.black,fontFamily: fontFamily),
    titleLarge: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: Colors.black,fontFamily: fontFamily),
    bodyLarge: TextStyle(fontSize: 18, color: Colors.black87,fontFamily: fontFamily),
    bodyMedium: TextStyle(fontSize: 16, color: Colors.black87,fontFamily: fontFamily),
    bodySmall: TextStyle(fontSize: 14, color: Colors.black54,fontFamily: fontFamily),
  );

  static const TextTheme textThemeDark = TextTheme(
    displayLarge: TextStyle(fontSize: 36, fontWeight: FontWeight.bold, color: Colors.white,fontFamily: fontFamily),
    headlineMedium: TextStyle(fontSize: 24, fontWeight: FontWeight.w600, color: Colors.white,fontFamily: fontFamily),
    titleLarge: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: Colors.white,fontFamily: fontFamily),
    bodyLarge: TextStyle(fontSize: 18, color: Colors.white70,fontFamily: fontFamily),
    bodyMedium: TextStyle(fontSize: 16, color: Colors.white70,fontFamily: fontFamily),
    bodySmall: TextStyle(fontSize: 14, color: Colors.white54,fontFamily: fontFamily),
  );

  // LIGHT THEME

  static final ThemeData light = ThemeData(
    brightness: Brightness.light,
    useMaterial3: true,
    fontFamily: fontFamily,

    scaffoldBackgroundColor: Colors.white,

    colorScheme: const ColorScheme.light(
      primary: Colors.blue,
      secondary: Colors.blueAccent,
      background: Colors.white,
      surface: Colors.white,
      onPrimary: Colors.white,
      onSecondary: Colors.white,
      onSurface: Colors.black,
      onBackground: Colors.black,
    ),

    textTheme: textThemeLight,

    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.blue,
      foregroundColor: Colors.white,
      centerTitle: true,
      elevation: 0,
    ),

    iconTheme: const IconThemeData(color: Colors.black),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(Colors.blue),
        foregroundColor: WidgetStatePropertyAll(Colors.white),
        padding: WidgetStatePropertyAll(EdgeInsets.symmetric(vertical: 12, horizontal: 20)),
        shape: WidgetStatePropertyAll(RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))
        )),
      ),
    ),

    inputDecorationTheme: const InputDecorationTheme(
      filled: true,
      fillColor: Color(0xFFF2F2F2),
      border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey),
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.blue, width: 2),
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
    ),

    cardTheme: const CardThemeData(
      color: Colors.white,
      elevation: 2,
      margin: EdgeInsets.all(10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12))),
    ),

    datePickerTheme: const DatePickerThemeData(
      backgroundColor: Colors.white,
      headerBackgroundColor: Colors.blue,
      headerForegroundColor: Colors.white,
      todayBackgroundColor: WidgetStatePropertyAll(Colors.blue),
      todayForegroundColor: WidgetStatePropertyAll(Colors.white),
    ),

    timePickerTheme: const TimePickerThemeData(
      backgroundColor: Colors.white,
      dialBackgroundColor: Color(0xFFE4E4E4),
      dialHandColor: Colors.blue,
      hourMinuteColor: Colors.blue,
      hourMinuteTextColor: Colors.white,
    ),

    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
      selectedItemColor: Colors.blue,
      unselectedItemColor: Colors.grey,
    ),
  );


  // DARK THEME

  static final ThemeData dark = ThemeData(
    brightness: Brightness.dark,
    useMaterial3: true,
    fontFamily: fontFamily,

    scaffoldBackgroundColor: const Color(0xFF121212),

    colorScheme: const ColorScheme.dark(
      primary: Colors.deepPurple,
      secondary: Colors.deepPurpleAccent,
      background: Color(0xFF121212),
      surface: Color(0xFF1F1F1F),
      onPrimary: Colors.white,
      onSecondary: Colors.white,
      onSurface: Colors.white,
      onBackground: Colors.white,
    ),

    textTheme: textThemeDark,

    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.deepPurple,
      foregroundColor: Colors.white,
      centerTitle: true,
      elevation: 0,
    ),

    iconTheme: const IconThemeData(color: Colors.white),

    elevatedButtonTheme: const ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(Colors.deepPurple),
        foregroundColor: WidgetStatePropertyAll(Colors.white),
      ),
    ),

    inputDecorationTheme: const InputDecorationTheme(
      filled: true,
      fillColor: Color(0xFF1F1F1F),
      border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.white38),
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.deepPurple, width: 2),
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
    ),

    cardTheme: const CardThemeData(
      color: Color(0xFF1E1E1E),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12))),
    ),

    datePickerTheme: const DatePickerThemeData(
      backgroundColor: Color(0xFF1E1E1E),
      headerBackgroundColor: Colors.deepPurple,
      headerForegroundColor: Colors.white,
      todayBackgroundColor: WidgetStatePropertyAll(Colors.deepPurple),
      todayForegroundColor: WidgetStatePropertyAll(Colors.white),
    ),

    timePickerTheme: const TimePickerThemeData(
      backgroundColor: Color(0xFF1E1E1E),
      dialBackgroundColor: Color(0xFF333333),
      dialHandColor: Colors.deepPurple,
      hourMinuteColor: Colors.deepPurple,
      hourMinuteTextColor: Colors.white,
    ),

    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Color(0xFF1F1F1F),
      selectedItemColor: Colors.deepPurpleAccent,
      unselectedItemColor: Colors.white38,
    ),
  );
}