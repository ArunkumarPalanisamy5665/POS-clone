import '../../../core/constants/app_constants.dart';

class Validators {
  // Private constructor to prevent instantiation
  Validators._();
  static String? validateLoginFields(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Enter your email";
    }
    const pattern =
        r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$";

    final regex = RegExp(pattern);

    if (!regex.hasMatch(value.trim())) {
      return "Enter a valid email";
    }

    return null;
  }

  //name validation
  static String? validateNameFields(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter your name';
    }

    String name = value.trim();

    if (name.length < 2) {
      return 'Name must be at least 2 characters';
    }

    final regex = RegExp(r"^[a-zA-Z\s\.\-]+$");

    if (!regex.hasMatch(name)) {
      return 'Name contains invalid characters';
    }

    return null;
  }


  // OTP validation
  static String? validateOTPFields(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter OTP';
    }

    String otp = value.trim();

    if (otp.length != AppConstants.otpLength) {
      return 'OTP must be ${AppConstants.otpLength} digits';
    }

    if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
      return 'OTP must contain only numbers';
    }

    return null;
  }


  // Phone number validation
  static String? validatePhoneNumberFields(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter your mobile number';
    }

    // Remove any spaces or special characters
    String cleanNumber = value.replaceAll(RegExp(r'[^\d]'), '');

    // Check if it's exactly 10 digits
    if (cleanNumber.length != AppConstants.phoneNumberLength) {
      return 'Mobile number must be ${AppConstants.phoneNumberLength} digits';
    }

    // Check if it starts with valid digits (6-9)
    if (!RegExp(r'^[6-9]').hasMatch(cleanNumber)) {
      return 'Mobile number must start with 6, 7, 8, or 9';
    }

    // Check for invalid patterns (all same digits)
    if (RegExp(r'^(\d)\1{9}$').hasMatch(cleanNumber)) {
      return 'Please enter a valid mobile number';
    }

    // Check for sequential numbers (like 1234567890)
    bool isSequential = true;
    for (int i = 1; i < cleanNumber.length; i++) {
      if (int.parse(cleanNumber[i]) !=
          (int.parse(cleanNumber[i - 1]) + 1) % 10) {
        isSequential = false;
        break;
      }
    }
    if (isSequential) {
      return 'Please enter a valid mobile number';
    }

    return null;
  }

  static String? validatePasswordFields(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter your password';
    }

    String password = value.trim();

    // Minimum length
    if (password.length < 6) {
      return 'Password must be at least 8 characters';
    }

    // // Must contain uppercase
    // if (!RegExp(r'[A-Z]').hasMatch(password)) {
    //   return 'Password must contain at least one uppercase letter';
    // }
    //
    // // Must contain lowercase
    // if (!RegExp(r'[a-z]').hasMatch(password)) {
    //   return 'Password must contain at least one lowercase letter';
    // }
    //
    // // Must contain number
    // if (!RegExp(r'\d').hasMatch(password)) {
    //   return 'Password must contain at least one number';
    // }

    // Must contain special character
    // if (!RegExp(r'[!@#\$%^&*(),.?":{}|<>]').hasMatch(password)) {
    //   return 'Password must contain at least one special character';
    // }

    // No spaces allowed
    if (password.contains(' ')) {
      return 'Password cannot contain spaces';
    }

    return null;
  }

}
