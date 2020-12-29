import 'package:e_mobiz/presentation/bloc/base/base_bloc_state.dart';

class LoginState extends BlocState{

  bool error;
  bool loginSuccess;
  String errorMess;

  LoginState({this.error = false, this.loginSuccess = true, this.errorMess = ""});
}