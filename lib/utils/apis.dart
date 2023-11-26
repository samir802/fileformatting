class Api {
  static const String baseUrl = "http://192.168.1.66/kenny";

  static const String loginUrl = "$baseUrl/api/login.php";
  static const String registerUrl = "$baseUrl/api/register_user.php";

  static const String getHistory = "$baseUrl/api/get_appointments.php";
  static const String getDoctors = "$baseUrl/api/doctors.php";

  static const String addBooking = "$baseUrl/api/store_appointments.php";
}
