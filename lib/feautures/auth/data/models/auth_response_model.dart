class AuthResponseModel {
  final String accessToken;
  final String refreshToken;
  final String email;
  final String fullName;
  final bool isEmailVerified;

  const AuthResponseModel({
    required this.accessToken,
    required this.refreshToken,
    required this.email,
    required this.fullName,
    required this.isEmailVerified,
  });

  factory AuthResponseModel.fromJson(Map<String, dynamic> json) {
    return AuthResponseModel(
      accessToken: json['accessToken'] as String,
      refreshToken: json['refreshToken'] as String,
      email: json['email'] as String,
      fullName: json['fullName'] as String,
      isEmailVerified: json['isEmailVerified'] as bool? ?? false,
    );
  }
}