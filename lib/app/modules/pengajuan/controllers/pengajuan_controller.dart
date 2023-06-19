import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PengajuanController extends GetxController {
  var selectedJenis = "".obs;
  //Cuti
  var valDdJenisCuti = "".obs;
  var valDdPenggantiCuti = "".obs;

  List<String> jenisCuti = [
    "Tahunan",
    "Melahirkan",
    "Menikah",
    "Duka",
    "Kelahiran",
    "Lainnya",
  ];

  TextEditingController valDateAwalCuti = TextEditingController();
  TextEditingController valDateAkhirCuti = TextEditingController();
  TextEditingController valKeteranganCuti = TextEditingController();

  // Izin
  var valDdJenisIzin = "".obs;
  var valDdPenggantiIzin = "".obs;

  List<String> jenisIzin = [
    "Tidak Masuk Kerja",
    "Tidak Mengabsen",
    "Datang Terlambat",
    "Pulang Lebih Awal",
    "Meninggalkan Kerja Selama Jam Kerja",
    "Lainnya",
  ];

  TextEditingController valDateAwalIzin = TextEditingController();
  TextEditingController valDateAkhirIzin = TextEditingController();
  TextEditingController valKeteranganIzin = TextEditingController();

  // Dinas
  List<String> personil = [
    "David Maulana",
    "Wildan Khalid",
    "Anargya Prabaswara",
    "Surya Rizky",
    "Muhammad Raffa",
    "Nanda Arifa",
  ];

  var valNamaPersonil = "".obs;
  TextEditingController valPerihalDinas = TextEditingController();
  TextEditingController valDateAwalDinas = TextEditingController();
  TextEditingController valDateAkhirDinas = TextEditingController();

  // Global
  List<String> pengganti = [
    "David Maulana",
    "Wildan Khalid",
    "Anargya Prabaswara",
    "Surya Rizky",
    "Muhammad Raffa",
    "Nanda Arifa",
  ];
}
