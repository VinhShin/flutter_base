import 'package:e_mobiz/presentation/bloc/base/base_bloc_state.dart';

enum EDialog{
  OK,
  OK_CANCEL,
}

class DialogState extends BlocState{

  EDialog _type;
  String _title;
  String _content;
  String _leftButton;
  String _rightButton;

  EDialog get type => _type;

  DialogState.ok({String title = "Notification", String content}){
    _type = EDialog.OK;
    _title = title;
    _content = content;
  }

  set type(EDialog value) {
    _type = value;
  }

  String get title => _title;

  set title(String value) {
    _title = value;
  }

  String get content => _content;

  set content(String value) {
    _content = value;
  }

  String get leftButton => _leftButton;

  set leftButton(String value) {
    _leftButton = value;
  }

  String get rightButton => _rightButton;

  set rightButton(String value) {
    _rightButton = value;
  }
}