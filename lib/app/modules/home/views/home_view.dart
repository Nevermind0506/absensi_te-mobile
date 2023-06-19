import 'package:absensi_te/app/modules/home/widgets/account_tab.dart';
import 'package:absensi_te/app/modules/home/widgets/history_cuti_tab.dart';
import 'package:absensi_te/app/modules/home/widgets/history_dinas_tab.dart';
import 'package:absensi_te/app/modules/home/widgets/history_izin_tab.dart';
import 'package:absensi_te/app/modules/home/widgets/history_sakit_tab.dart';
import 'package:absensi_te/app/modules/home/widgets/statistik_tab.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import '../../../controllers/auth_controller.dart';
import '../controllers/home_controller.dart';
import '../widgets/home_tab.dart';

class HomeView extends StatelessWidget {
  final authC = Get.find<MainController>();
  final homeC = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) {
        return DefaultTabController(
          initialIndex: 0,
          length: 4,
          child: Scaffold(
            appBar: (controller.tabIndex == 1) ? controller.tabBar() : null,
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
