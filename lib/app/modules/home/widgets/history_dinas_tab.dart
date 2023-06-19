import 'package:flutter/material.dart';

class HistoryDinasTab extends StatelessWidget {
  const HistoryDinasTab({
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
              Text("Belum ada aktivitas perjalanan dinas"),
              SizedBox(height: 20),
              Container(
                height: 300,
                child: Image.asset("assets/images/dinas.png"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
