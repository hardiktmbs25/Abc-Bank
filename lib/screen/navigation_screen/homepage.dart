import 'package:abc_bank/screen/navigation_screen/tab_pages/analysis_tab.dart';
import 'package:abc_bank/screen/navigation_screen/tab_pages/currency_tab.dart';
import 'package:abc_bank/screen/navigation_screen/tab_pages/other_tab.dart';
import 'package:abc_bank/screen/navigation_screen/tab_pages/profile/profile_tab.dart';
import 'package:abc_bank/screen/navigation_screen/tab_pages/setting_tab.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List<Widget> pages = [
    AnalysisTab(),
    CurrencyTab(),
    ProfileTab(),
    SettingTab(),
    OtherTab(),
  ];
  int current_index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[current_index],
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 30,
        backgroundColor: Color(0xffffffff),
        selectedItemColor: Color(0xff2b2eec),
        unselectedItemColor: Color(0xFF2E2E2E),
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.bar_chart), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.attach_money), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.more_horiz), label: ""),
        ],
        onTap: (value) {
          setState(() {
            current_index = value;
          });
        },
        currentIndex: current_index,
      ),
    );
  }
}
