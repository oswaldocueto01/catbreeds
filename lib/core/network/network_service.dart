import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

class NetworkService {
  // static final String url = dotenv.env['BASE_URL'].toString();
  // static final String header = dotenv.get('API_KEY_HEADER');

  static Future<dynamic> get({
    required String path,
  }) async {
    try {
      final response = await http.get(
        Uri.parse(('https://api.thecatapi.com/v1/breeds/$path')),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'x-api-key': 'live_u0oSGWiM6MO8u5RjLSViGt25TUpslJ9Ri1KLYmLnIh0UqxHK2iIyDcRrShoeciGp',
        },
      );
      return getResponse(response);
    } on SocketException {
      return Future.error(
          {"message": "Unable to establish connection to the server"});
    } catch (e) {
      return Future.error(e);
    }
  }

  // static Future<dynamic> post({
  //   required String path,
  //   required Map<String, dynamic> body,
  // }) async {
  //   try {
  //     final response = await http.post(
  //       Uri.parse(url + path),
  //       body: json.encode(body),
  //       headers: <String, String>{
  //         'x-api-key': header,
  //       },
  //     );
  //     return getResponse(response);
  //   } on SocketException {
  //     return Future.error(
  //         {"message": "Unable to establish connection to the server"});
  //   } catch (e) {
  //     return Future.error({"message": e.toString()});
  //   }
  // }
  //
  // static Future<dynamic> put({
  //   required String path,
  //   required Map<String, dynamic> body,
  // }) async {
  //   try {
  //     final response = await http.put(
  //       Uri.parse(url + path),
  //       body: json.encode(body),
  //       headers: {
  //         'x-api-key': header,
  //       },
  //     );
  //     return getResponse(response);
  //   } on SocketException {
  //     return Future.error(
  //         {"message": "Unable to establish connection to the server"});
  //   } catch (e) {
  //     return Future.error({"message": e.toString()});
  //   }
  // }

  static dynamic getResponse(http.Response response) {
    if (response.body.isEmpty &&
        response.statusCode >= 200 &&
        response.statusCode < 300) {
      return {"message": "", "code": response.statusCode};
    }

    if (response.body.isEmpty && response.statusCode >= 400) {
      return Future.error(
          {"message": "An error has occurred", "code": response.statusCode});
    }
    final decodedJson = json.decode(utf8.decode(response.bodyBytes));

    if (response.statusCode >= 200 && response.statusCode < 300) {
      return decodedJson;
    }

    if (response.statusCode >= 400) {
      return Future.error(decodedJson);
    }
  }
}
