import 'package:fileformatting/models/all_doctors.dart';
import 'package:fileformatting/views/payment_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/core_controller.dart';
import '../controllers/dashboard/home_screen_controller.dart';
import '../utils/custom_text_style.dart';
import '../widgets/custom/date_row_value.dart';
import '../widgets/custom/dotted_line.dart';
import '../widgets/custom/elevated_button.dart';

class Bookings extends StatelessWidget {
  Bookings({super.key, required this.doc});

  final AllDoctors doc;
  final c = Get.put(HomeScreenController());
  final coreController = Get.put(CoreController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Booking Details",
          style: CustomTextStyles.f14W400(),
        ),
        // backgroundColor: theme.colorScheme.tertiary,
        elevation: 5,
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
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(left: 20, right: 20, top: 40),
                padding: const EdgeInsets.symmetric(vertical: 20),
                width: double.infinity,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      offset: const Offset(4, 4),
                      blurRadius: 9,
                      color: const Color(0xFF494949).withOpacity(0.1),
                    ),
                  ],
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        "Details",
                        style: CustomTextStyles.f16W400(),
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    DataRowValue(
                      title1: "Name",
                      title2: "${coreController.currentUser.value?.name}",
                      data1: "Email",
                      data2: "${coreController.currentUser.value?.email}",
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    DataRowValue(
                      title1: "Doctor",
                      title2: doc.name,
                      data1: "Doctor email",
                      data2: doc.email,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    DataRowValue(
                      title1: "Doctor category",
                      title2: doc.category,
                      data1: "Booking date",
                      data2: c.startDateController.text,
                    ),
                    const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                      child: HorizontalDottedLine(),
                    ),
                    const DataRowValue(
                      title1: "Basic Ticket Price",
                      title2: "1000",
                      data1: '',
                      data2: "",
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              CustomElevatedButton(
                  title: "Continue",
                  onTap: () {
                    Get.to(() => PaymentScreen(
                          bookDate: c.startDateController.text,
                          docId: doc.id.toString(),
                        ));
                  })
            ],
          ),
        ),
      ),
    );
  }
}
