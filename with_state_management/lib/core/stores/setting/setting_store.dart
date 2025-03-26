
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:with_state_management/core/enums/app_enum.dart';

part 'setting_store.g.dart';

class SettingStore = SettingStoreBase with _$SettingStore;

abstract class SettingStoreBase with Store {
  
  @observable
  int _pageIndex = PageEnum.product.index;
  
  @observable
  ThemeData _appTheme = ThemeData.light();

  @action
  void navigateTo(int page) {
    _pageIndex = page;
    debugPrint('NAVIGATE_TO_CALLED: pageIndex: $_pageIndex');
  }

  @action
  void changeTheme() {
    _appTheme = _appTheme.brightness == Brightness.light
        ? ThemeData.dark()
        : ThemeData.light();
  }

  @computed
  int get pageIndex => PageEnum.values[_pageIndex].index;

  @computed
  bool get isHomePage => pageIndex == PageEnum.product.index;

  @computed
  ThemeData get appTheme => _appTheme;

  @computed
  bool get isDark => _appTheme == ThemeData.dark();

}