
// ignore_for_file: constant_identifier_names
import 'package:shared_preferences/shared_preferences.dart';
import 'package:using_bloc/core/enum/app_enum.dart';

///
/// [SharePreferenceHelper]
///
class SharePreferenceHelper {
  
  SharedPreferences pref;

  static const String LANGUAGE = "language";
  static const String THEME = "theme";

  SharePreferenceHelper._(this.pref);

  static SharePreferenceHelper? _instance;
  static SharePreferenceHelper getInstance() => _instance!;

  static void init(SharedPreferences pref) => _instance = SharePreferenceHelper._(pref);

  String? getKey(String key) => pref.getString(key);

  void addKey(String key, String value) async => await pref.setString(key, value);

  void removeKey(String key) async => await pref.remove(key);

  bool getBooleanKey(String key) => pref.getBool(key) ?? false;

  void addBooleanKey(String key, bool value) async => await pref.setBool(key, value);

  void setTheme(int theme) async =>  pref.setInt(THEME, theme);

  int getTheme() => pref.getInt(THEME) ?? AppTheme.light.index;

  bool? isDarkTheme() => pref.getBool(THEME);

}