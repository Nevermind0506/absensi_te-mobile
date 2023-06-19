import 'dart:convert';

import 'package:absensi_te/app/data/models/province_model.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../../controllers/auth_controller.dart';
import '../../../data/models/city_model.dart';
import '../controllers/add_employee_controller.dart';

class AddEmployeeView extends GetView<AddEmployeeController> {
  final authC = Get.find<MainController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('Add Employee'),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Color.fromARGB(255, 106, 187, 254),
                Color.fromARGB(251, 1, 109, 197),
              ],
            ),
          ),
        ),
      ),
      body: Stack(
        children: [
          Container(
            width: Get.width,
            height: Get.height,
            color: Color.fromARGB(255, 244, 244, 244),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Card(
              elevation: 2,
              child: Container(
                height: Get.height,
                child: ListView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Container(
                        height: 200,
                        child: Image.asset('assets/images/employee.png'),
                      ),
                    ),
                    Divider(thickness: 1),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          /// Text field untuk NIP
                          TextField(
                            autofocus: true,
                            keyboardType: TextInputType.number,
                            controller: controller.nipC,
                            autocorrect: false,
                            textInputAction: TextInputAction.next,
                            decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 30),
                              labelText: 'NIP',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),

                          /// Text field untuk Nama
                          TextField(
                            controller: controller.nameC,
                            autocorrect: false,
                            textInputAction: TextInputAction.next,
                            decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 30),
                              labelText: 'Nama',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),

                          /// Text field untuk Unit
                          // TextField(
                          //   controller: controller.unitC,
                          //   autocorrect: false,
                          //   textInputAction: TextInputAction.next,
                          //   decoration: InputDecoration(
                          //     contentPadding:
                          //         EdgeInsets.symmetric(horizontal: 30),
                          //     labelText: 'Unit',
                          //     border: OutlineInputBorder(
                          //       borderRadius: BorderRadius.circular(10),
                          //     ),
                          //   ),
                          // ),
                          // SizedBox(
                          //   height: 20,
                          // ),

                          /// Text field untuk Email
                          TextField(
                            keyboardType: TextInputType.emailAddress,
                            controller: controller.emailC,
                            autocorrect: false,
                            textInputAction: TextInputAction.next,
                            decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 30),
                              labelText: 'Email',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),

                          /// Text field untuk Password
                          TextField(
                            controller: controller.passC,
                            autocorrect: false,
                            textInputAction: TextInputAction.next,
                            decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 30),
                              labelText: 'Password',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),

                          /// Text field untuk No telpon
                          TextField(
                            controller: controller.notelpC,
                            keyboardType: TextInputType.phone,
                            autocorrect: false,
                            textInputAction: TextInputAction.next,
                            decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 30),
                              labelText: 'No Telepon',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),

                          SizedBox(
                            height: 20,
                          ),

                          /// DropdownSearch untuk Level User
                          DropdownSearch<String>(
                            items: [
                              "Admin",
                              "User",
                            ],
                            mode: Mode.MENU,
                            dropdownSearchDecoration: InputDecoration(
                              labelText: 'Level',
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 15),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            onChanged: (value) {
                              controller.levelC.text = value!;
                            },
                          ),

                          SizedBox(
                            height: 20,
                          ),

                          /// DropdownSearch untuk Provinsi

                          DropdownSearch<Province>(
                            showSearchBox: true,
                            popupItemBuilder: (context, item, isSelected) =>
                                ListTile(
                              title: Text('${item.name}'),
                            ),
                            dropdownSearchDecoration: InputDecoration(
                              labelText: 'Provinsi',
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 15),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            onFind: (text) async {
                              var response = await http.get(
                                Uri.parse(
                                    'https://api.goapi.id/v1/regional/provinsi?api_key=s72bn1UaCwjAe00gXGX1EvUySqwAr6'),
                              );
                              var decodedResponse =
                                  jsonDecode(response.body) as Map;
                              return Province.fromJsonList(
                                  decodedResponse['data']);
                            },
                            onChanged: (value) =>
                                controller.provinceId.value = value?.id ?? '0',
                          ),
                          SizedBox(
                            height: 20,
                          ),

                          /// DropdownSearch untuk kota

                          DropdownSearch<City>(
                            showSearchBox: true,
                            popupItemBuilder: (context, item, isSelected) =>
                                ListTile(
                              title: Text('${item.name}'),
                            ),
                            dropdownSearchDecoration: InputDecoration(
                              labelText: 'Kota',
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 15),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            onFind: (text) async {
                              var response = await http.get(Uri.parse(
                                  'https://api.goapi.id/v1/regional/kota?provinsi_id=${controller.provinceId}&api_key=s72bn1UaCwjAe00gXGX1EvUySqwAr6'));
                              var decodedResponse =
                                  jsonDecode(response.body) as Map;
                              return City.fromJsonList(decodedResponse['data']);
                            },
                            onChanged: (value) {
                              controller.cityC.text = '$value';
                            },
                          ),
                          SizedBox(
                            height: 20,
                          ),

                          SizedBox(
                            width: double.infinity,
                            height: 40,
                            child: ElevatedButton(
                              onPressed: () {
                                authC.signup(
                                  controller.nipC.text,
                                  controller.nameC.text,
                                  controller.emailC.text,
                                  controller.passC.text,
                                  controller.notelpC.text,
                                  controller.levelC.text,
                                  controller.cityC.text,
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xfff9a52d),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50),
                                ),
                              ),
                              child: Text('SUBMIT'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
