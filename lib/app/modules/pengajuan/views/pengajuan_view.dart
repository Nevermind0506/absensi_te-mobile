import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../controllers/pengajuan_controller.dart';
import 'package:dropdown_search/dropdown_search.dart';

import '../../../controllers/auth_controller.dart';

class PengajuanView extends GetView<PengajuanController> {
  final authC = Get.find<MainController>();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          flexibleSpace: Container(
            decoration: BoxDecoration(
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
          title: Text("Pengajuan"),
          centerTitle: true,
          bottom: TabBar(tabs: [
            Tab(
              text: "Cuti",
            ),
            Tab(
              text: "Izin",
            ),
            Tab(
              text: "Dinas",
            ),
          ]),
        ),
        body: TabBarView(
          children: [
            //Awal Tab 1
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 40),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 20),
                    Column(
                      children: [
                        Container(
                          child: DropdownSearch<String>(
                            mode: Mode.MENU,
                            showSelectedItems: true,
                            items: controller.jenisCuti,
                            dropdownSearchDecoration: InputDecoration(
                              labelText: "Jenis Cuti",
                              hintText: "",
                            ),
                            onChanged: (value) {
                              controller.valDdJenisCuti.value = "${value}";
                              print(controller.valDdJenisCuti.value);
                            },
                            selectedItem: "Pilih Jenis Cuti",
                          ),
                        ),
                        SizedBox(height: 10),
                        Container(
                          child: DropdownSearch<String>(
                            mode: Mode.MENU,
                            showSelectedItems: true,
                            items: controller.pengganti,
                            dropdownSearchDecoration: InputDecoration(
                              labelText: "Nama Pengganti",
                              hintText: "",
                            ),
                            onChanged: (value) {
                              controller.valDdPenggantiCuti.value = "${value}";
                              print(controller.valDdPenggantiCuti.value);
                              controller.selectedJenis.value = "cuti";
                            },
                            selectedItem: "Pilih Pengganti",
                          ),
                        ),
                        SizedBox(height: 30),
                        Container(
                          child: TextField(
                            controller: controller.valDateAwalCuti,
                            decoration: InputDecoration(
                              suffixIcon: Icon(Icons.calendar_today),
                              labelText: "Masukkan Tanggal Awal Cuti",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            readOnly: true,
                            onTap: () async {
                              DateTime? pickedDate = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime.now(),
                                lastDate: DateTime(2040),
                              );
                              if (pickedDate != null) {
                                print(pickedDate);
                                String formattedDate =
                                    DateFormat('dd-MM-yyyy').format(pickedDate);
                                print(formattedDate);
                                controller.valDateAwalCuti.text = formattedDate;
                              } else {
                                print("Date is not selected");
                              }
                            },
                          ),
                        ),
                        SizedBox(height: 10),
                        Container(
                          child: TextField(
                            controller: controller.valDateAkhirCuti,
                            decoration: InputDecoration(
                              suffixIcon: Icon(Icons.calendar_today),
                              labelText: "Masukkan Tanggal Akhir Cuti",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            readOnly: true,
                            onTap: () async {
                              DateTime? pickedDate = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime.now(),
                                lastDate: DateTime(2040),
                              );
                              if (pickedDate != null) {
                                print(pickedDate);
                                String formattedDate =
                                    DateFormat('dd-MM-yyyy').format(pickedDate);
                                print(formattedDate);
                                controller.valDateAkhirCuti.text =
                                    formattedDate;
                              } else {
                                print("Date is not selected");
                              }
                            },
                          ),
                        ),
                        SizedBox(height: 10),
                        Container(
                          child: TextField(
                            controller: controller.valKeteranganCuti,
                            autocorrect: false,
                            decoration: InputDecoration(
                              labelText: "Keterangan",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 15),
                        ElevatedButton(
                          style: ButtonStyle(
                            fixedSize:
                                MaterialStateProperty.all(Size(Get.width, 50)),
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                          ),
                          onPressed: () {
                            print("User: ${authC.userData['nama']}");
                            print(
                                "Pengajuan : ${controller.selectedJenis.value}");
                            print(
                                "Jenis Cuti : ${controller.valDdJenisCuti.value}");
                            print(
                                "Nama Pengganti : ${controller.valDdPenggantiCuti.value}");
                            print(
                                "Tanggal Awal Cuti : ${controller.valDateAwalCuti.text}");
                            print(
                                "Tanggal Akhir Cuti : ${controller.valDateAkhirCuti.text}");
                            print(
                                "Keterangan : ${controller.valKeteranganCuti.text}");
                            Get.defaultDialog(
                              title: "Konfirmasi",
                              middleText:
                                  "Pastikan data sudah lengkap, klik 'ok' untuk konfirmasi",
                              onConfirm: () {},
                            );
                          },
                          child: Text("Ajukan Cuti"),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            //akhir Tab 1
            //Awal Tab 2
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 40),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 20),
                    Column(
                      children: [
                        Container(
                          child: DropdownSearch<String>(
                            mode: Mode.MENU,
                            showSelectedItems: true,
                            items: controller.jenisIzin,
                            dropdownSearchDecoration: InputDecoration(
                              labelText: "Jenis Izin",
                              hintText: "",
                            ),
                            onChanged: (value) {
                              controller.valDdJenisIzin.value = "${value}";
                              print(controller.valDdJenisIzin.value);
                            },
                            selectedItem: "Pilih Jenis Izin",
                          ),
                        ),
                        SizedBox(height: 30),
                        Container(
                          child: TextField(
                            controller: controller.valDateAwalIzin,
                            decoration: InputDecoration(
                              suffixIcon: Icon(Icons.calendar_today),
                              labelText: "Masukkan Tanggal Awal Izin",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            readOnly: true,
                            onTap: () async {
                              DateTime? pickedDate = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime.now(),
                                lastDate: DateTime(2040),
                              );
                              if (pickedDate != null) {
                                print(pickedDate);
                                String formattedDate =
                                    DateFormat('dd-MM-yyyy').format(pickedDate);
                                print(formattedDate);
                                controller.valDateAwalIzin.text = formattedDate;
                              } else {
                                print("Date is not selected");
                              }
                            },
                          ),
                        ),
                        SizedBox(height: 10),
                        Container(
                          child: TextField(
                            controller: controller.valDateAkhirIzin,
                            decoration: InputDecoration(
                              suffixIcon: Icon(Icons.calendar_today),
                              labelText: "Masukkan Tanggal Akhir Izin",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            readOnly: true,
                            onTap: () async {
                              DateTime? pickedDate = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime.now(),
                                lastDate: DateTime(2040),
                              );
                              if (pickedDate != null) {
                                print(pickedDate);
                                String formattedDate =
                                    DateFormat('dd-MM-yyyy').format(pickedDate);
                                print(formattedDate);
                                controller.valDateAkhirIzin.text =
                                    formattedDate;
                              } else {
                                print("Date is not selected");
                              }
                            },
                          ),
                        ),
                        SizedBox(height: 10),
                        Container(
                          child: TextField(
                            controller: controller.valKeteranganIzin,
                            autocorrect: false,
                            decoration: InputDecoration(
                              labelText: "Keterangan",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 85),
                        ElevatedButton(
                          style: ButtonStyle(
                            fixedSize:
                                MaterialStateProperty.all(Size(Get.width, 50)),
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                          ),
                          onPressed: () {
                            print(
                                "Pengajuan : ${controller.selectedJenis.value}");
                            print(
                                "Jenis Izin : ${controller.valDdJenisIzin.value}");

                            print(
                                "Tanggal Awal Izin : ${controller.valDateAwalIzin.text}");
                            print(
                                "Tanggal Akhir Izin : ${controller.valDateAkhirIzin.text}");
                            print(
                                "Keterangan : ${controller.valKeteranganIzin.text}");
                          },
                          child: Text("Ajukan Izin"),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            //Akir Tab 2
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 40),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 20),
                    Container(
                      child: DropdownSearch<String>(
                        mode: Mode.MENU,
                        showSelectedItems: true,
                        items: controller.personil,
                        dropdownSearchDecoration: InputDecoration(
                          labelText: "Personil",
                          hintText: "",
                        ),
                        onChanged: (value) {
                          controller.valNamaPersonil.value = "${value}";
                          print(controller.valNamaPersonil.value);
                        },
                        selectedItem: "Pilih Personil",
                      ),
                    ),
                    SizedBox(height: 30),
                    Container(
                      child: TextField(
                        controller: controller.valPerihalDinas,
                        autocorrect: false,
                        decoration: InputDecoration(
                          labelText: "Perihal",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
                    Container(
                      child: TextField(
                        controller: controller.valDateAwalDinas,
                        decoration: InputDecoration(
                          suffixIcon: Icon(Icons.calendar_today),
                          labelText: "Masukkan Tanggal Awal Dinas",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        readOnly: true,
                        onTap: () async {
                          DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime.now(),
                            lastDate: DateTime(2040),
                          );
                          if (pickedDate != null) {
                            print(pickedDate);
                            String formattedDate =
                                DateFormat('dd-MM-yyyy').format(pickedDate);
                            print(formattedDate);
                            controller.valDateAwalDinas.text = formattedDate;
                          } else {
                            print("Date is not selected");
                          }
                        },
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      child: TextField(
                        controller: controller.valDateAkhirDinas,
                        decoration: InputDecoration(
                          suffixIcon: Icon(Icons.calendar_today),
                          labelText: "Masukkan Tanggal Akhir Dinas",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        readOnly: true,
                        onTap: () async {
                          DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime.now(),
                            lastDate: DateTime(2040),
                          );
                          if (pickedDate != null) {
                            print(pickedDate);
                            String formattedDate =
                                DateFormat('dd-MM-yyyy').format(pickedDate);
                            print(formattedDate);
                            controller.valDateAkhirDinas.text = formattedDate;
                          } else {
                            print("Date is not selected");
                          }
                        },
                      ),
                    ),
                    SizedBox(height: 30),
                    ElevatedButton(
                      style: ButtonStyle(
                        fixedSize:
                            MaterialStateProperty.all(Size(Get.width, 50)),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),
                      onPressed: () {
                        print(
                            "Nama Personil : ${controller.valNamaPersonil.value}");
                        print("Perihal : ${controller.valPerihalDinas.text}");
                        print(
                            "Tanggal Awal Dinas : ${controller.valDateAwalDinas.text}");
                        print(
                            "Tanggal Akhir Dinas : ${controller.valDateAkhirDinas.text}");
                      },
                      child: Text("Ajukan Dinas"),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
