import 'package:shared_preferences/shared_preferences.dart';

enum ActiveTheme {
  light("light"),
  dark("dark"),
  system("system");

  final String description;

  const ActiveTheme(this.description);
}

class PrefManager {
  String kIsLogin = "isLogin";
  String kToken = "token";
  String kText = "text";
  String kColor = "color";
  String kIcon = "icon";
  String kUser = "user";
  String kFCM = "fcm";
  String kLanguage = "language";
  String kLocale = "locale";
  String kTheme = "theme";

  /// Light, Dark ,System

  SharedPreferences preferences;

  PrefManager(this.preferences);

  //for Bloc.Bloc.login
  set isLogin(bool value) => preferences.setBool(kIsLogin, value);

  bool get isLogin => preferences.getBool(kIsLogin) ?? false;

  set token(String? value) => preferences.setString(kToken, value ?? "");

  String? get token => preferences.getString(kToken);

  set fcmToken(String? value) => preferences.setString(kFCM, value ?? "");

  String? get fcmToken => preferences.getString(kFCM);

  set user(String? value) => preferences.setString(kUser, value ?? "");

  String? get user => preferences.getString(kUser);

  set text(String? value) => preferences.setString(kText, value ?? "");

  String get text => preferences.getString(kText) ?? "";

  set color(String? value) => preferences.setString(kColor, value ?? "");

  String? get color => preferences.getString(kColor);

  set icon(String? value) => preferences.setString(kIcon, value ?? "");

  String? get icon => preferences.getString(kIcon);

  /// Default locale set to English
  set locale(String? value) => preferences.setString(kLocale, value ?? "en");

  String get locale => preferences.getString(kLocale) ?? "en";

  /// Default locale set to English
  set theme(String? value) =>
      preferences.setString(kTheme, value ?? ActiveTheme.system.description);

  String get theme =>
      preferences.getString(kTheme) ?? ActiveTheme.system.description;

  void logout() => preferences.clear();
}
