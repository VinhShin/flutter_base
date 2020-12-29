

import 'dart:convert';

LoginResponse UserResponseFromJson(String str) => LoginResponse.fromJson(json.decode(str));

String UserResponseToJson(LoginResponse data) => json.encode(data.toJson());

class LoginResponse {
  int code;
  String message;
  UserData data;

  LoginResponse({
    this.code,
    this.message,
    this.data,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
    code: json["code"],
    message: json["message"],
    data: UserData.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "message": message,
    "data": data.toJson(),
  };
}

class UserData {
  String token;
  String email;
  String userId;
  String address;
  String phone;
  String userName;
  String avatar;
  String password;
  String userType;

  UserData({
    this.token,
    this.email,
    this.userId,
    this.address,
    this.phone,
    this.userName,
    this.avatar,
    this.password,
    this.userType
  });

  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
    token: json["token"],
    email: json["email"],
    userId: json["userId"],
    address: json["address"],
    phone: json["phone"],
    userName: json["user_name"],
    avatar: json["avatar"],
    password: json["password"],
    userType: json["user_type"]
  );

  Map<String, dynamic> toJson() => {
    "token": token,
    "email": email,
    "userId": userId,
    "address": address,
    "phone":phone,
    "user_name":userName,
    "avatar": avatar,
    "password" : password,
    "user_type":userType
  };
}