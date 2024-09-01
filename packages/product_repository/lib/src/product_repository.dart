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
      final req = RequestModel(
        endpoint: "/api/products",
        type: RequestType.get,
        data: {},
      );

      final response = await ApiRepository().send(req);

      final products = response["data"] as List;
      return products.map((product) {
        return Product.fromJson(product);
      }).toList();
    } catch (e) {
      rethrow;
    }
  }

  Future<List<Product>> getCategoryProducts(
    String category,
    String token,
  ) async {
    try {
      final req = RequestModel(
        endpoint: "/api/products/categories/$category",
        type: RequestType.get,
        data: {},
      );

      final response = await ApiRepository().send(req);

      final products = response["data"] as List;
      return products.map((product) {
        return Product.fromJson(product);
      }).toList();
    } catch (e) {
      rethrow;
    }
  }

  Future<String> placeOrder(
    List<Product> products,
    String token,
  ) async {
    try {
      final req = RequestModel(
        endpoint: "/api/orders/add",
        type: RequestType.post,
        data: {
          "items": products.map((product) {
            return {
              "product_id": product.id,
              "quantity": product.quantity,
            };
          }).toList(),
        },
      );

      final response = await ApiRepository().send(req);

      final message = response["message"];
      return message;
    } catch (e) {
      rethrow;
    }
  }

  Future<List<Order>> getOrders(String token) async {
    try {
      final req = RequestModel(
        endpoint: "/api/orders",
        type: RequestType.get,
        data: {},
      );

      final response = await ApiRepository().send(req);
      final orders = response["data"] as List;
      return orders.map((order) {
        return Order.fromJson(order);
      }).toList();
    } catch (e) {
      rethrow;
    }
  }

  Future<String> generateQR(String token, String amount) async {
    try {
      final req = RequestModel(
        endpoint: "/api/payment/generate_qr",
        type: RequestType.post,
        data: {
          "amount": amount,
        },
      );

      final response = await ApiRepository().send(req);

      final qrCode = (response["data"]["redirectUrl"] as String);
      return qrCode;
    } catch (e) {
      rethrow;
    }
  }
}
