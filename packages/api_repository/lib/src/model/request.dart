enum RequestType { get, post, delete, patch, put, update }

class RequestModel {
  final String url;
  final String endpoint;
  final RequestType type;
  final Map data;

  RequestModel({
    // ANDROID
    // this.url = "10.0.2.2:8001",
    // REAL DEVICE IOS
    // this.url = "172.20.10.4:8000",
    /// SIMULATOR
    this.url = "127.0.0.1:8000",
    required this.endpoint,
    required this.type,
    required this.data,
  });
}
