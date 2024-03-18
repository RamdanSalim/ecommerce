import 'package:dio/dio.dart';
import 'package:ecommerce/resource/api_query.dart';
import 'package:ecommerce/resource/di.dart';
import 'package:ecommerce/utils/api_constants.dart';

ApiQuery _apiQuery = sl.get<ApiQuery>();

class ProductRepo {
  Future<Response?> getProduct() async {
    Response? response = await _apiQuery.getQuery(
        ApiConst.productSlug, {}, {}, 'get_products', true, true, false);
    return response;
  }
}
