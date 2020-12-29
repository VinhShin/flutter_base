
const int ERROR_FAILURE = 400;
const int SUCCESS = 1;

typedef T FromJson<T>(var data);

class BaseResponse<T>{

  int code;
  String message;
  T data;

  BaseResponse({this.code, this.message, this.data});

  FromJson fromJson;

  factory BaseResponse.FAILURE(){
    return BaseResponse(code:ERROR_FAILURE);
  }

  factory BaseResponse.SUCCESS(var data){
    return BaseResponse(code:SUCCESS, data: data);
  }

  bool isSuccess(){
    return code != ERROR_FAILURE;
  }
}
