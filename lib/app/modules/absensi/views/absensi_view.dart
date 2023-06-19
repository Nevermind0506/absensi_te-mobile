import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/absensi_controller.dart';

import '../../../controllers/auth_controller.dart';
import '../../home/controllers/home_controller.dart';

class AbsensiView extends GetView<AbsensiController> {
  final authC = Get.find<MainController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard Absensi'),
        elevation: 0,
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Container(
            height: 150,
            width: Get.width,
            color: Colors.blue,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                SizedBox(height: 20),
                Container(
                  child: Center(
                    child: Column(
                      children: [
                        Obx(
                          () => Text(
                            controller.timeString.value,
                            style: TextStyle(fontSize: 40, color: Colors.white),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          controller.getCurrentDate(),
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                        SizedBox(height: 20),
                        Card(
                          elevation: 4,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 15),
                            width: Get.width,
                            height: 250,
                            child: Column(
                              children: [
                                SizedBox(height: 10),
                                Center(
                                  child: Text(
                                    "Normal",
                                    style: TextStyle(
                                        fontSize: 18, color: Colors.grey),
                                  ),
                                ),
                                SizedBox(height: 20),
                                Center(
                                  child: Text(
                                    "08:16 AM - 05:00 PM",
                                    style: TextStyle(
                                        fontSize: 30,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                SizedBox(height: 20),
                                Divider(
                                  color:
                                      const Color.fromARGB(255, 207, 207, 207),
                                  thickness: 3,
                                ),
                                SizedBox(height: 15),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      width: Get.width / 2.5,
                                      child: Text("Status : - "),
                                    ),
                                    Container(
                                      width: Get.width / 2.5,
                                      child: Text("Keterangan : - "),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 30),
                                ElevatedButton(
                                  onPressed: () {},
                                  child: Text("Clock in"),
                                  style: ElevatedButton.styleFrom(
                                    minimumSize: Size(Get.width, 40),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Card(
                          elevation: 4,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          child: Container(
                              width: Get.width,
                              height: 300,
                              padding: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 15),
                              child: Column(
                                // crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 10),
                                  Text(
                                    "Riwayat Absensi",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Container(
                                    width: Get.width,
                                    height: 230,
                                    child: ListView.builder(
                                      itemCount: 10,
                                      itemBuilder: (context, index) {
                                        ListTile(
                                          title: Text(
                                              "Keterangan = Absensi Tepat Waktu"),
                                          leading: Text(
                                            "15 - 06 - 23",
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              )),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
