import 'dart:convert';
import 'dart:developer';

import 'package:api_repository/api_repository.dart';
import 'package:database_api/database_api.dart';
import 'package:product_repository/product_repository.dart';
import 'package:http/http.dart' as http;

class ProductRepository {
  final DatabaseApi _databaseApi;

  ProductRepository({
    required DatabaseApi databaseApi,
  }) : _databaseApi = databaseApi;

  static String productPath = "products";

  Stream<List<Product>> productStream() {
    return _databaseApi.collectionStream(
      path: productPath,
      builder: (data, _) => Product.fromJson(data),
    );
  }

  Future<void> setProducts(List<Product> products) async {
    // await _databaseApi.setBatchDataForDocInList(
    //   baseColPath: productPath,
    //   docIdList: products.map((product) => product.id).toList(),
    //   dataFromId: (id) =>
    //       products.firstWhere((product) => product.id == id).toJson(),
    //   merge: true,
    // );
  }

  Future<List<Product>> getProducts(String token) async {
    try {
      final uri = Uri.http(ApiRepository.baseUrl, "/api/products");
      final response = await http.get(
        uri,
        headers: {
          "Accept": "application/json",
          "Authorization": "Bearer $token"
        },
      );

      if (response.statusCode == 200) {
        log("Response: ${response.body}");

        final products = (jsonDecode(response.body)["data"] as List);
        return products.map((product) {
          return Product.fromJson(product);
        }).toList();
      }
      throw Exception("Error getting products");
    } catch (e) {
      rethrow;
    }
  }

  Future<List<Product>> getCategoryProducts(
    String category,
    String token,
  ) async {
    try {
      final uri =
          Uri.http(ApiRepository.baseUrl, "/api/products/categories/$category");
      final response = await http.get(uri, headers: {
        "Accept": "application/json",
        "Authorization": "Bearer $token",
      });

      if (response.statusCode == 200) {
        log("Response: ${response.body}");

        final products = (jsonDecode(response.body)["data"] as List);
        return products.map((product) {
          return Product.fromJson(product);
        }).toList();
      }
      throw Exception("Error getting products");
    } catch (e) {
      rethrow;
    }
  }

  Future<String> placeOrder(
    List<Product> products,
    String token,
  ) async {
    try {
      final uri = Uri.http(ApiRepository.baseUrl, "/api/orders/add");

      final body = {
        "items": products.map((product) {
          return {
            "product_id": product.id,
            "quantity": product.quantity,
          };
        }).toList(),
      };

      final response = await http.post(
        uri,
        body: jsonEncode(body),
        headers: {
          "Authorization": "Bearer $token",
          "Content-Type": "application/json",
        },
      );

      if (response.statusCode == 200) {
        log("Response: ${response.body}");
        final message = jsonDecode(response.body)["message"];
        return message;
      }
      throw Exception(" Error adding orders: ${response.body}");
    } catch (e) {
      rethrow;
    }
  }

  Future<List<Order>> getOrders(String token) async {
    try {
      final uri = Uri.http(ApiRepository.baseUrl, "/api/orders");
      final response = await http.get(
        uri,
        headers: {
          "Accept": "application/json",
          "Authorization": "Bearer $token"
        },
      );

      if (response.statusCode == 200) {
        log("Response: ${response.body}");

        final orders = (jsonDecode(response.body)["data"] as List);
        return orders.map((order) {
          return Order.fromJson(order);
        }).toList();
      }
      throw Exception("Error getting orders: ${response.body}");
    } catch (e) {
      rethrow;
    }
  }

  Future<String> generateQR(String token, String amount) async {
    try {
      final uri = Uri.http(ApiRepository.baseUrl, "/api/payment/generate_qr");
      final response = await http.post(
        uri,
        headers: {
          "Accept": "application/json",
          "Authorization": "Bearer $token"
        },
        body: {
          "amount": amount,
        },
      );

      if (response.statusCode == 200) {
        log("Response: ${response.body}");

        final qrCode =
            (jsonDecode(response.body)["data"]["redirectUrl"] as String);
        return qrCode;
      }
      throw Exception("Error fetching qr code: ${response.body}");
    } catch (e) {
      rethrow;
    }
  }
}
