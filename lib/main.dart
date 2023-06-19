import 'package:absensi_te/app/controllers/auth_controller.dart';
import 'package:absensi_te/app/modules/splashscreen/views/splashscreen_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app/routes/app_pages.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final authC = Get.put(MainController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Future.wait([
        Future.delayed(Duration(seconds: 2)),
        authC.loadPersistedUserRole(), // Load persisted user role
      ]),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return StreamBuilder(
            stream: authC.streamAuthStatus,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.active) {
                return GetMaterialApp(
                  title: "Application",
                  debugShowCheckedModeBanner: false,
                  initialRoute: (snapshot.data == null)
                      ? Routes.LOGIN
                      : (authC.isAdmin.value == 'Admin')
                          ? Routes.ADMIN
                          : Routes.HOME,
                  getPages: AppPages.routes,
                );
              }
              return SplashscreenView();
            },
          );
        }
        return SplashscreenView();
      },
    );
  }
}
