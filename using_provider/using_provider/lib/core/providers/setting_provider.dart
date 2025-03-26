
import 'package:flutter/material.dart';
import 'package:using_provider/core/enums/app_enum.dart';

///
/// [SettingProvider]
///
class SettingProvider extends ChangeNotifier {

  int _pageIndex = PageEnum.product.index;

  ThemeData _appTheme = ThemeData.light();

  void navigate(int pageIndex) {
    _pageIndex = pageIndex;
    notifyListeners();
  }

  void changeTheme() {
    _appTheme = _appTheme.brightness == Brightness.light
        ? ThemeData.dark()
        : ThemeData.light();
    notifyListeners();
  }

  int get pageIndex => _pageIndex;

  ThemeData get appTheme => _appTheme;

}