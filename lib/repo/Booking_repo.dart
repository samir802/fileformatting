import 'dart:convert';
import 'dart:developer';
import '../utils/apis.dart';

import 'package:http/http.dart' as http;

import '../utils/httpRequest.dart';
import '../utils/storage_keys.dart';

class BookingRepo {
  static Future<void> addBooking({
    required String docId,
    required String date,
    required Function() onSuccess,
    required Function(String message) onError,
  }) async {
    try {
      var token = StorageHelper.getToken();
      var headers = {
        "Accept": "application/json",
      };
      var body = {
        "doctor_id": docId,
        "token": token,
        "date": date,
        "status": "pending",
      };
      http.Response response = await HttpRequest.post(Uri.parse(Api.addBooking),
          headers: headers, body: body);

      log(json.encode(body));
      log(response.body);

      dynamic data = jsonDecode(response.body);
      if (data["success"] == true) {
        onSuccess();
      } else {
        onError(data["message"]);
      }
    } catch (e, s) {
      log(e.toString());
      log(s.toString());
      onError("Sorry something went wrong");
    }
  }
}