import 'package:rxdart/rxdart.dart';

class LoadingController{

  static final LoadingController _singleton = LoadingController._internal();

  LoadingController._internal();

  factory LoadingController() {
    return _singleton;
  }
  
  PublishSubject<bool> _loadingStream = PublishSubject();

  PublishSubject<bool> get loadingStream => _loadingStream;

  void onShow(){
    _loadingStream.add(true);
  }

  void onHide(){
    _loadingStream.add(false);
  }
}