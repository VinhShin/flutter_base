import 'package:e_mobiz/data/remote/base/base_request.dart';

class ProductHomeRequest extends BaseRequest{

  int size;

  ProductHomeRequest(this.size);

  @override
  Map<String, dynamic> getParams() {
    // TODO: implement getParams
    Map<String, dynamic> params = Map();
    params['size'] = size;
    return params;
  }
}