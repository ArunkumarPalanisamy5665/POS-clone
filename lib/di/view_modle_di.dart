import 'package:get_it/get_it.dart';
import 'package:new_hrms_flutter/views/screens/splashScreen/splash_vm.dart';

import '../views/screens/auth/login/login_vm.dart';
import '../views/screens/auth/register/register_vm.dart';

final getIt = GetIt.instance;

void registerViewModelModule() {
  getIt.registerFactory<SplashVm>(() => SplashVm());
  getIt.registerFactory<LoginVm>(() => LoginVm());
  getIt.registerFactory<RegisterVm>(() => RegisterVm());
}