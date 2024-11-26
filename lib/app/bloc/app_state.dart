part of 'app_cubit.dart';

class AppState extends Equatable {
  final ThemeMode themeMode;
  final String languageCode;

  const AppState({required this.themeMode,required this.languageCode});

  @override
  // TODO: implement props
  List<Object?> get props => [languageCode, themeMode];
}

// final class AppInitial extends AppState {
//   @override
//   List<Object> get props => [];
// }
//
// class LanguageState extends AppState {
//
//
//   const LanguageState(this.languageCode);
//
//   @override
//   // TODO: implement props
//   List<Object?> get props =>
// }
//
// class ThemeModeState extends AppState {
//
//
//   const ThemeModeState(this.themeMode);
//
//   @override
//   // TODO: implement props
//   List<Object?> get props => [themeMode];
// }
