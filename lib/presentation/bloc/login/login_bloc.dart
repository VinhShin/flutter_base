import 'package:e_mobiz/presentation/bloc/base/base_bloc.dart';
import 'package:e_mobiz/presentation/bloc/login/state/login_state.dart';
import 'package:e_mobiz/data/remote/request/login_request.dart';
import 'package:rxdart/rxdart.dart';

class LoginBloc extends BaseBloc{

  PublishSubject<LoginState> loginStream;
  LoginRequest loginRequest;

  @override
  void init() {
    // TODO: implement init
    super.init();
    loginStream = PublishSubject();
  }

  void onLogin(LoginRequest loginRequest){
    uiEventStream.add(LoginState());
  }

//  void login()
}