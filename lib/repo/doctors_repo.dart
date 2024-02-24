import 'dart:convert';
import 'dart:developer';

import 'package:fileformatting/models/all_doctors.dart';
import 'package:fileformatting/utils/apis.dart';

import 'package:http/http.dart' as http;

class DoctorsRepo {
  static Future<void> getDoctors({
    required Function(List<AllDoctors> category) onSuccess,
    required Function(String message) onError,
  }) async {
    try {
      var header = {
        "Accept": "application/json",
        "Content-Type": "application/json",
      };
      http.Response response = await http.get(
        Uri.parse(Api.getDoctors),
        headers: header,
      );
      dynamic data = json.decode(response.body);
      if (response.statusCode >= 200 && response.statusCode < 300) {
        List<AllDoctors> doctors = allDoctorsFromJson(data["data"]);
        onSuccess(doctors);
      } else {
        onError(data['message']);
      }
    } catch (e) {
      log(e.toString());
      onError("Sorry! something went wrong");
    }
  }
}
