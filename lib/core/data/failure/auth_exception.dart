class AuthException implements Exception {
  final String? title;
  final String? message;

  AuthException({this.title, this.message});
}
