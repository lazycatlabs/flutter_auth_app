class ListAPI {
  ListAPI._(); // coverage:ignore-line

  /// Auth
  static const String generalToken = '/api/auth/general';
  static const String refreshToken = '/api/auth/refresh';
  static const String user = '/api/user';
  static const String login = '/api/auth/login-email';
  static const String logout = '/api/auth/logout';

  /// User
  static const String users = '/users';
}
