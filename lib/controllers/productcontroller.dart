import 'dart:convert';

import 'package:get/state_manager.dart';
import 'package:shop_tech/models/product.dart';
import 'package:shop_tech/services/remote_services.dart';
import 'package:http/http.dart' as http;

class ProductController extends GetxController {
  var productList = <Product>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  void fetchProducts() async {
      // var products = await RemoteServices.fetchProducts().then((fetchedProducts) {
      //   productList.assignAll(fetchedProducts);
      // });
      // if (products != null) {
      //   productList.value = products;
      // }

    try {
      isLoading(true);
      final response = await http.post(Uri.parse('https://alobhaitsolution.com/letzplay_dev/public/api/customer/get-product?main_category=1&subcategory=1'));
      print(response.body);

      if (response.statusCode == 200) {

        final parsedResponse = json.decode(response.body);
        final apiResponse = ApiResponse.fromJson(parsedResponse);
        productList.assignAll(apiResponse.data.products);

        // final data = json.decode(response.body);
        // final productsData = data['data']['products'] as List;
        // print("productsData $productsData");

        // if (productsData != null) {
        //   productList.assignAll(productsData
        //       .map<Product>((productData) => Product.fromJson(productData))
        //       .toList());
        // } else {
        //   throw Exception('Products data is missing or null');
        // }
      } else {
        throw Exception('Failed to fetch products');
      }
    } finally {
      isLoading(false);
    }
  }
}