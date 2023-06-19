import 'package:flutter/material.dart';

class EmployeeTab extends StatelessWidget {
  const EmployeeTab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return ListTile(
          leading: CircleAvatar(),
          title: Text('Nama'),
          subtitle: Text('Posisi'),
        );
      },
    );
  }
}
