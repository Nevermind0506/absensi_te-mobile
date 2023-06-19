import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/under_dev_controller.dart';

class UnderDevView extends GetView<UnderDevController> {
  const UnderDevView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('UnderDevView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'UnderDevView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
