import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'app_state_notifier.dart';

class AppStateProvider extends InheritedWidget {
  final AppStateNotifier state;

  const AppStateProvider({
    super.key,
    required this.state,
    required Widget child,
  }) : super(child: child);

  static AppStateNotifier of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<AppStateProvider>()!.state;
  }

  @override
  bool updateShouldNotify(AppStateProvider oldWidget) {
    return true;
  }
}
