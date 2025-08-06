class Images {
  Images._();

  static String icLauncher =
      const String.fromEnvironment('ENV', defaultValue: 'staging') == 'staging'
          ? 'assets/images/ic_launcher_stg.png'
          : 'assets/images/ic_launcher.png';

  static String icLauncherDark =
      const String.fromEnvironment('ENV', defaultValue: 'staging') == 'staging'
          ? 'assets/images/ic_launcher_stg_dark.png'
          : 'assets/images/ic_launcher_dark.png';

  static String icLogo =
      const String.fromEnvironment('ENV', defaultValue: 'staging') == 'staging'
          ? 'assets/images/ic_logo_stg.png'
          : 'assets/images/ic_logo.png';
}
