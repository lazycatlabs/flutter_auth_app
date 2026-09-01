class Images {
  Images._();

  static const String icLauncher =
      String.fromEnvironment('ENV', defaultValue: 'staging') == 'staging'
      ? 'assets/images/ic_launcher_stg.png'
      : 'assets/images/ic_launcher.png';

  static const String icLauncherDark =
      String.fromEnvironment('ENV', defaultValue: 'staging') == 'staging'
      ? 'assets/images/ic_launcher_stg_dark.png'
      : 'assets/images/ic_launcher_dark.png';

  static const String icLogo =
      String.fromEnvironment('ENV', defaultValue: 'staging') == 'staging'
      ? 'assets/images/ic_logo_stg.png'
      : 'assets/images/ic_logo.png';
}
