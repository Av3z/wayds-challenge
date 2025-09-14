import 'package:http/http.dart';
import 'dart:convert';
import 'package:wayds_challenge/app/core/network/domain/network_manager.dart';

class NetworkManagerHTTP extends NetworkManager {
  final Client http;

  NetworkManagerHTTP(this.http);

  @override
  Future<T> delete<T>(String url, {Map<String, String>? headers}) async {
    final response = await http.delete(Uri.parse(url), headers: headers);
    return jsonDecode(response.body);
  }

  @override
  Future<T> get<T>(String url, {Map<String, String>? headers}) async {
    final response = await http.get(Uri.parse(url), headers: headers);
    return jsonDecode(response.body);
  }

  @override
  Future<T> post<T>(String url, {Map<String, String>? headers, body}) async {
    final response = await http.post(Uri.parse(url), headers: headers, body: body);
    return jsonDecode(response.body);
  }

  @override
  Future<T> put<T>(String url, {Map<String, String>? headers, body}) async {
    final response = await http.put(Uri.parse(url), headers: headers, body: body);
    return jsonDecode(response.body);
  }
}
