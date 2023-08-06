
class LoginRequest {
  String? email;
  String? password;
  String? deviceType;
  String? deviceToken;
  String? role;

  LoginRequest({this.email, this.password, this.deviceType, this.deviceToken, this.role});

  LoginRequest.fromjson(Map<String, dynamic> json) {
    email = json['email'];
    password = json['password'];
    deviceType = json['deviceType'];
    deviceToken = json['deviceToken'];
    role = json['role'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = email;
    data['password'] = password;
    data['deviceType'] = deviceType;
    data['deviceToken'] = deviceToken;
    data['role'] = role;
    return data;
  }
}
