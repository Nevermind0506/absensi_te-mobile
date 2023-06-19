import 'package:get/get.dart';
import 'package:intl/intl.dart';

class AbsensiController extends GetxController {
  RxString timeString = ''.obs;

  @override
  void onInit() {
    super.onInit();
    // Panggil fungsi untuk memperbarui waktu setiap detik
    updateTime();
  }

  void updateTime() {
    DateTime now = DateTime.now();
    String formattedTime = DateFormat('HH:mm a').format(now);
    timeString.value = formattedTime;
    // Perbarui waktu setiap detik
    Future.delayed(Duration(seconds: 1), updateTime);
  }

  String getCurrentDate() {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('EEEE, MMMM d, y').format(now);
    return formattedDate;
  }
}
