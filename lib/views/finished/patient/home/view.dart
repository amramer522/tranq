import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wameed/core/logic/helper_methods.dart';
import 'package:wameed/views/finished/patient/home/pages/before_scan.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final iconList = <IconData>[
    Icons.home,
    Icons.message,
    Icons.qr_code_scanner,
    Icons.email,
    Icons.person,
  ];
  final pages = [
    Container(),
    Container(),
    BeforeScanView(),
    Container(),
    Container(),
  ];
  final titleList = <String>[
    "Home",
    "Chats",
    "Scan",
    "Motivzone",
    "Profile",
  ];
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.white,
        currentIndex: currentIndex,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        onTap: (value) {
          currentIndex = value;
          setState(() {});
        },
        items: List.generate(
          iconList.length,
          (index) => BottomNavigationBarItem(
            icon: Icon(iconList[index]),
            label: titleList[index],
          ),
        ),
      ),
    );
  }
}
