class ApiResponse {
  final String code;
  final String message;
  final ApiData data;

  ApiResponse({
    required this.code,
    required this.message,
    required this.data,
  });

  factory ApiResponse.fromJson(Map<String, dynamic> json) {
    return ApiResponse(
      code: json['code'],
      message: json['message'],
      data: ApiData.fromJson(json['data']),
    );
  }
}

class ApiData {
  final List<Product> products;

  ApiData({
    required this.products,
  });

  factory ApiData.fromJson(Map<String, dynamic> json) {
    return ApiData(
      products: List<Product>.from(
        json['products'].map((productJson) => Product.fromJson(productJson)),
      ),
    );
  }
}

class Product {
  final String id;
  final String title;

  Product({
    required this.id,
    required this.title,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      title: json['title'],
    );
  }
}
