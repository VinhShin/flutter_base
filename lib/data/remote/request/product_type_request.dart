import 'package:e_mobiz/data/remote/base/base_request.dart';

class ProductTypeRequest extends BaseRequest{

  String productType;

  ProductTypeRequest(this.productType);

  @override
  Map<String, dynamic> getParams() {
    // TODO: implement getParams
    Map<String, dynamic> params = Map();
    params['product_type'] = productType;
    return params;
  }
}