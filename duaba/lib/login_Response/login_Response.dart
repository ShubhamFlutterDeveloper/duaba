class loginResponse {
  bool? success;
  int? code;
  String? message;
  Body? body;

  loginResponse({this.success, this.code, this.message, this.body});

  loginResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    code = json['code'];
    message = json['message'];
    body = json['body'] != null ? new Body.fromJson(json['body']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['code'] = this.code;
    data['message'] = this.message;
    if (this.body != null) {
      data['body'] = this.body!.toJson();
    }
    return data;
  }
}

class Body {
  String? token;
  String? refreshToken;
  String? expiresIn;
  String? refreshExpiresIn;

  Body({this.token, this.refreshToken, this.expiresIn, this.refreshExpiresIn});

  Body.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    refreshToken = json['refresh_token'];
    expiresIn = json['expires_in'];
    refreshExpiresIn = json['refresh_expires_in'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    data['refresh_token'] = this.refreshToken;
    data['expires_in'] = this.expiresIn;
    data['refresh_expires_in'] = this.refreshExpiresIn;
    return data;
  }
}
