import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khalti_flutter/khalti_flutter.dart';

import '../controllers/dashboard/history_screen_controller.dart';
import '../controllers/dashboard/home_screen_controller.dart';
import '../utils/colors.dart';
import '../utils/custom_snackbar.dart';
import '../utils/custom_text_style.dart';
import '../utils/image_path.dart';

class PaymentScreen extends StatelessWidget {
  PaymentScreen({super.key, required this.docId, required this.bookDate});

  final String docId;
  final String bookDate;

  final c = Get.put(HomeScreenController());
  final con = Get.put(HistoryScreenController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Payment",
          style: CustomTextStyles.f14W400(),
        ),
        // backgroundColor: theme.colorScheme.tertiary,
        elevation: 0.5,
        shadowColor: const Color(0xFF494949).withOpacity(0.06),
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: const Padding(
            padding: EdgeInsets.only(left: 20),
            child: Icon(
              Icons.arrow_back,
              // color: theme.colorScheme.secondary,
            ),
          ),
        ),
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 22,
        ),
        child: Column(
          children: [
            InkWell(
              onTap: () {
                // Get.offAllNamed(DashScreen.routeName);
                KhaltiScope.of(context).pay(
                  config: PaymentConfig(
                    amount: 1000,
                    productIdentity: "productIdentity",
                    productName: "productName",
                  ),
                  preferences: [
                    PaymentPreference.khalti,
                  ],
                  onSuccess: (success) {
                    c.addBooking(docId, bookDate);
                    con.historyDetail.clear();
                    con.getAllHistory();
                  },
                  onFailure: (fa) {
                    CustomSnackBar.error(
                        title: "Payment", message: "Payment Failure");
                  },
                  onCancel: () {
                    CustomSnackBar.info(
                        title: "Payment", message: "Payment Cancel");
                  },
                );
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                decoration: BoxDecoration(
                  color: AppColors.backGroundColor,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                        offset: const Offset(1, 1),
                        spreadRadius: 1,
                        color: const Color(0xFF494949).withOpacity(0.1),
                        blurRadius: 9),
                  ],
                ),
                child: Row(
                  children: [
                    Image.asset(
                      ImagePath.loginBGImage,
                      height: 46,
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    Text(
                      "Khalti",
                      style: CustomTextStyles.f16W400(),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
