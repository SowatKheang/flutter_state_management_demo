// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:using_bloc/core/enum/app_enum.dart';
import 'package:using_bloc/core/helper/shared_pref_helper.dart';
import 'package:using_bloc/modules/setting/bloc/setting_cubit.dart';

class MockSharedPreferences extends Mock implements SharedPreferences {}

void main() {
  late SettingCubit settingCubit;
  late MockSharedPreferences mockSharedPreferences;

  setUpAll(() {
    debugPrint('🛠️ Setting up the test suite...');
  });

  setUp(() {
    debugPrint('\n🔧 Running setUp...');
    mockSharedPreferences = MockSharedPreferences();
    SharePreferenceHelper.init(mockSharedPreferences);
    settingCubit = SettingCubit();
  });

  tearDown(() {
    debugPrint('✅ Test completed.\n');
  });

  group('🧪 SettingCubit Tests', () {
    test('1️⃣ Initial state is correct', () {
      debugPrint('➡️ Simulating initial theme from SharedPreferences...');
      when(mockSharedPreferences.getInt(SharePreferenceHelper.THEME)).thenReturn(AppTheme.light.index);

      debugPrint('🔍 Verifying initial pageIndex and theme...');
      expect(settingCubit.state.pageIndex, PageName.product.index);
      expect(settingCubit.state.theme, AppTheme.light.index);
    });

    test('2️⃣ navigate() should emit new state with correct pageIndex', () {
      debugPrint('➡️ Calling navigate() with PageName.cart.index...');
      settingCubit.navigate(PageName.cart.index);

      debugPrint('🔍 Verifying updated state...');
      expect(settingCubit.state.pageIndex, PageName.cart.index);
      expect(settingCubit.state.theme, AppTheme.light.index);
    });

    test('3️⃣ loadTheme() should load the theme from shared preferences', () {
      debugPrint('➡️ Mocking SharedPreferences to return AppTheme.dark...');
      when(mockSharedPreferences.getInt(SharePreferenceHelper.THEME)).thenReturn(AppTheme.dark.index);

      debugPrint('🔄 Reinitializing SettingCubit to trigger _loadTheme()...');
      settingCubit = SettingCubit();

      debugPrint('🔍 Verifying that the theme is loaded as dark...');
      expect(settingCubit.state.theme, AppTheme.dark.index);
    });
  });
}
