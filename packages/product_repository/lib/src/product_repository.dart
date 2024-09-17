import 'package:api_repository/api_repository.dart';
import 'package:database_api/database_api.dart';
import 'package:product_repository/product_repository.dart';

class ProductRepository {
  final DatabaseApi _databaseApi;

  ProductRepository({
    required DatabaseApi databaseApi,
  }) : _databaseApi = databaseApi;

  static String productPath = "products";

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

  Future<String> addToCart(Product product) async {
    try {
      final req = RequestModel(
        endpoint: "/api/carts/addToCart",
        type: RequestType.post,
        data: {
          "product_id": product.id,
          "quantity": product.quantity,
        },
      );

      final response = await ApiRepository().send(req);

      return response["message"];
    } catch (e) {
      rethrow;
    }
  }

  Future<List<Product>> getCartsProduct() async {
    try {
      final req = RequestModel(
        endpoint: "/api/carts/",
        type: RequestType.get,
        data: {},
      );

      final response = await ApiRepository().send(req);
      final cartProducts = response["data"] as List;
      return cartProducts
          .map((product) => Product.fromJson(product["product"]))
          .toList();
    } catch (e) {
      rethrow;
    }
  }

  Future<String> removeFromCart(int productId) async {
    try {
      final req = RequestModel(
        endpoint: "/api/carts/removeToCart",
        type: RequestType.post,
        data: {
          "product_id": productId.toString(),
        },
      );

      final response = await ApiRepository().send(req);
      final message = response["message"];
      return message;
    } catch (e) {
      rethrow;
    }
  }
}
