import 'package:e_mobiz/presentation/bloc/base/base_bloc.dart';
import 'package:e_mobiz/presentation/bloc/base/base_bloc_state.dart';
import 'package:e_mobiz/module/dialog_controller.dart';
import 'package:e_mobiz/presentation/widget/custom/full_loading.dart';
import 'package:flutter/cupertino.dart';
import 'package:e_mobiz/module/loading_controller.dart';

abstract class BSInterface{
  BaseBloc getBloc(){
    return BaseBloc();
  }
}

abstract class BaseState<T extends StatefulWidget> extends State<T> implements BSInterface {

  BaseBloc baseBloc;

  onEventUIReceive(BlocState event){

  }

  Widget buildImpl(){
    throw UnimplementedError();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.baseBloc = getBloc();
    this.baseBloc.mapUI(this);
  }

  @override
  Widget build(BuildContext context) {
    DialogController().context = context;
    return Stack(children: [
      buildImpl(),
      StreamBuilder<bool>(
        stream: LoadingController().loadingStream,
        initialData: false,
        builder: (c, snap) {
          return FullLoading(snap.data);
        },
      )
    ],);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    DialogController().context = null;
  }

}