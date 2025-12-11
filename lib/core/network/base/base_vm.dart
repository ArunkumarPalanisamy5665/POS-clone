import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:one_context/one_context.dart';

import '../../../di/app_module.dart';
import '../../../main.dart';
import '../../local_storage/preference_helper.dart';
import '../api_helper.dart';

enum ViewState { idle, loading, success, error }

class BaseVm extends ChangeNotifier {
  final apiHelper = getIt<ApiHelper>();
  final session = getIt<PreferenceHelper>();

  static BuildContext? get bContext => navigatorKey.currentContext;


  ViewState _state = ViewState.idle;

  ViewState get state => _state;

  String? errorMessage;
  bool _isDisposed = false;

  void init() {}

  void setState(ViewState newState, {String? message}) {
    _state = newState;
    errorMessage = message;
    _safeNotify();
  }

  void setIdle() => setState(ViewState.idle);

  void setLoading() => setState(ViewState.loading);

  void setSuccess() => setState(ViewState.success);

  void setError(String msg) => setState(ViewState.error, message: msg);

  void _safeNotify() {
    if (!_isDisposed) notifyListeners();
  }


  static void throwIfNoContext() {
    if (bContext == null) {
      throw Exception('Navigator context is not available');
    }
  }


  void getPop<T>([T? result]) {
    throwIfNoContext();
    GoRouter.of(bContext!).pop(result);
  }

  void getPopAndPush(
    String name, {
    Object? extra,
    Map<String, String>? params,
  }) {
    throwIfNoContext();
    GoRouter.of(bContext!).goNamed(name, extra: extra, pathParameters: params ?? {});
  }

  Future<T?> push<T>(String location, {Object? extra,}) {
    throwIfNoContext();
    return GoRouter.of(bContext!).push<T>(location, extra: extra);
  }

  Future<T?> getPushAndWait<T>(String location, {Object? extra}) async {
    throwIfNoContext();
    return GoRouter.of(bContext!).push<T>(location, extra: extra);
  }



  //read me
  /*
   final result = await vm.getPushAndWait(RouteNames.screenB,
   extra: {"id": 10},
   );
  */



  // Future<T?> getPushAndWait<T>(String location, {Object? extra}) async {
  //   final ctx = navigatorKey.currentContext;
  //   if (ctx == null) return null;
  //
  //   final completer = Completer<T?>();
  //   WidgetsBinding.instance.addPostFrameCallback((_) {
  //     completer.complete(GoRouter.of(ctx).push<T>(location, extra: extra));
  //   });
  //   return completer.future;
  // }
  //
  // void getPop<T>([T? result]) {
  //   final ctx = navigatorKey.currentContext;
  //   if (ctx == null) return;
  //   GoRouter.of(ctx).pop(result);
  // }
  //
  // Future<T?> getPopAndPush<T>(String location, {Object? extra}) async {
  //   final ctx = navigatorKey.currentContext;
  //   if (ctx == null) return null;
  //   GoRouter.of(ctx).pop();
  //   return GoRouter.of(ctx).push<T>(location, extra: extra);
  // }

  //
  // Future<dynamic> push(Route route, {dynamic arguments}) async {
  //   final navigator = navigatorKey.currentState;
  //   if (navigator == null) return arguments;
  //
  //   final result = await navigator.push(route);
  //   return result ?? arguments;
  // }
  //
  // Future<dynamic> pushAndWait(Route route, {dynamic arguments}) async {
  //   final navigator = navigatorKey.currentState;
  //   if (navigator == null) return arguments;
  //
  //   final result = await navigator.push(route);
  //   return result ?? arguments;
  // }
  //
  // void pop([dynamic result]) {
  //   final navigator = navigatorKey.currentState;
  //   if (navigator == null) return;
  //
  //   navigator.pop(result);
  // }
  //
  // Future<dynamic> popAndPush(Route route, {dynamic arguments}) async {
  //   final navigator = navigatorKey.currentState;
  //   if (navigator == null) return arguments;
  //
  //   navigator.pop(arguments);
  //   return push(route, arguments: arguments);
  // }

  @override
  void dispose() {
    _isDisposed = true;
    super.dispose();
  }
}
