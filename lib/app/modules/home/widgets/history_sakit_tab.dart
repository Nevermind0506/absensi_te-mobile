import 'package:flutter/material.dart';

class HistorySakitTab extends StatelessWidget {
  const HistorySakitTab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 20),
              Text("Belum ada aktivitas sakit"),
              SizedBox(height: 20),
              Container(
                height: 300,
                child: Image.asset("assets/images/sakit.png"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
