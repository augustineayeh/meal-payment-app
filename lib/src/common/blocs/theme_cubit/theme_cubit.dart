import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'theme_state.dart';

class ThemeCubit extends HydratedCubit<ThemeState> {
  ThemeCubit() : super(const ThemeState());

  @override
  ThemeState? fromJson(Map<String, dynamic> json) {
    String theme = json['themeMode'];
    AppThemeMode themeMode = _mapStringToThemeMode(theme);
    return state.copyWith(themeMode: themeMode);
  }

  @override
  Map<String, dynamic>? toJson(ThemeState state) {
    Map<String, dynamic> data = {};
    String theme = describeEnum(state.themeMode);
    data['themeMode'] = theme;
    return data;
  }

  AppThemeMode _mapStringToThemeMode(String themeMode) {
    switch (themeMode) {
      case 'darkMode':
        return AppThemeMode.darkMode;
      case 'lightMode':
        return AppThemeMode.lightMode;
      default:
        return AppThemeMode.darkMode;
    }
  }

  void onThemeModeChanged() {
    state.themeMode == AppThemeMode.darkMode
        ? emit(state.copyWith(themeMode: AppThemeMode.lightMode))
        : emit(state.copyWith(themeMode: AppThemeMode.darkMode));
  }
}
