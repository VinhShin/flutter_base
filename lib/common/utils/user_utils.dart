

import 'constants.dart';
import 'shared_manager.dart';

class UserUtils{

  static final UserUtils _singleton = UserUtils._internal();

  String userType;
  String userEmail;
  String userId;
  String avatar;
  String userName;

  UserUtils._internal();

  factory UserUtils() {
    return _singleton;
  }

  initUserData() async {
    userType = SharedManager().getString(Constants().SHARED_USER_TYPE);
    userEmail = SharedManager().getString(Constants().SHARED_EMAIL);
    userId = SharedManager().getString(Constants().SHARED_USER_ID);
    avatar = SharedManager().getString(Constants().SHARED_AVATAR);
    userName = SharedManager().getString(Constants().SHARED_USER_NAME);
  }

  String getAvatarUrl(String avatar){
    if(avatar == null || avatar.isEmpty){
      return "https://residentmap.s3.amazonaws.com/123/ww/30774168068148.jpg";
    }
    return avatar;
  }

}
