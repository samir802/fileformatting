
import 'dart:convert';
import 'dart:developer';

import 'package:fileformatting/models/booking_history.dart';
import 'package:fileformatting/utils/apis.dart';

import 'package:http/http.dart' as http;

class HistoryRepo{
  static Future<void> getHistory({
    required Function(List<BookingHistory> category) onSuccess,
    required Function(String message) onError,
  })async{
    try{
      var header={
        "Accept": "application/json",
        "Content-Type":"application/json",
      };
      http.Response response = await http.get(
        Uri.parse("${Api.getHistory}"),
        headers:header,
      );
      dynamic data = json.decode(response.body);
      if(response.statusCode >= 200 && response.statusCode < 300){
        List<BookingHistory> doctors = bookingHistoryFromJson(data["data"]);
        onSuccess(doctors);
      }else{
        onError(data['message']);
      }
    }catch(e){
      log(e.toString());
      onError("Sorry! something went wrong");
    }
  }
}