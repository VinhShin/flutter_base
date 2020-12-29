import 'package:e_mobiz/presentation/bloc/general/dialog_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:e_mobiz/presentation/dialog/app_dialog.dart';

class DialogController{

  static final DialogController _singleton = DialogController._internal();

  BuildContext _context;

  DialogController._internal();

  factory DialogController() {
    return _singleton;
  }

  void showDialog(DialogState dialogState){
    if(_context != null){
      AppDialog.showDialogOK(_context, dialogState);
    }
  }

  set context(BuildContext value) {
    _context = value;
  }
}