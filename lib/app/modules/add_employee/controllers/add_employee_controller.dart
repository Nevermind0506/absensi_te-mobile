import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class AddEmployeeController extends GetxController {
  final db = FirebaseFirestore.instance;

  TextEditingController nipC = TextEditingController();
  TextEditingController nameC = TextEditingController();
  // TextEditingController unitC = TextEditingController();
  TextEditingController emailC = TextEditingController();
  TextEditingController passC = TextEditingController();
  TextEditingController notelpC = TextEditingController();
  TextEditingController levelC = TextEditingController();
  TextEditingController provinceCx = TextEditingController();
  TextEditingController cityC = TextEditingController();

  RxString provinceId = ''.obs;
  RxString cityId = ''.obs;
}
