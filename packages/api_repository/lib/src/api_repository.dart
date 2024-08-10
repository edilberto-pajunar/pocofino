class ApiRepository {
  static String baseUrl = "10.0.2.2:8000";
  static Map<String, String> headers = {
    "Accept": "application/json",
  };

  Future<void> callApi({
    required String path,
    required String body,
  }) async {
    final uri = Uri.http(baseUrl, path);
  }
}
