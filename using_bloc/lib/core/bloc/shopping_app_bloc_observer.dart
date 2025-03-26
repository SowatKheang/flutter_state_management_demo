
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

/// 
/// [ShoppingAppBlocObserver] for the application which to observe all state changes.
/// 
class ShoppingAppBlocObserver extends BlocObserver {
  const ShoppingAppBlocObserver();

  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
    debugPrint('ON_CHANGE: ${bloc.runtimeType}');
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    debugPrint('ON_EVENT: ${bloc.runtimeType}');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    debugPrint('ON_ERROR: ${bloc.runtimeType}');
  }

}