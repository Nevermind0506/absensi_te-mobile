import 'package:flutter/material.dart';
import 'package:absensi_te/app/modules/home/widgets/account_tab.dart';
import 'package:absensi_te/app/modules/home/widgets/history_cuti_tab.dart';
import 'package:absensi_te/app/modules/home/widgets/history_dinas_tab.dart';
import 'package:absensi_te/app/modules/home/widgets/history_izin_tab.dart';
import 'package:absensi_te/app/modules/home/widgets/history_sakit_tab.dart';
import 'package:absensi_te/app/modules/home/widgets/statistik_tab.dart';

import 'package:get/get.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import '../controllers/home_controller.dart';
import '../widgets/employee_tab.dart';
import '../widgets/home_tab.dart';

class AdminView extends GetView {
  const AdminView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) {
        return DefaultTabController(
          initialIndex: 0,
          length: 4,
          child: Scaffold(
            appBar: (controller.tabIndex == 1 || controller.tabIndex == 3)
                ? controller.tabBar()
                : null,
            body: IndexedStack(
              index: controller.tabIndex,
              children: [
                HomeTab(),
                const TabBarView(
                  children: [
                    HistoryCutiTab(),
                    HistoryIzinTab(),
                    HistorySakitTab(),
                    HistoryDinasTab(),
                  ],
                ),
                StatisticTab(),
                EmployeeTab(),
                AccountTab(),
              ],
            ),
            bottomNavigationBar: SalomonBottomBar(
              currentIndex: controller.tabIndex,
              onTap: controller.changeTabIndex,
              items: [
                /// Home
                SalomonBottomBarItem(
                  icon: const Icon(Icons.home_outlined),
                  title: const Text("Home"),
                  selectedColor: Colors.blue,
                ),

                /// Likes
                SalomonBottomBarItem(
                  icon: const Icon(Icons.history_outlined),
                  title: const Text("History"),
                  selectedColor: Colors.amber,
                ),

                /// Search
                SalomonBottomBarItem(
                  icon: const Icon(Icons.insert_chart_outlined),
                  title: const Text("Statistic"),
                  selectedColor: Colors.green,
                ),

                /// Search
                SalomonBottomBarItem(
                  icon: const Icon(Icons.account_balance_outlined),
                  title: const Text("Employee"),
                  selectedColor: Colors.purple,
                ),

                /// Profile
                SalomonBottomBarItem(
                  icon: const Icon(Icons.person_outline),
                  title: const Text("Account"),
                  selectedColor: Colors.red,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
