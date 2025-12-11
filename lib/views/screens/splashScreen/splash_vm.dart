

import 'package:go_router/go_router.dart';
import 'package:new_hrms_flutter/core/constants/api_endpoints.dart';
import 'package:new_hrms_flutter/core/network/base/base_vm.dart';
import 'package:new_hrms_flutter/main.dart';
import '../../../core/routes/route_names.dart';


class SplashVm extends BaseVm{


  Future<void> getColorsCodeAPi() async {
    setLoading();

    try {
      final map = {};

      final result = await apiHelper.post('/${ApiEndpoints.colorCode}', data: map);
      result.fold(
            (failure) {
          final message = failure.message.isNotEmpty
              ? failure.message
              : 'Failed to fetch color codes. Please try again.';
          setError(message);
        },
            (colorResponse) {
              GoRouter.of(navigatorKey.currentState!.context).goNamed(RouteNames.login);

              // getPopAndPush(RouteNames.login);
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

}