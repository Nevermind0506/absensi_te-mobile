import 'package:flutter/material.dart';

class HisTabBar extends StatelessWidget implements PreferredSizeWidget {
  const HisTabBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 5,
      elevation: 0,
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Color.fromARGB(255, 106, 187, 254),
              Color.fromARGB(251, 1, 109, 197),
            ],
          ),
        ),
      ),
      bottom: const TabBar(
        tabs: <Widget>[
          Tab(
            text: "Cuti",
          ),
          Tab(
            text: "Izin",
          ),
          Tab(
            text: "Sakit",
          ),
          Tab(
            text: "Dinas",
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
