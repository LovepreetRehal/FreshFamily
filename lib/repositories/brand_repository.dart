import 'package:active_ecommerce_flutter/app_config.dart';
import 'package:active_ecommerce_flutter/data_model/all_brands_response.dart';
import 'package:active_ecommerce_flutter/data_model/brand_response.dart';
import 'package:active_ecommerce_flutter/helpers/shared_value_helper.dart';
import 'package:active_ecommerce_flutter/repositories/api-request.dart';

class BrandRepository {
  Future<BrandResponse> getFilterPageBrands() async {
    String url = ("${AppConfig.BASE_URL}/filter/brands");
    print("BASEURL getFilterPageBrands -> $url");
    final response = await ApiRequest.get(url: url, headers: {
      "App-Language": app_language.$!,
    });
    return brandResponseFromJson(response.body);
  }

  Future<BrandResponse> getBrands({name = "", page = 1}) async {
    String url = ("${AppConfig.BASE_URL}/brands" + "?page=$page&name=$name");
    print("BASEURL getBrands -> $url");
    final response = await ApiRequest.get(url: url, headers: {
      "App-Language": app_language.$!,
    });
    return brandResponseFromJson(response.body);
  }

  Future<AllBrandsResponse> getAllBrands() async {
    String url = ("${AppConfig.BASE_URL}/all-brands");
    print("BASEURL getAllBrands -> $url");
    final response = await ApiRequest.get(url: url, headers: {
      "App-Language": app_language.$!,
    });

    // print(response.body);
    return allBrandsResponseFromJson(response.body);
  }
}
