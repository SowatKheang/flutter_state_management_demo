
import 'package:bloc/bloc.dart';
import 'package:using_bloc/core/helper/shared_pref_helper.dart';
import '../../../core/enum/app_enum.dart';
import 'setting_state.dart';

///
/// [SettingCubit] is a cubit class to manage the state of the screen type and orientation.
///
class SettingCubit extends Cubit<SettingState> {

  SettingCubit() : super(SettingState(pageIndex: PageName.product.index, theme: AppTheme.light.index)) {
    _loadTheme();
  }
  
  void navigate(int pageIndex) {
    emit(SettingState.navigate(pageIndex, state.theme!));
  }

  void _loadTheme() {
    int themeIndex =  SharePreferenceHelper.getInstance().getTheme();
    emit(SettingState.setTheme(state.pageIndex!, themeIndex)); // Set the loaded theme
  }

  void toggleTheme() {
    int appTheme = state.theme == AppTheme.dark.index
        ? AppTheme.light.index
        : AppTheme.dark.index;

    SharePreferenceHelper.getInstance().setTheme(appTheme);

    emit(SettingState.setTheme(state.pageIndex!, appTheme));
  }

  bool get isProductPage => state.isProductPage;


}
