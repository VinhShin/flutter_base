import 'dart:convert';

class JsonUtils{

  static final JsonUtils _singleton = new JsonUtils._internal();

  JsonUtils._internal();

  factory JsonUtils() {
    return _singleton;
  }

  toJson(List<dynamic> datas){
    List json = new List();
    datas.forEach((item) {
      json.add(item.toJson());
    });
    return jsonEncode(json);
  }

  toJsonObject(dynamic datas){
    return jsonEncode(datas.toJson());
  }

  //pedding - problem
  listFromJson(String json, T){
    List<dynamic> jsonList = jsonDecode(json);
    List<dynamic> objectList = new List();
    jsonList.forEach((item) {
      objectList.add(T.fromJson(item));
    });
    return objectList;
  }




}