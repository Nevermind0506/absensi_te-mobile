import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fl_chart/fl_chart.dart';

class HistoryCutiTab extends StatelessWidget {
  const HistoryCutiTab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 5, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Periode Cuti",
                      style: TextStyle(fontSize: 15, color: Colors.blue),
                    ),
                    SizedBox(height: 5),
                    Text(
                      "10 Januari 2023 - 10 Januari 2024",
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 5),
                    Divider(
                      height: 5,
                      color: Colors.black,
                    ),
                    SizedBox(height: 5),
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(10),
                          height: 150,
                          width: Get.width / 2.4,
                          child: Center(
                            child: PieChart(
                              PieChartData(
                                sections: [
                                  PieChartSectionData(
                                    color: Colors.green,
                                    value: 14,
                                  ),
                                  PieChartSectionData(
                                    color: Colors.red,
                                    value: 0,
                                  )
                                ],
                              ),
                              swapAnimationDuration:
                                  Duration(milliseconds: 150), // Optional
                              swapAnimationCurve: Curves.linear,
                            ),
                          ),
                        ),
                        Container(
                          height: 150,
                          width: Get.width / 2.4,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              RichText(
                                text: TextSpan(
                                  text: "Kuota Cuti ",
                                  style: TextStyle(color: Colors.blue),
                                  children: [
                                    TextSpan(
                                      text: "14",
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 5),
                              RichText(
                                text: TextSpan(
                                  text: "Pemakaian ",
                                  style: TextStyle(color: Colors.blue),
                                  children: [
                                    TextSpan(
                                      text: "0",
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 5),
                              RichText(
                                text: TextSpan(
                                  text: "Sisa Cuti ",
                                  style: TextStyle(color: Colors.blue),
                                  children: [
                                    TextSpan(
                                      text: "14",
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 5),
                              RichText(
                                text: TextSpan(
                                  text: "Berlaku Hingga ",
                                  style: TextStyle(color: Colors.blue),
                                  children: [
                                    TextSpan(
                                      text: "10/01/2024",
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 5),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              width: Get.width,
              height: 450,
              child: Center(
                child: Column(
                  children: [
                    Text("Belum ada aktivitas cuti"),
                    Image.asset("assets/images/cuti.png")
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
