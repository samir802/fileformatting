import 'package:fileformatting/models/all_doctors.dart';
import 'package:fileformatting/repo/doctors_repo.dart';
import 'package:fileformatting/utils/custom_snackbar.dart';
import 'package:get/get.dart';

class DoctorScreenController extends GetxController {
  @override
  void onInit() {
    getDoctors();
    super.onInit();
  }

  RxBool loading = RxBool(false);
  RxList<AllDoctors> doctorsDetails = <AllDoctors>[].obs;
  getDoctors() async {
    loading.value = true;
    await DoctorsRepo.getDoctors(
      onSuccess: (allDoctors) {
        loading.value = false;
        doctorsDetails.addAll(allDoctors);
      },
      onError: ((message) {
        loading.value = false;
        CustomSnackBar.error(title: "Doctors", message: message);
      }),
    );
  }
}
