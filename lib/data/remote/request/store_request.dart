import 'package:e_mobiz/data/remote/base/base_request.dart';

class StoreRequest extends BaseRequest{

  double lat;
  double lng;
  int distance;
  int productType;
  String productName;
  int limit = 50;


  StoreRequest({this.lat, this.lng, this.distance, this.productType, this.productName, this.limit});

  factory StoreRequest.def(){
    return StoreRequest(
        lat:10.820100,
        lng:106.630355,
        distance: 10000,
        productType: 0,
        productName: ""
    );
  }

  Map<String, dynamic> getParams(){
    Map<String, dynamic> params = Map();
    params['latitude'] = lat;
    params['longtitue'] = lng;
    params['distance'] = distance;
    params['product_type'] = productType;
    params['product_name'] = productName;
    return params;
  }
}
//longtitue:106.630355
//latitude:10.820100
//distance:100