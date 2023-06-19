import 'package:flutter/material.dart';

class HistoryIzinTab extends StatelessWidget {
  const HistoryIzinTab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      child: SingleChildScrollView(
        child: Column(
          children: [
            ListTile(
              leading: Text("1"),
              title: Text("Pulang Kampung"),
              subtitle: Text("21-24 April 2023"),
              trailing: Icon(Icons.done),
            ),
          ],
        ),
      ),
    );
  }
}
