import 'package:absensi_te/app/controllers/auth_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  TextEditingController emailC = TextEditingController();
  TextEditingController passC = TextEditingController();

  final authC = Get.find<MainController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'LOGIN',
                  style: TextStyle(
                    letterSpacing: 20,
                    fontSize: 25,
                  ),
                ),
                SizedBox(
                  height: 320,
                  child: Lottie.asset('assets/lottie/login_animation.json'),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextField(
                        controller: emailC,
                        autocorrect: false,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          contentPadding:
                              const EdgeInsets.symmetric(horizontal: 30),
                          labelText: 'Email',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Obx(
                        () {
                          return TextField(
                            controller: passC,
                            obscureText: controller.isHidden.value,
                            autocorrect: false,
                            decoration: InputDecoration(
                              contentPadding:
                                  const EdgeInsets.symmetric(horizontal: 30),
                              labelText: 'Password',
                              suffixIcon: Obx(
                                () {
                                  return IconButton(
                                    onPressed: () {
                                      controller.isHidden.toggle();
                                    },
                                    icon: Icon(
                                        (controller.isHidden.value == true)
                                            ? Icons.remove_red_eye_outlined
                                            : Icons.remove),
                                  );
                                },
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50),
                              ),
                            ),
                          );
                        },
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      SizedBox(
                        width: double.infinity,
                        height: 40,
                        child: ElevatedButton(
                          onPressed: () {
                            authC.login(emailC.text, passC.text);
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xff2B2D76),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50))),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text('LOGIN'),
                              SizedBox(
                                width: 5,
                              ),
                              Icon(Icons.login)
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
