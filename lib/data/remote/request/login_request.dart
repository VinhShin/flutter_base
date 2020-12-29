import 'package:e_mobiz/data/remote/base/base_request.dart';
import 'package:e_mobiz/common/utils/constants.dart';
import 'package:e_mobiz/common/utils/fcm_utils.dart';

class LoginRequest extends BaseRequest{

  String _email;
  String _pass;


  LoginRequest(this._email, this._pass);


  set email(String value) {
    _email = value;
  }


  set pass(String value) {
    _pass = value;
  }

  @override
  Future<Map<String, dynamic >> getParamsFuture() async {
    // TODO: implement getParamsFuture
    Map<String, dynamic> params = Map();
    params['email'] = _email;
    params['password'] = _pass;
    params['push_id'] = await FCMUtils.getFCMToken();
    return params;
  }

}