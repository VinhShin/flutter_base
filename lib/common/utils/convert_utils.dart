class ConvertUtils{

  static final ConvertUtils _singleton = ConvertUtils._internal();

  ConvertUtils._internal();

  factory ConvertUtils() {
    return _singleton;
  }

  int getInt(dynamic value, {int defaultValue = 0}){
    if(value == null){
      return defaultValue;
    }
    if(value.runtimeType != 1.runtimeType){
      value = int.parse(value.toString());
    }
    return value;
  }

  String getString(dynamic value, {String defaultValue = ""}){
    if(value == null || value == "null"){
      return defaultValue;
    }
    if(value.runtimeType != "".runtimeType){
      value = value.toString();
    }
    return value;
  }

  double getDouble(dynamic value, {double defaultValue = 0.0}){
    if(value == null){
      return defaultValue;
    }
    if(value.runtimeType != 1.0.runtimeType){
      try {
        value = value.toString().replaceAll(",", "");
        value = value.toString().replaceAll(".", "");
        value = double.parse(value.toString());
      }catch(e){
        return 0;
      }
    }
    return value;
  }

  List getList(dynamic value){
    if(value == null){
      return List();
    }
    return value;
  }

}