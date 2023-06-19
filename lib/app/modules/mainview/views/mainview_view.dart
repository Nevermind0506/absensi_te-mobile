import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/mainview_controller.dart';

class MainviewView extends GetView<MainviewController> {
  const MainviewView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MainviewView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'MainviewView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
