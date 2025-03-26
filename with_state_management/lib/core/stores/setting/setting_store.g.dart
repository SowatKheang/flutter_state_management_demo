// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'setting_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SettingStore on SettingStoreBase, Store {
  Computed<int>? _$pageIndexComputed;

  @override
  int get pageIndex =>
      (_$pageIndexComputed ??= Computed<int>(() => super.pageIndex,
              name: 'SettingStoreBase.pageIndex'))
          .value;
  Computed<bool>? _$isHomePageComputed;

  @override
  bool get isHomePage =>
      (_$isHomePageComputed ??= Computed<bool>(() => super.isHomePage,
              name: 'SettingStoreBase.isHomePage'))
          .value;
  Computed<ThemeData>? _$appThemeComputed;

  @override
  ThemeData get appTheme =>
      (_$appThemeComputed ??= Computed<ThemeData>(() => super.appTheme,
              name: 'SettingStoreBase.appTheme'))
          .value;
  Computed<bool>? _$isDarkComputed;

  @override
  bool get isDark => (_$isDarkComputed ??=
          Computed<bool>(() => super.isDark, name: 'SettingStoreBase.isDark'))
      .value;

  late final _$_pageIndexAtom =
      Atom(name: 'SettingStoreBase._pageIndex', context: context);

  @override
  int get _pageIndex {
    _$_pageIndexAtom.reportRead();
    return super._pageIndex;
  }

  @override
  set _pageIndex(int value) {
    _$_pageIndexAtom.reportWrite(value, super._pageIndex, () {
      super._pageIndex = value;
    });
  }

  late final _$_appThemeAtom =
      Atom(name: 'SettingStoreBase._appTheme', context: context);

  @override
  ThemeData get _appTheme {
    _$_appThemeAtom.reportRead();
    return super._appTheme;
  }

  @override
  set _appTheme(ThemeData value) {
    _$_appThemeAtom.reportWrite(value, super._appTheme, () {
      super._appTheme = value;
    });
  }

  late final _$SettingStoreBaseActionController =
      ActionController(name: 'SettingStoreBase', context: context);

  @override
  void navigateTo(int page) {
    final _$actionInfo = _$SettingStoreBaseActionController.startAction(
        name: 'SettingStoreBase.navigateTo');
    try {
      return super.navigateTo(page);
    } finally {
      _$SettingStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeTheme() {
    final _$actionInfo = _$SettingStoreBaseActionController.startAction(
        name: 'SettingStoreBase.changeTheme');
    try {
      return super.changeTheme();
    } finally {
      _$SettingStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
pageIndex: ${pageIndex},
isHomePage: ${isHomePage},
appTheme: ${appTheme},
isDark: ${isDark}
    ''';
  }
}
