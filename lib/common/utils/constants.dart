class Constants {
  static final Constants _singleton = Constants._internal();

  Constants._internal();

  factory Constants() {
    return _singleton;
  }



  String kGoogleApiKey ="AIzaSyBqEe54Of3hudPiB5UrLUm2N5J_tb31YbA";
  String SHARED_TOKEN = "token";
  String SHARED_USER_ID = "user_id";
  String SHARED_EMAIL = "email";
  String SHARED_PHONE = "phone";
  String SHARED_COUNTRY_CODE = "country_code";
  String SHARED_TIMES_SEARCH = "times_search";
  String SHARED_CURRENT_LANGUAGE = "current_language";
  String SHARED_ADDRESS = "address";
  String SHARED_USER_NAME = "user_name";
  String SHARED_AVATAR = "avatar";
  String SHARED_PASSWORD = "password";
  String SHARED_PUSH_ID = "push_id";
  String SHARED_USER_TYPE = "user_type";
  String SHARED_PRODUCT_TYPE = "product_type";

  String SHARED_CHECK_LOGIN_SOCIAL = "";

  String countryCode = "VN";

  String USER_BUYER = "0";
  String USER_SELLER = "1";

  final int PRODUCT_TYPE_FRUIT = 1;
  final int PRODUCT_TYPE_FOOD = 2;

  final int DEFAULT_DISTANCE = 5;

}
