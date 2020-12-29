
import 'package:e_mobiz/common/utils/constants.dart';
import 'package:e_mobiz/data/remote/base/base_request.dart';

class SignupRequest implements BaseRequest {
  String email;
  String address;
  String phone;
  String pass;
  String passConfirm;
  String userName;
  String newpass;
  String socialId;
  String avatar;
  String userType;

  SignupRequest({
    this.email = "",
    this.address = "",
    this.phone = "",
    this.pass = "",
    this.passConfirm = "",
    this.userName = "",
    this.newpass = "",
    this.socialId = "",
    this.avatar = "",
    this.userType = "0"
  });

  @override
  Map<String, dynamic> getParams() {
    // TODO: implement getParams
    return <String, dynamic>{
      'email': email.trim(),
      'password': pass,
      "phone": phone.trim(),
      "address": address.trim(),
      "user_name": userName.trim(),
      "user_type":Constants().USER_BUYER
    };
  }

  @override
  Future<Map<String, double>> getParamsFuture() {
    // TODO: implement getParamsFuture
    throw UnimplementedError();
  }
}
