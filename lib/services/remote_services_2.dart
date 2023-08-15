import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:shop_tech/models/product.dart';

class RemoteServices_Two {
   // static var client = http.Client();

   static Future<Product> fetchProducts() async {
      try {
         var endpointUrl = Uri.parse('https://alobhaitsolution.com/letzplay_dev/public/api/customer/get-product?main_category=1&subcategory=1');

         final response = await http.post(endpointUrl);

         if (response.statusCode == 200) {
            final Map<String, dynamic> jsonResponse = json.decode(response.body);
            return Product.fromJson(jsonResponse);
         } else {
            throw Exception('API not successful !');
         }
         print(response.body);
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