List<BookingHistory> bookingHistoryFromJson(List<dynamic> bookingHistoryFromJson) =>
    List<BookingHistory>.from(bookingHistoryFromJson
        .map((bookingJson) => BookingHistory.fromJson(bookingJson)));

class BookingHistory {
  String? id;
  String? category;
  String? patients;
  String? experience;
  String? bioData;
  String? status;
  String? userId;
  String? time;
  String? displayImage;
  String? name;
  String? phone;
  String? email;
  String? password;
  String? type;
  String? doctorId;
  String? date;

  BookingHistory(
      {this.id,
      this.category,
      this.patients,
      this.experience,
      this.bioData,
      this.status,
      this.userId,
      this.time,
      this.displayImage,
      this.name,
      this.phone,
      this.email,
      this.password,
      this.type,
      this.doctorId,
      this.date});

  BookingHistory.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    category = json['category'];
    patients = json['patients'];
    experience = json['experience'];
    bioData = json['bio_data'];
    status = json['status'];
    userId = json['user_id'];
    time = json['time'];
    displayImage = json['display_image'];
    name = json['name'];
    phone = json['phone'];
    email = json['email'];
    password = json['password'];
    type = json['type'];
    doctorId = json['doctor_id'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['category'] = category;
    data['patients'] = patients;
    data['experience'] = experience;
    data['bio_data'] = bioData;
    data['status'] = status;
    data['user_id'] = userId;
    data['time'] = time;
    data['display_image'] = displayImage;
    data['name'] = name;
    data['phone'] = phone;
    data['email'] = email;
    data['password'] = password;
    data['type'] = type;
    data['doctor_id'] = doctorId;
    data['date'] = date;
    return data;
  }
}
