class Autenticazione {
  String accessToken;
  String refreshToken;
  String ? error;
  int expiresIn;


  Autenticazione({required this.accessToken, required this.refreshToken, required this.error, required this.expiresIn,});

  factory Autenticazione.fromJson(Map<String, dynamic> json) {
    return Autenticazione(
      accessToken: json['access_token'],
      refreshToken: json['refresh_token'],
      error: json['error_description'],
      expiresIn: json['expires_in'],
    );
  }

  bool hasError() {
    return error != null;
  }


}