
import 'package:equatable/equatable.dart';
import '../../../core/enum/app_enum.dart';

///
/// [SettingState]
///
class SettingState extends Equatable {
  
  final int? pageIndex;
  final int? theme;

  const SettingState({
    this.pageIndex,
    this.theme,
  });

  const SettingState.navigate(int pageIndex, int theme): this(pageIndex: pageIndex, theme: theme);

  const SettingState.setTheme(int pageIndex, int theme): this(pageIndex: pageIndex, theme: theme);

  bool get isProductPage => pageIndex == PageName.product.index;

  bool get isDarkTheme => theme == AppTheme.dark.index;

  @override
  List<Object> get props => [ pageIndex!, theme! ];
}