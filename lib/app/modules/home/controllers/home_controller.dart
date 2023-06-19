import 'package:absensi_te/app/modules/home/widgets/employee_app_bar.dart';
import 'package:absensi_te/app/modules/home/widgets/his_app_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore db = FirebaseFirestore.instance;
  Stream<User?> get streamAuthStatus => auth.authStateChanges();
  var tabIndex = 0;

  void changeTabIndex(int index) {
    tabIndex = index;
    update();
  }

  tabBar() {
    if (tabIndex == 1) {
      return HisTabBar();
    } else if (tabIndex == 3) {
      return EmployeeAppBar();
    }
  }

  String truncateString(String text, int maxLength) {
    if (text.length <= maxLength) {
      return text;
    } else {
      return text.substring(0, maxLength) + "...";
    }
  }
}
