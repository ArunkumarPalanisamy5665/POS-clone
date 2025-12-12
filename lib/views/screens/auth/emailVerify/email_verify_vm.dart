import 'package:flutter/material.dart';
import 'package:new_hrms_flutter/core/constants/api_endpoints.dart';
import 'package:new_hrms_flutter/core/network/base/base_vm.dart';
import 'package:new_hrms_flutter/views/widgets/common/common_widgets.dart';

import '../../../../core/local_storage/preference_helper.dart';
import '../../../../core/routes/route_names.dart';
import '../../../../domain/models/login_user_model.dart';

class EmailVerifyVm extends BaseVm {

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final emailNode = FocusNode();
  final passwordNode = FocusNode();

  bool isLoading = false;
  bool isButtonEnabled = false;

  String emailError = '';
  String passwordError = '';

  EmailVerifyVm() {
    emailController.addListener(_validateForm);
    passwordController.addListener(_validateForm);
  }

  void _validateForm() {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    emailError = validateEmail(email) ?? '';
    passwordError = validatePassword(password) ?? '';

    isButtonEnabled =
        emailError.isEmpty &&
            passwordError.isEmpty &&
            email.isNotEmpty &&
            password.isNotEmpty;

    notifyListeners();
  }

  String? validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Email is required";
    }

    final emailRegex = RegExp(r"^[^@]+@[^@]+\.[^@]+$");
    if (!emailRegex.hasMatch(value.trim())) {
      return "Enter a valid email address";
    }

    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Password is required";
    }

    if (value.trim().length < 6) {
      return "Password must be at least 6 characters";
    }

    return null;
  }

  Future<void> getLoginAPi(BuildContext context) async {
    setLoading();

    try {
      final map = {
        'username': emailController.text.trim(),
        'password': passwordController.text.trim(),
        'device_id': '1234567890',
        'domain': 'bala'
      };

      final result = await apiHelper.post('/${ApiEndpoints.login}', data: map,);

      result.fold(
            (failure) {

          final message = failure.message.isNotEmpty
              ? failure.message
              : 'Login failed. Please try again.';

          CommonWidgets.showErrorToast(context, 'Error', message);

          setError(message);
        },
            (response) async {
          final user = LoginUserModel.fromJson(response);
          await PreferenceHelper.saveModel(PreferenceHelper.userData, user);
          await PreferenceHelper.saveString(PreferenceHelper.accessToken, user.user?.uniqueCode??'');
          getPopAndPush(RouteNames.home);

          setSuccess();
        },
      );
    } catch (e) {
      setError("Unexpected error: $e");
    }
  }

  Future<void> getColorsCodeAPi() async {
    setLoading();

    try {
      final map = {};

      final result = await apiHelper.post('/${ApiEndpoints.colorCode}', data: map);
      result.fold((failure) {
        final message = failure.message.isNotEmpty
            ? failure.message
            : 'Failed to fetch color codes. Please try again.';
        setError(message);
      }, (colorResponse) {
        setSuccess();
      },
      );
    } catch (e) {
      setError("An unexpected error occurred: $e");
    }
  }

  Future<void> getLanguageAPi() async {
    setLoading();

    try {
      final map = {'code': 'en'};
      final result = await apiHelper.post(ApiEndpoints.getLanguageList, data: map);
      result.fold(
            (failure) {
          final message = failure.message.isNotEmpty
              ? failure.message
              : 'Failed to resend OTP. Please try again.';
          setError(message);
        },
            (otpResponse) {
          setSuccess();
        },
      );
    } catch (e) {
      setError("An unexpected error occurred: $e");
    }
  }


  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}


