import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:shop_tech/models/product.dart';

class RemoteServices {
   // static var client = http.Client();

   static Future<List<Product>> fetchProducts() async {
      try {
         var endpointUrl = Uri.parse('https://alobhaitsolution.com/letzplay_dev/public/api/customer/get-product?main_category=1&subcategory=1');

         final response = await http.post(endpointUrl);
         print(response.body);


         if(response.statusCode == 200) {
            // var jsonString = response.body;
            // dynamic decodedData = jsonDecode(jsonString);
            final data = jsonDecode(response.body);
            final productsData = data['data']['products'] as List;

            // final List<dynamic> decodedList = decodedData;

            final List<Product> products = productsData
                .map<Product>((productData) => Product.fromJson(productData))
                .toList();
            return products;

            // final List<Product> _productList = decodedList.map((listItem) {
            //    return Product.fromJson(listItem);
            // }).toList();

            // print(_productList[0]);
            //
            // return _productList;
         } else {
            throw Exception('API not successful !');
         }
      } on SocketException {
         throw Exception('No internet connection :(');
      } on HttpException {
         throw Exception('Couldnt retreive the images! Sorry!');
      } on FormatException {
         throw Exception('Bad response format!');
      } catch (e) {
         print(e);
         throw Exception('Unknown error');
      }
   }
}