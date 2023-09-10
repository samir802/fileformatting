import 'package:fileformatting/controllers/dashboard/doctors_screen_controller.dart';
import 'package:fileformatting/models/all_doctors.dart';
import 'package:fileformatting/views/dashboard/doctor_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DoctorScreen extends StatelessWidget {
  DoctorScreen({super.key});

  final c = Get.put(DoctorScreenController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Doctors"),
        centerTitle: true,
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          c.doctorsDetails.clear();
          c.getDoctors();
        },
        child: SafeArea(
          child: Obx(
            () => c.loading.value
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : ListView.builder(
                    itemCount: c.doctorsDetails.length,
                    itemBuilder: (context, index) {
                      AllDoctors doctors = c.doctorsDetails[index];
                      return DoctorsListCard(
                        doctors: doctors,
                      );
                    },
                  ),
          ),
        ),
      ),
    );
  }
}

class DoctorsListCard extends StatelessWidget {
  const DoctorsListCard({
    super.key,
    required this.doctors,
  });

  final AllDoctors doctors;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(()=> SinglePage(doctors: doctors,));
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Column(
          children: [
            Row(
              children: [
                const SizedBox(
                  width: 20,
                ),
                CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage("${doctors.displayImage}"),
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Name: ${doctors.name ?? ""}",
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                    Text(
                      "Email: ${doctors.email ?? ""}",
                    ),
                    Text(
                      "Category: ${doctors.category ?? ""}",
                    ),
                    Text(
                      "Bio data: ${doctors.bioData ?? ""}",
                    ),
                    Text(
                      "Time: ${doctors.time ?? ""}",
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              children: [
                const SizedBox(
                  width: 20,
                ),
                Container(
                  width: 90,
                  height: 50,
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                      ),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(10))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Patients           ${doctors.patients ?? ""}",
                        style: const TextStyle(
                          fontSize: 12,
                        ),
                        textAlign: TextAlign.center,
                        maxLines: 2,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Container(
                  width: 90,
                  height: 50,
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                      ),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(10))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Experience           ${doctors.experience ?? ""}",
                        style: const TextStyle(
                          fontSize: 12,
                        ),
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Container(
                  width: 90,
                  height: 50,
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                      ),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(10))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Status        ${doctors.status ?? ""}",
                        style: const TextStyle(
                          fontSize: 12,
                        ),
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
