

import 'package:e_mobiz/common/utils/shared_manager.dart';
import 'package:e_mobiz/common/utils/string_utils.dart';
import 'package:e_mobiz/data/remote/repo/account/account_repository.dart';
import 'package:e_mobiz/data/remote/request/login_request.dart';
import 'package:e_mobiz/data/remote/request/signup_request.dart';
import 'package:e_mobiz/data/remote/response/login_response.dart';

abstract class AccountUseCase {
  Future<LoginResponse> login(LoginRequest request);
  Future<LoginResponse> signup(SignupRequest request);
}

class AccountUseCaseImpl implements AccountUseCase {

  final AccountRepo accountRepo;
  final SharedManager shared;

  AccountUseCaseImpl({this.accountRepo, this.shared});

  @override
  Future<LoginResponse> signup(SignupRequest request) async {
    // TODO: implement signup
    var res = await accountRepo.signup(request);
    shared.putString(keyAccessToken, res.data.token);
    return res;
  }

  @override
  Future<LoginResponse> login(LoginRequest request) async {
    var res = await accountRepo.login(request);
    shared.putString(keyAccessToken, res.data.token);
    return res;
  }

  @override
  Future<bool> checkFirstSeen() async {
    var result = shared.getBool(keyFirstSeen) ?? true;
    shared.putBool(keyFirstSeen, false);
    return result;
  }

  @override
  Future<bool> checkLogin() async {
    var token = shared.getString(keyAccessToken);
    if(StringUtils.isEmpty(token)) {
      return false;
    }
    return true;
  }

}