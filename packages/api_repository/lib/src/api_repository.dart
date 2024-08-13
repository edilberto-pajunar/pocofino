import 'dart:async';

class ApiRepository<T> {
  static String baseUrl = "10.0.2.2:8000";
  static Map<String, String> headers = {
    "Accept": "application/json",
  };

  FutureOr<T?> callApi({
    required String path,
    required String body,
    required 
  }) async {
    final uri = Uri.http(baseUrl, path);
    return null;
  }
}
