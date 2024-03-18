part of 'theme_cubit.dart';

final class ThemeInitial extends ThemeState {}

class ThemeState extends Equatable {
  final AppThemeMode themeMode;
  const ThemeState({
    this.themeMode = AppThemeMode.lightMode,
  });

  ThemeState copyWith({AppThemeMode? themeMode}) {
    return ThemeState(themeMode: themeMode ?? this.themeMode);
  }

  @override
  List<Object> get props => [themeMode];
}

enum AppThemeMode {
  darkMode,
  lightMode,
}
