import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../repo/Booking_repo.dart';
import '../../utils/custom_snackbar.dart';
import '../../views/dashboard/dash_screen.dart';

class HomeScreenController extends GetxController {
  final dateKeys = GlobalKey<FormState>();
  TextEditingController startDateController = TextEditingController();
  var startSelectedDate = DateTime.now().obs;

  startChooseDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(
          DateTime.now().year, DateTime.now().month, DateTime.now().day),
      lastDate: DateTime(2050),
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(),
          child: child ?? Container(),
        );
      },
    );
    if (pickedDate != null) {
      startSelectedDate.value = pickedDate;
      startDateController.text =
          startSelectedDate.value.toString().split(" ")[0];
      log('--------->>>>>>>>>>>>${startDateController.text.toString()}');
    }
  }

  RxBool loading = RxBool(false);
  addBooking(String id, String date) async {
    loading.value = true;
    await BookingRepo.addBooking(
      date: date,
      docId: id,
      onSuccess: () {
        loading.value = false;
        Get.offAll(() => DashScreen());
        CustomSnackBar.success(
            title: "Booking", message: "Booking is done sucessfully");
      },
      onError: ((message) {
        loading.value = false;
        CustomSnackBar.error(title: "Booking", message: message);
      }),
    );
  }
}
