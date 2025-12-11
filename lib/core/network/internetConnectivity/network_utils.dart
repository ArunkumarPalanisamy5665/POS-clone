import 'package:http/http.dart' as http;
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

class NetworkUtils {

  // 1) INTERNET AVAILABLE? (Fast Check)
  static Future<bool> isAvailable() async {
    try {
      return await InternetConnection().hasInternetAccess;
    } catch (_) {
      return false;
    }
  }


  // 2) INTERNET SPEED ESTIMATE (Uses a small file download to estimate)
  static Future<double> checkConnectivityHigh() async {
    final url = Uri.parse(
        "https://www.google.com/images/branding/googlelogo/2x/googlelogo_color_92x30dp.png");

    final stopwatch = Stopwatch()..start();
    const timeoutDuration = Duration(seconds: 5); // Increased timeout for reliability

    try {
      final response = await http.get(url).timeout(timeoutDuration);
      stopwatch.stop();

      if (response.statusCode == 200) {
        final bytes = response.bodyBytes.length;
        final seconds = stopwatch.elapsedMilliseconds / 1000.0; // Use 1000.0 for float result

        if (seconds > 0) {
          // 1. Calculate Total Bits: bytes * 8
          // 2. Convert Bits to Megabits (Mb): (bytes * 8) / 1,000,000
          final double megabits = (bytes * 8) / 1000000.0;

          // 3. Calculate Megabits per second (Mbps): Mb / seconds
          return megabits / seconds;
        }
      }
    } catch (e) {
      // You can log the error (e.g., Timeout, SocketException) here if needed.
    }

    return 0.0;
  }
}