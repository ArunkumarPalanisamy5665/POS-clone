

import 'package:get_it/get_it.dart';
import 'package:new_hrms_flutter/core/local_storage/preference_helper.dart';
import 'package:new_hrms_flutter/di/view_modle_di.dart';

import '../core/network/api_helper.dart';
import '../domain/repository/user_respository.dart';

final getIt = GetIt.instance;

void setupLocator() {

  getIt.registerLazySingleton<ApiHelper>(() => ApiHelper());

  getIt.registerSingleton<PreferenceHelper>(PreferenceHelper());

  registerViewModelModule();



  // Repositories

  getIt.registerLazySingleton<UserRepository>(() => UserRepository(getIt<ApiHelper>()),);
  //
  // getIt.registerLazySingleton<ProductRepository>(
  //       () => ProductRepository(getIt<ApiHelper>()),
  // );
  //
  // getIt.registerLazySingleton<OrderRepository>(
  //       () => OrderRepository(getIt<ApiHelper>()),
  // );
}