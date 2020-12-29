import 'package:e_mobiz/presentation/bloc/base/base_bloc.dart';
import 'package:e_mobiz/presentation/bloc/base/base_bloc_state.dart';
import 'package:e_mobiz/presentation/bloc/login/state/login_state.dart';
import 'package:e_mobiz/common/styles/dimens.dart';
import 'package:e_mobiz/data/remote/request/login_request.dart';
import 'package:e_mobiz/presentation/bloc/login/login_bloc.dart';
import 'package:e_mobiz/presentation/screens/home/home_screen.dart';
import 'package:e_mobiz/presentation/widget/base/m_button.dart';
import 'package:e_mobiz/presentation/widget/base_state.dart';
import 'package:e_mobiz/presentation/bloc/general/dialog_state.dart';
import 'package:e_mobiz/presentation/dialog/app_dialog.dart';
import 'package:e_mobiz/presentation/widget/custom/block_20.dart';
import 'package:e_mobiz/presentation/widget/custom/title_field.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends BaseState<LoginScreen> {

  LoginBloc loginBloc;
  LoginRequest loginRequest;

  @override
  void initState() {
    loginBloc = new LoginBloc();
    super.initState();
  }

  @override
  BaseBloc getBloc() {
    return loginBloc;
  }

  @override
  onEventUIReceive(BlocState event) {
    // TODO: implement onEventUIReceive
    if(event is DialogState){
      AppDialog.show(context, event);
    } else if(event is LoginState){
      if(event.loginSuccess){
        HomeScreen.navigate(context);
      }
    }
    return super.onEventUIReceive(event);
  }

  @override
  Widget buildImpl() {
    // TODO: implement buildImpl
    return Container(
      padding: EdgeInsets.all(AppDimens.padding_normal),
      alignment: AlignmentDirectional.center,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Block20(),
          TitleField("Tên đăng nhập", (text){
            loginRequest.email = text;
          }),
          TitleField("Mật khẩu", (text){
            loginRequest.pass = text;
          }),
          Block20(),
          MButton("Đăng nhập", (){
            loginBloc.onLogin(loginRequest);
          })
        ],
      ),
    );
  }
}
