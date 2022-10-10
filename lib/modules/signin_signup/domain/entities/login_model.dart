class LoginResponseModel {
  String? token;
  DataLoginResponse? data;

  LoginResponseModel({this.token, this.data});

  LoginResponseModel.fromJson(Map<String, dynamic> json) {
    token = json['result'];
    data = json['fields'] != null ? DataLoginResponse.fromJson(json['fields']) : null;
  }
}

class DataLoginResponse {
  String? username;
  String? password;

  DataLoginResponse({this.username, this.password});

  DataLoginResponse.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    password = json['password'];
  }
}
