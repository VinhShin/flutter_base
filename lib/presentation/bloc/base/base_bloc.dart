import 'package:e_mobiz/presentation/bloc/base/base_bloc_state.dart';
import 'package:e_mobiz/presentation/widget/base_state.dart';
import 'package:rxdart/rxdart.dart';

class BaseBloc{

  PublishSubject<BlocState> uiEventStream = PublishSubject();
  BaseState baseState;

  BaseBloc(){
    init();
  }

  void init(){
    uiEventStream.listen((value) {
      this.baseState.onEventUIReceive(value);
    });
  }

  void mapUI(BaseState baseState){
    this.baseState = baseState;
  }

}