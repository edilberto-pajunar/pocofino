import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:api_repository/src/model/request.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

class ApiRepository {
  static http.Client client = http.Client();

  static Uri uri(baseUrl) => Uri.parse(baseUrl);
  static String baseUrl = "10.0.2.2:8000";

  static headers() async {
    return {
      HttpHeaders.acceptHeader: "application/json",
      HttpHeaders.authorizationHeader:
          "Bearer ${await const FlutterSecureStorage().read(key: "token")}",
      HttpHeaders.contentTypeHeader: "application/json; charset=utf-8",
    };
  }

  send(RequestModel req) async {
    late http.Response httpResponse;
    var url = uri(req.url + req.endpoint);
    log("Called API: $url");

    if (req.type == RequestType.get) {
      httpResponse = await client.get(url, headers: await headers());
    } else if (req.type == RequestType.post) {
      httpResponse = await client.post(
        url,
        headers: await headers(),
        body: jsonEncode(req.data),
      );
    } else if (req.type == RequestType.delete) {
      httpResponse = await client.delete(
        url,
        headers: await headers(),
        body: jsonEncode(req.data),
      );
    } else if (req.type == RequestType.patch) {
      httpResponse = await client.patch(
        url,
        headers: await headers(),
        body: jsonEncode(req.data),
      );
    } else if (req.type == RequestType.put) {
      // TODO implement method here
      throw "request not implemented.";
    } else if (req.type == RequestType.update) {
      // TODO implement method here
      throw "request not implemented.";
    }

    debugPrint(
        "/////////////////////////////////////////////////////////////////////////////////////////////////////");

    if (httpResponse.statusCode == 200) {
      log("API Success!");
      return jsonDecode(httpResponse.body);
    } else if (httpResponse.statusCode == 500) {
      throw "Something went wrong";
    } else {
      log("API Error: ${httpResponse.statusCode} ${httpResponse.body}");
      var error = jsonDecode(httpResponse.body);
      if (error.containsKey("errors")) {
        return error;
      } else {
        throw error["message"];
      }
    }
  }

  static void cancelApiCall() {
    client.close();
    client = http.Client();
  }
}
