class TokenStore {
  String? _token;

  /// Get current in-memory token (fast access for interceptor)
  String? get token => _token;

  /// Set token after login / app restore
  void set(String token) {
    _token = token;
  }

  /// Clear token on logout
  void clear() {
    _token = null;
  }

  /// Optional helper
  bool get hasToken => _token != null && _token!.isNotEmpty;
}
