import 'dart:convert';

import 'package:api_repository/api_repository.dart';
import 'package:http/http.dart' as http;
import 'package:product_repository/product_repository.dart';

class ActivityRepository {
  Future<List<Order>> getActivities(String token, String status) async {
    try {
      final uri = Uri.http(ApiRepository.baseUrl, "api/orders", {
        "status": status,
      });

      final response = await http.get(uri, headers: {
        "Authorization": "Bearer $token",
        "Accept": "application/json",
      });

      if (response.statusCode == 200) {
        final body = jsonDecode(response.body)["data"];
        final orders =
            (body as List).map((order) => Order.fromJson(order)).toList();

        return orders;
      } else {
        throw Exception("Error fetching activities: ${response.body}");
      }
    } catch (e) {
      rethrow;
    }
  }
}
