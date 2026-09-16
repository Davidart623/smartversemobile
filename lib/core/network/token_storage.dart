class TokenStorage {
  TokenStorage._();
  static final TokenStorage instance = TokenStorage._();

  String? _accessToken;
  String? _refreshToken;

  String? get accessToken => _accessToken;

  void setTokens({required String accessToken, required String refreshToken}) {
    _accessToken = accessToken;
    _refreshToken = refreshToken;
  }

  void clear() {
    _accessToken = null;
    _refreshToken = null;
  }
}