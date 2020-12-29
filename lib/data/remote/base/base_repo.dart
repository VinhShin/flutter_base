export 'package:dio/dio.dart';

import 'package:dio/dio.dart';
import 'package:e_mobiz/common/utils/constants.dart';
import 'package:e_mobiz/common/utils/shared_manager.dart';

import 'base_exception.dart';
import 'base_response.dart';

class BaseRepo {
  final String _BASE_PATH = "https://mingo72.herokuapp.com/";

  final String LOGIN_PATH = "user/login";
  final String LOGIN_FACEBOOK_PATH = "https://graph.facebook.com/v2.12/me?fields=picture,email,name,id&access_token=";
  final String SIGNUP_PATH = "user/signup";
  final String LOGIN_SOCIAL = "user/loginSocial";
  final String RESIDENT_PATH = "products/newProduct";
  final String UPDATE_PROFILE_PATH = "user/updateProfile";
  final String UPDATE_AVATAR_PATH = "user/updateAvatar";
  final String UPDATE_PASSWORD_PATH = "user/updatePassword";
  final String DISTRICT_PATH = "apartment/getByDistrictId";
  final String DELETE_PRODUCT_ID_PATH = "products/deleteProduct";
  final String UPDATE_APARTMENT_PATH = "apartment/updateApartment";
  final String UPDATE_STATUS_PATH = "products/updateProductStatus";
  final String GET_ALL_PRODUCT_PATH = "products/getProduct";
  final String GET_STORES_PATH = "products/getStores";
  final String GET_MASTER_DATA = "master/getMasterData";
  final String GET_HOME_PRODUCT = "products/getHomeProduct";
  final String GET_PRODUCT_BY_TYPE = "products/getProductByType";
  final String GET_HOT_PRODUCT = "products/getHotProduct";

  Dio dio;

  BaseRepo() {
    dio = Dio(BaseOptions(
        baseUrl: _BASE_PATH, connectTimeout: 30000, receiveTimeout: 30000, responseType: ResponseType.json));
  }

  setToken() async {
    String token = "bearer ${await SharedManager().getString(Constants().SHARED_TOKEN)}";
    dio.options.headers["authorization"] = token;
  }

  String _handleError(Error error) {
    String errorDescription = "";
    if (error is DioError) {
      DioError dioError = error as DioError;
      switch (dioError.type) {
        case DioErrorType.CANCEL:
          errorDescription = "Request to API server was cancelled";
          break;
        case DioErrorType.CONNECT_TIMEOUT:
          errorDescription = "Connection timeout with API server";
          break;
        case DioErrorType.DEFAULT:
          errorDescription = "Connection to API server failed due to internet connection";
          break;
        case DioErrorType.RECEIVE_TIMEOUT:
          errorDescription = "Receive timeout in connection with API server";
          break;
        case DioErrorType.RESPONSE:
          errorDescription = "Received invalid status code: ${dioError.response.statusCode}";
          break;
        case DioErrorType.SEND_TIMEOUT:
          errorDescription = "Send timeout in connection with API server";
          break;
      }
    } else {
      errorDescription = "Unexpected error occured";
    }
    return errorDescription;
  }

  bool responseSuccess(var response) {
    return response.data["code"] == 1;
  }


  Future<BaseResponse<T>> post<T>(Map<String, dynamic> params, String endPoint, FromJson fromJson,  {bool authorization = true}) async {

    if(authorization){
      String token = "bearer ${await SharedManager().getString(Constants().SHARED_TOKEN)}";
      dio.options.headers["authorization"] = token;
    }

    var response = await dio.post(endPoint, data: FormData.fromMap(params));
    if (responseSuccess(response)) {
      return BaseResponse.SUCCESS(fromJson(response.data["data"]));
    }

    return BaseResponse.FAILURE();
  }

  Future<BaseResponse<T>> get<T>(Map<String, dynamic> params, String endPoint, FromJson fromJson,  {bool authorization = true}) async {

    if(authorization){
      String token = "bearer ${await SharedManager().getString(Constants().SHARED_TOKEN)}";
      dio.options.headers["authorization"] = token;
    }

    var response = await dio.get(endPoint, queryParameters: params);
    if (responseSuccess(response)) {
      return BaseResponse.SUCCESS(fromJson(response.data["data"]));
    }
    return BaseResponse.FAILURE();
  }


  safeCall(Function call){
    try {
      return call();
    } on BaseException catch (e){
      print(e);
    }
    return null;
  }

}
