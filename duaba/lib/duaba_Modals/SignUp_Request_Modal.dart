
class SignupRequest {
  String? firstname;
  String? lastname;
  String? email;
  String? password;
  String? mobileNumber;
  String? countryCode;
  String? deviceType;
  String? deviceToken;
  String? dob;
  String? gender;

  SignupRequest(
      {this.firstname,
        this.lastname,
        this.email,
        this.password,
        this.mobileNumber,
        this.countryCode,
        this.deviceType,
        this.deviceToken,
        this.dob,
        this.gender});

  SignupRequest.fromJson(Map<String, dynamic> json) {
    firstname = json['firstname'];
    lastname = json['lastname'];
    email = json['email'];
    password = json['password'];
    mobileNumber = json['mobile_number'];
    countryCode = json['country_code'];
    deviceType = json['deviceType'];
    deviceToken = json['deviceToken'];
    dob = json['dob'];
    gender = json['gender'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['firstname'] = firstname;
    data['lastname'] = lastname;
    data['email'] = email;
    data['password'] = password;
    data['mobile_number'] = mobileNumber;
    data['country_code'] = countryCode;
    data['deviceType'] = deviceType;
    data['deviceToken'] = deviceToken;
    data['dob'] = dob;
    data['gender'] = gender;
    return data;
  }
}