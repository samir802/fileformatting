List<AllDoctors> allDoctorsFromJson(List<dynamic> allDoctorsFromJson) =>
    List<AllDoctors>.from(allDoctorsFromJson
        .map((doctorsJson) => AllDoctors.fromJson(doctorsJson)));

class AllDoctors {
  String? id;
  String? category;
  String? patients;
  String? experience;
  String? bioData;
  String? status;
  String? name;
  String? email;
  String? displayImage;
  String? time;

  AllDoctors(
      {this.id,
      this.category,
      this.patients,
      this.experience,
      this.bioData,
      this.status,
      this.name,
      this.email,
      this.displayImage,
      this.time});

  AllDoctors.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    category = json['category'];
    patients = json['patients'];
    experience = json['experience'];
    bioData = json['bio_data'];
    status = json['status'];
    name = json['name'];
    email = json['email'];
    displayImage = json['display_image'];
    time = json['time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['category'] = category;
    data['patients'] = patients;
    data['experience'] = experience;
    data['bio_data'] = bioData;
    data['status'] = status;
    data['name'] = name;
    data['email'] = email;
    data['display_image'] = displayImage;
    data['time'] = time;
    return data;
  }
}
