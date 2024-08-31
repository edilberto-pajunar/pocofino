import 'package:api_repository/api_repository.dart';
import 'package:http/http.dart' as http;

enum RequestType { get, post, delete, patch, put, update }

class RequestModel {
  final String url;
  final String endpoint;
  final RequestType type;
  final Map data;

  RequestModel({
    this.url = "10.0.2.2:8000",
    required this.endpoint,
    required this.type,
    required this.data,
  });
}
