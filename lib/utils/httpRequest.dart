import 'dart:developer';
import 'package:http/http.dart' as http;

class HttpRequest {
  static Future<http.Response> post(Uri url,
      {Map<String, String>? headers, Object? body}) async {
    try {
      http.Response response =
          await http.post(url, headers: headers, body: body);

      if (response.statusCode == 401) {}
      return response;
    } catch (e, s) {
      log(e.toString());
      log(s.toString());
      throw "Server Error";
    }
  }

  static Future<http.Response> get(Uri url,
      {Map<String, String>? headers}) async {
    try {
      http.Response response = await http.get(url, headers: headers);

      if (response.statusCode == 401) {
        // logout from coreController
      }
      return response;
    } catch (e) {
      log(e.toString());
      throw "Server Error";
    }
  }

  static Future<http.StreamedResponse> multiPart(
      http.MultipartRequest request) async {
    try {
      http.StreamedResponse response = await request.send();

      if (response.statusCode == 401) {
        // logout from coreController
      }
      return response;
    } catch (e) {
      throw "Server Error";
    }
  }
}
