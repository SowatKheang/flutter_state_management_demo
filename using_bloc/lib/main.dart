
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'core/bloc/shopping_app_bloc_observer.dart';
import 'core/helper/shared_pref_helper.dart';
import 'shopping_app.dart';

void main() {
  runZonedGuarded(() async {
    
    // Ensure the binding is initialized
    WidgetsFlutterBinding.ensureInitialized();
    
    // Initialize the shared preferences
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    SharePreferenceHelper.init(sharedPreferences);
    
    // Bloc observer
    Bloc.observer = const ShoppingAppBlocObserver();
    
    runApp(const ShoppingApp());

  }, (error, stackTrace) {
    debugPrint('runZonedGuarded: $error');
  });
}