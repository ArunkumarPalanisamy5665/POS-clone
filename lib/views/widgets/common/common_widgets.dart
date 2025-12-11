import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:one_context/one_context.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

import '../../../core/constants/app_colors.dart';

class CommonWidgets {
  final navigatorKey = GlobalKey<NavigatorState>();
  final primaryColor = const Color(0xFF0A15D5);
  final secondaryColor = const Color(0xFFFE9C45);
  static OverlayEntry? _overlayEntry;

  Map? keywords;

  setItem(String key, String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
  }

  specialCharacterValidations(value) {
    RegExp regex = RegExp(r'^[a-zA-Z]+$');
    if (!regex.hasMatch(value)) {
      print("true");
      return 'Special characters are not allowed';
    }
  }

  saveKeywords() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    keywords = jsonDecode(prefs.getString('keywords')!);
    print("keywords: $keywords");
  }

  showAlertDialog(String title, String message) async {
    var result = await OneContext().showDialog<String>(
      // Don't need context to show alertDialog
      builder: (context) => AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: <Widget>[
          TextButton(
            child: const Text("OK"),
            onPressed: () => OneContext().popDialog('ok'),
          ),
        ],
      ),
    );
    print(result);
  }

  inputDecoration(String label) {
    return InputDecoration(
      labelText: label,
      labelStyle: const TextStyle(color: Colors.black),
      border: InputBorder.none,
      enabledBorder: const UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.black38),
      ),
      focusedErrorBorder: const UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.red),
      ),
      errorBorder: const UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.red),
      ),
      focusedBorder: const UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.black38),
      ),
      suffixIcon: Icon(
        Icons.arrow_forward_ios,
        color: AppColors.primaryColor,
        size: 18,
      ),
    );
  }

  setColors() async {
    print('Setcolor called');
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? pC = prefs.getString('primaryColor');
    String? sC = prefs.getString('secondryColor');
    if (pC != null && sC != null) {
      pC = pC.replaceAll('#', '');
      sC = sC.replaceAll('#', '');
      // AppColors.primaryColor = Color(int.parse('0xFF$pC'));
      // AppColors.secondaryColor = Color(int.parse('0xFF$sC'));
      SystemChrome.setEnabledSystemUIMode(
        SystemUiMode.manual,
        overlays: SystemUiOverlay.values,
      );
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarColor: AppColors.primaryColor,
        ), //or set color with: Color(0xFF0000FF)
      );
    }
  }

  static String formatDateTime(String isoString, {bool isDate = true}) {
    try {
      DateTime dateTime = DateTime.parse(isoString).toLocal();

      if (isDate) {
        return DateFormat("MMM, d").format(dateTime);
      } else {
        return DateFormat("E, h:mm a").format(dateTime);
      }
    } catch (e) {
      DateTime now = DateTime.now();
      return isDate
          ? DateFormat("MMM, d").format(now)
          : DateFormat("E, h:mm a").format(now);
    }
  }

  /// This provides a standard way to show SnackBar messages across the app
  static void showSnackBarToast(
    BuildContext context,
    String message, {
    Duration duration = const Duration(seconds: 2),
    Color? backgroundColor,
    Color textColor = Colors.white,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message, style: TextStyle(color: textColor)),
        duration: duration,
        backgroundColor:
            backgroundColor ?? AppColors.grey ?? Theme.of(context).primaryColor,
      ),
    );
  }

  static String capitalizeFirstLetter(String text) {
    if (text.isEmpty) return '';
    return text[0].toUpperCase() + text.substring(1);
  }

  static String formatDob(String? isoDate) {
    if (isoDate == null || isoDate.trim().isEmpty) return '';

    final invalidPlaceholders = ['N/A', 'null', '0000-00-00'];
    if (invalidPlaceholders.contains(isoDate.trim())) return '';

    try {
      final dateTime = DateTime.parse(isoDate);
      return DateFormat('yyyy-MM-dd').format(dateTime);
    } catch (e) {
      return '';
    }
  }

  static String formatChatTime(String isoTime) {
    try {
      final DateTime utcTime = DateTime.parse(isoTime);
      final DateTime localTime = utcTime.toLocal();

      final DateTime now = DateTime.now();
      final DateTime today = DateTime(now.year, now.month, now.day);
      final DateTime messageDay = DateTime(
        localTime.year,
        localTime.month,
        localTime.day,
      );

      final difference = today.difference(messageDay).inDays;

      if (difference == 0) {
        // Today
        return DateFormat('hh:mm:ss a').format(localTime); // e.g., "09:22 PM"
      } else if (difference == 1) {
        // Yesterday
        return "Yesterday, ${DateFormat('hh:mm:ss a').format(localTime)}";
      } else {
        // Older messages
        return DateFormat('dd MMM yyyy, hh:mm:ss a').format(localTime);
      }
    } catch (e) {
      return "";
    }
  }

  static String formatDateOrTime(String isoDate, {bool isTime = false}) {
    DateTime dateTime = DateTime.parse(isoDate).toLocal();

    if (isTime) {
      int hour = dateTime.hour > 12 ? dateTime.hour - 12 : dateTime.hour;
      String period = dateTime.hour >= 12 ? "PM" : "AM";
      String formattedTime =
          "${hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')}:${dateTime.second.toString().padLeft(2, '0')} $period";
      return formattedTime;
    } else {
      String formattedDate =
          "${dateTime.day.toString().padLeft(2, '0')}-${dateTime.month.toString().padLeft(2, '0')}-${dateTime.year}";
      return formattedDate;
    }
  }

  formatedDateString(String dateStr) {
    if (dateStr == 'null' || dateStr.isEmpty) {
      dateStr = DateTime.now().toString();
      String date = DateFormat('dd MMM yyyy').format(DateTime.parse(dateStr));
      return date;
    }
    if (DateTime.tryParse(dateStr) != null) {
      String date = DateFormat('dd MMM yyyy').format(DateTime.parse(dateStr));
      return date;
    } else {
      DateTime a = DateFormat('MM/d/yyyy').parse(dateStr);
      if (DateTime.tryParse(a.toString()) != null) {
        String date1 = DateFormat(
          'dd MMM yyyy',
        ).format(DateTime.parse(a.toString()));
        return date1;
      } else {
        return DateTime.now().toString();
      }
    }
  }

  DateTime? stringToDate(String dateStr) {
    try {
      if (dateStr.isEmpty || dateStr == null) {
        return null!;
      } else if (DateTime.tryParse(dateStr) != null) {
        DateTime date = DateTime.parse(dateStr);
        return date;
      } else {
        DateTime a = DateFormat('dd/MM/yyyy').parse(dateStr);
        if (DateTime.tryParse(a.toString()) != null) {
          DateTime date1 = DateTime.parse(a.toString());
          return date1;
        } else {
          return DateTime.now();
        }
      }
    } catch (err) {
      print(err);
      return null;
    }
  }

  DateTime? stringToDate2(String dateStr) {
    try {
      if (dateStr.isEmpty || dateStr == null) {
        return null!;
      } else if (DateTime.tryParse(dateStr) != null) {
        DateTime date = DateTime.parse(dateStr);
        return date;
      } else {
        DateTime a = DateFormat('MM/d/yyyy').parse(dateStr);
        if (DateTime.tryParse(a.toString()) != null) {
          DateTime date1 = DateTime.parse(a.toString());
          return date1;
        } else {
          return DateTime.now();
        }
      }
    } catch (err) {
      print(err);
      return null;
    }
  }

  DateTime? stringToDate1(String dateStr) {
    try {
      if (dateStr.isEmpty || dateStr == null) {
        return null!;
      } else if (DateTime.tryParse(dateStr) != null) {
        DateTime date = DateTime.parse(dateStr);
        return date;
      } else {
        var da = dateStr.replaceAll(',', '');
        da = '${da.split(' ')[1]}-${da.split(' ')[0]}-${da.split(' ')[2]}';
        DateTime tempDate = DateFormat("dd-MMM-yy").parse(da);
        if (DateTime.tryParse(tempDate.toString()) != null) {
          DateTime date1 = DateTime.parse(tempDate.toString());
          return date1;
        } else {
          return DateTime.now();
        }
      }
    } catch (err) {
      print(err);
      return null;
    }
  }

  String translate(String key) {
    if (keywords != null &&
        keywords!.containsKey(key) &&
        keywords![key] != null &&
        keywords?[key] != '') {
      return keywords![key];
    } else {
      return key.split('_').join(' ').toString().capitalizeFirstofEach;
    }
  }

  static void _showBlurToast({
    required BuildContext context,
    required Color color,
    required IconData icon,
    required String title,
    required String message,
  }) {
    // Remove any existing toast
    _overlayEntry?.remove();

    _overlayEntry = OverlayEntry(
      builder: (context) => Stack(
        children: [
          // Background Blur
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
              child: Container(color: Colors.black.withOpacity(0.25)),
            ),
          ),

          // Toast Message
          Positioned(
            bottom: 40,
            left: 20,
            right: 20,
            child: Material(
              color: Colors.transparent,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 14,
                  horizontal: 16,
                ),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.6),
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(color: Colors.white.withOpacity(0.15)),
                ),
                child: Row(
                  children: [
                    Icon(icon, color: color, size: 26),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            title,
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            message,
                            style: const TextStyle(
                              color: Colors.white70,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );

    // Insert overlay
    Overlay.of(context).insert(_overlayEntry!);

    // Auto dismiss after 2 seconds
    Future.delayed(const Duration(seconds: 2), () {
      _overlayEntry?.remove();
      _overlayEntry = null;
    });
  }

  // Success Toast
  static void showSuccessToast(
    BuildContext context,
    String title,
    String message,
  ) {
    _showBlurToast(
      context: context,
      color: Colors.green,
      icon: Icons.check_circle,
      title: title,
      message: message,
    );
  }

  // Error Toast
  static void showErrorToast(
    BuildContext context,
    String title,
    String message,
  ) {
    _showBlurToast(
      context: context,
      color: Colors.red,
      icon: Icons.error,
      title: title,
      message: message,
    );
  }
}

extension CapExtension on String {
  String get inCaps =>
      isNotEmpty ? '${this[0].toUpperCase()}${substring(1)}' : "-";

  String get allInCaps => toUpperCase();

  String get capitalizeFirstofEach =>
      split(" ").map((str) => str.inCaps).join(" ");
}
