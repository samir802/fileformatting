import 'package:fileformatting/models/booking_history.dart';
import 'package:fileformatting/repo/history_repo.dart';
import 'package:fileformatting/utils/custom_snackbar.dart';
import 'package:get/get.dart';

class HistoryScreenController extends GetxController {
  @override
  void onInit() {
    getAllHistory();
    super.onInit();
  }

  RxBool loading = RxBool(false);
  RxList<BookingHistory> historyDetail = <BookingHistory>[].obs;
  getAllHistory() async {
    loading.value = true;
    await HistoryRepo.getHistory(
      onSuccess: (allDoctors) {
        loading.value = false;
        historyDetail.addAll(allDoctors);
      },
      onError: ((message) {
        loading.value = false;
        CustomSnackBar.error(title: "History", message: message);
      }),
    );
  }
}
