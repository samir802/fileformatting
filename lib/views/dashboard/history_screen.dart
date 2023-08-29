import 'package:fileformatting/controllers/dashboard/history_screen_controller.dart';
import 'package:fileformatting/models/booking_history.dart';
import 'package:fileformatting/utils/custom_text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:image_picker/image_picker.dart';

class HistoryScreen extends StatelessWidget {
  HistoryScreen({super.key});

  final c = Get.put(HistoryScreenController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("History"),
        centerTitle: true,
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          c.historyDetail.clear();
          c.getAllHistory();
        },
        child: SafeArea(
          child: Obx(
            () => c.loading.value
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : ListView.builder(
                    itemCount: c.historyDetail.length,
                    itemBuilder: (context, index) {
                      BookingHistory history = c.historyDetail[index];
                      return HistoryListCard(
                        history: history,
                      );
                    },
                  ),
          ),
        ),
      ),
    );
  }
}

class HistoryListCard extends StatelessWidget {
  const HistoryListCard({
    super.key,
    required this.history,
  });

  final BookingHistory history;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 19, right: 19, top: 20),
      child: Container(
        height: 120,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                offset: const Offset(4, 4),
                blurRadius: 9,
                color: const Color(0xFF494949).withOpacity(0.06),
              )
            ]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Doctor Name: ${history.name ?? ""}",
              style: CustomTextStyles.f14W400(),
            ),
            const SizedBox(
              height:9,
            ),
            Text("Doctor email: ${history.email ?? ""}",
            style: CustomTextStyles.f14W400(),)
          ],
        ),
      ),
    );
  }
}
