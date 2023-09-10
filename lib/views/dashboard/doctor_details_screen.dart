import 'package:cached_network_image/cached_network_image.dart';
import 'package:fileformatting/models/all_doctors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/dashboard/home_screen_controller.dart';
import '../../utils/colors.dart';
import '../../utils/custom_snackbar.dart';
import '../../utils/custom_text_style.dart';
import '../../widgets/custom/custom_textfield.dart';
import '../../widgets/custom/elevated_button.dart';
import '../booking_screen.dart';

class SinglePage extends StatelessWidget {
  static const routeName = "/single_page";
  SinglePage({super.key, required this.doctors});

  final c = Get.put(HomeScreenController());
  final AllDoctors doctors;

  @override
  Widget build(BuildContext context) {
    // var theme = Theme.of(context);
    // var textTheme = theme.textTheme;

    return Scaffold(
      appBar: AppBar(
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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 17,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 37,
              ),
              child: Text(
                doctors.name ?? "",
                style: CustomTextStyles.f16W600(
                  color: AppColors.primaryColor,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 25, left: 25, top: 10),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: CachedNetworkImage(
                  placeholder: (context, url) =>
                      const Center(child: CircularProgressIndicator()),
                  fit: BoxFit.fill,
                  height: MediaQuery.of(context).size.height / 2.7,
                  imageUrl: doctors.displayImage ?? "",
                  errorWidget: (context, url, error) => Image.asset(
                    'assets/common/logo.png',
                    height: MediaQuery.of(context).size.height / 2.7,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 17,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    left: 41,
                    right: 37,
                    top: 18,
                  ),
                  child: Text(
                    "Doctor Info",
                    style:
                        CustomTextStyles.f14W400(color: AppColors.primaryColor),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 41,
                    right: 37,
                  ),
                  child: Text(
                    doctors.bioData ?? "",
                    style: CustomTextStyles.f14W400(),
                    textAlign: TextAlign.justify,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 41,
                    right: 37,
                    top: 18,
                  ),
                  child: Text(
                    "Category",
                    style:
                        CustomTextStyles.f14W400(color: AppColors.primaryColor),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 41,
                    right: 37,
                  ),
                  child: Text(
                    doctors.category ?? "",
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 41,
                    right: 37,
                    top: 18,
                  ),
                  child: Text(
                    "Email",
                    style:
                        CustomTextStyles.f14W400(color: AppColors.primaryColor),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 41,
                    right: 37,
                  ),
                  child: Text(
                    doctors.email ?? "",
                    style: CustomTextStyles.f14W400(),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 41,
                    right: 37,
                    top: 18,
                  ),
                  child: Text(
                    "Available time",
                    style:
                        CustomTextStyles.f14W400(color: AppColors.primaryColor),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 41,
                    right: 37,
                  ),
                  child: Container(
                    width: 140,
                    height: 40,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: const [
                          BoxShadow(blurRadius: 1, color: Colors.green)
                        ]),
                    child: Center(
                      child: Text(
                        doctors.time ?? "",
                        style: CustomTextStyles.f14W400(),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 41,
                    right: 37,
                    top: 18,
                  ),
                  child: Text(
                    "Experiecnce",
                    style:
                        CustomTextStyles.f14W400(color: AppColors.primaryColor),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 41,
                    right: 37,
                  ),
                  child: Text(
                    doctors.experience ?? "",
                    style: CustomTextStyles.f14W400(),
                  ),
                ),
                const IntrinsicHeight(
                  child: SizedBox(
                    height: 10,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
          margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          decoration: const BoxDecoration(color: Color(0xFFF8F8F8)),
          height: 60,
          width: MediaQuery.of(context).size.width,
          alignment: Alignment.center,
          child: CustomElevatedButton(
            onTap: () {
              showModalBottomSheet(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(45.0),
                  ),
                ),
                isScrollControlled: true,
                context: Get.context!,
                builder: ((context) {
                  return Padding(
                    padding: EdgeInsets.only(
                        top: 20,
                        right: 20,
                        left: 20,
                        bottom: MediaQuery.of(context).viewInsets.bottom),
                    child: Form(
                      key: c.dateKeys,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            height: 5,
                            width: 105,
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(100),
                            ),
                          ),
                          const SizedBox(
                            height: 22,
                          ),
                          CustomTextField(
                            onTap: () {
                              c.startChooseDate(context);
                            },
                            readOnly: true,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'This field is required';
                              } else if (value.length < 8) {
                                return "Password must be at least 8 characters";
                              }
                              return null;
                            },
                            preIconPath: (Icons.calendar_month),
                            controller: c.startDateController,
                            hint: "Select Booking Date",
                            textInputAction: TextInputAction.done,
                            textInputType: TextInputType.none,
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                          const SizedBox(
                            height: 28,
                          ),
                          CustomElevatedButton(
                            title: 'Continue',
                            onTap: () {
                              String selectedDate = c.startDateController.text;
                              String selectedTime = doctors.time.toString();

                              DateTime selectedDateTime =
                                  DateTime.parse("$selectedDate $selectedTime");
                              DateTime currentDateTime = DateTime.now();

                              if (selectedDateTime.isBefore(currentDateTime)) {
                                CustomSnackBar.error(
                                    title: "Time has passed",
                                    message: "Please choose a new date");
                              } else {
                                Get.to(() => Bookings(doc: doctors));
                              }
                            },
                          ),
                          const SizedBox(
                            height: 69,
                          ),
                        ],
                      ),
                    ),
                  );
                }),
              );
            },
            title: 'Book Now',
          )),
    );
  }
}
