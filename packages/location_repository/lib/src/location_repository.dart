import 'dart:convert';

import 'package:api_repository/api_repository.dart';
import 'package:http/http.dart' as http;
import 'package:location_repository/location_repository.dart';

class LocationRepository {
  Future<List<Store>> getAllStores(String token) async {
    try {
      final uri = Uri.http(ApiRepository.baseUrl, "api/stores");

      final response = await http.get(
        uri,
        headers: {
          "Authorization": "Bearer $token",
          "Accept": "application/json",
        },
      );

      if (response.statusCode == 200) {
        final body = jsonDecode(response.body)["data"];

        final stores =
            (body as List).map((store) => Store.fromJson(store)).toList();
        return stores;
      } else {
        throw Exception("Error fetching stores: ${response.reasonPhrase}");
      }
    } catch (e) {
      rethrow;
    }
  }
}
