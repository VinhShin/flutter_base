import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:e_mobiz/common/utils/shared_manager.dart';
import 'package:e_mobiz/data/remote/base/base_exception.dart';
import 'package:e_mobiz/data/remote/base/base_repo.dart';
import 'package:e_mobiz/data/remote/base/base_response.dart';
import 'package:e_mobiz/data/remote/request/login_request.dart';
import 'package:e_mobiz/data/remote/response/login_response.dart';
import 'package:e_mobiz/data/remote/request/signup_request.dart';
import 'package:e_mobiz/dj/injection/injection.dart';

abstract class AccountRepo {
  Future<LoginResponse> login(LoginRequest request);
  Future<LoginResponse> signup(SignupRequest request);
}

class AccountRepoImpl extends BaseRepo implements AccountRepo {

  Dio dio;
  SharedManager _shared;

  AccountRepoImpl({this.dio}) {
    _shared = Injection.getIt<SharedManager>();
  }

  String getAccessToken() {
    return _shared.getString(keyAccessToken);
  }

  @override
  Future<LoginResponse> login(LoginRequest request) async {
    // TODO: implement login
    try {
      BaseResponse<LoginResponse> response = await post(
          await request.getParamsFuture(), LOGIN_PATH, (data) => LoginResponse.fromJson(data));
      if (response.isSuccess()) {
        return response.data;
      }
    } on BaseException catch (e){
      print(e);
    }
    return null;
  }

  @override
  Future<LoginResponse> signup(SignupRequest request) async {
    // TODO: implement signup
    try {
      BaseResponse<LoginResponse> response = await post(
          request.getParams(), LOGIN_PATH, (data) => LoginResponse.fromJson(data));
      if (response.isSuccess()) {
        return response.data;
      }
    } catch (e){
      print(e);
    }
    return null;
  }
}