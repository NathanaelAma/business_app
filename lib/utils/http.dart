import 'dart:io';
import 'package:http/http.dart';

class HttpService {
  final Client _client;

  const HttpService(this._client);

  Future<String> get(String url) async {
    Uri uri = Uri.parse(url);
    var response = await _client.get(uri);
    checkAndThrowError(response);
    return response.body;
  }

  Future<String> post(String url, {Map<String, String>? headers, body}) async {
    Uri uri = Uri.parse(url);
    var response = await _client.post(uri, headers: headers, body: body);
    checkAndThrowError(response);
    return response.body;
  }

  Future<String> put(String url, {Map<String, String>? headers, body}) async {
    Uri uri = Uri.parse(url);
    var response = await _client.put(uri, headers: headers, body: body);
    checkAndThrowError(response);
    return response.body;
  }

  Future<String> delete(String url, {Map<String, String>? headers}) async {
    Uri uri = Uri.parse(url);
    var response = await _client.delete(uri, headers: headers);
    checkAndThrowError(response);
    return response.body;
  }

  static void checkAndThrowError(Response response) {
    if (response.statusCode != HttpStatus.ok) throw Exception(response.body);
  }
}
