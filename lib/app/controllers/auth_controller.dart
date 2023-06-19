import 'dart:async';
import 'dart:convert';

import 'package:absensi_te/app/routes/app_pages.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore db = FirebaseFirestore.instance;

  RxMap userData = {}.obs;
  RxString isAdmin = ''.obs;

  Stream<User?> get streamAuthStatus => auth.authStateChanges();
  void signup(
    String nip,
    String nama,
    String email,
    String password,
    String notelp,
    String level,
    String kota,
  ) async {
    Get.defaultDialog(
      title: 'CREATE USER',
      middleText: 'Confirm create user',
      confirmTextColor: Colors.white,
      textConfirm: 'SUBMIT',
      onConfirm: () async {
        try {
          UserCredential myUser =
              await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: email,
            password: password,
          );
          final users = <String, String>{
            "nip": nip,
            "nama": nama,
            "email": email,
            "password": password,
            "notelp": notelp,
            "level": level,
            "kota": kota,
          };
          await db.collection("users").doc(myUser.user!.uid).set(users).onError(
                (e, _) => Get.snackbar('Error', 'Gagal Memasukkan data'),
              );
          await myUser.user!.sendEmailVerification();
          Get.back();
        } on FirebaseAuthException catch (e) {
          if (e.code == 'weak-password') {
            Get.snackbar('weak-password', 'The password provided is too weak.');
          } else if (e.code == 'email-already-in-use') {
            Get.snackbar('email-already-in-use',
                'The account already exists for that email.');
          }
        } catch (e) {
          Get.snackbar('uncaught error', '$e');
        }
      },
      textCancel: 'CANCEL',
    );
  }

  login(String email, String password) async {
    try {
      UserCredential myUser =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Retrieve the user document from Firestore
      DocumentSnapshot userDoc =
          await db.collection("users").doc(myUser.user!.uid).get();

      // Read the user's data from the document
      Map<String, dynamic>? userDataMap =
          userDoc.data() as Map<String, dynamic>?;

      if (userDataMap != null) {
        userData.value = userDataMap;

        // Use the user data wherever needed
        print(userData['nip']);
        print(userData['nama']);
        // ...

        // Store the user data in SharedPreferences
        await persistUserData();

        if (myUser.user!.emailVerified) {
          String initialRoute;
          if (userData['level'] == 'admin') {
            isAdmin.value = 'admin';
            initialRoute = Routes.ADMIN;
          } else {
            isAdmin.value = 'user';
            initialRoute = Routes.HOME;
          }

          await persistUserRole(); // Store the user role

          Get.offAllNamed(initialRoute);
        } else {
          Get.defaultDialog(
            title: 'Email Verified',
            middleText: 'Didn\'t get the email? Click "Yes"',
            confirmTextColor: Colors.white,
            textConfirm: 'Yes',
            onConfirm: () async {
              await myUser.user!.sendEmailVerification();
              Get.back();
            },
            textCancel: 'No',
            onCancel: () {
              Get.back();
            },
          );
        }
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Get.snackbar('user-not-found', 'No user found for that email.');
      } else if (e.code == 'wrong-password') {
        Get.snackbar(
            'wrong-password', 'Wrong password provided for that user.');
      }
    }
  }

  Future<void> persistUserRole() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('role', isAdmin.value);
  }

  Future<void> loadPersistedUserRole() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String persistedRole = prefs.getString('role') ?? '';
    isAdmin.value = persistedRole;
  }

  Future<void> persistUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('userData', json.encode(userData.value));
  }

  Future<void> loadPersistedUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? persistedData = prefs.getString('userData');
    if (persistedData != null) {
      userData.value = RxMap<String, dynamic>(
        json.decode(persistedData),
      );
    }
  }

  Future<void> updateUserDataFromFirestore(String userId) async {
    DocumentSnapshot userDoc = await db.collection("users").doc(userId).get();
    Map<String, dynamic>? userDataMap = userDoc.data() as Map<String, dynamic>?;

    if (userDataMap != null) {
      userData.value = userDataMap;

      // Store the updated user data in SharedPreferences
      await persistUserData();
    }
  }

  void logout() async {
    await FirebaseAuth.instance.signOut();
    Get.offAllNamed(Routes.LOGIN);
  }
}
