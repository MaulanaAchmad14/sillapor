import 'package:flutter/material.dart';
import 'package:importan_skripsi/home/history_page.dart';
import 'package:importan_skripsi/home/home_page.dart';
import 'package:importan_skripsi/home/profile_page.dart';
import 'package:importan_skripsi/home/report_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    Widget customBottomNav() {
      return ClipRRect(
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(20),
        ),
        child: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (value) {
            setState(() {
              currentIndex = value;
            });
          },
          backgroundColor: const Color(0xff4141A4),
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              icon: Container(
                margin: const EdgeInsets.only(
                  top: 20,
                  bottom: 10,
                ),
                child: Image.asset(
                  'assets/icon_home.png',
                  width: 23,
                  color:
                      currentIndex == 0 ? const Color(0xffffffff) : const Color(0xff989BA1),
                ),
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Container(
                margin: const EdgeInsets.only(
                  top: 20,
                  bottom: 10,
                ),
                child: Image.asset(
                  'assets/icon_report.png',
                  width: 23,
                  color:
                      currentIndex == 1 ? const Color(0xffffffff) : const Color(0xff989BA1),
                ),
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Container(
                margin: const EdgeInsets.only(
                  top: 20,
                  bottom: 10,
                ),
                child: Image.asset(
                  'assets/icon_history.png',
                  width: 23,
                  color:
                      currentIndex == 2 ? const Color(0xffffffff) : const Color(0xff989BA1),
                ),
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Container(
                margin: const EdgeInsets.only(
                  top: 20,
                  bottom: 10,
                ),
                child: Image.asset(
                  'assets/icon_user.png',
                  width: 23,
                  color:
                      currentIndex == 3 ? const Color(0xffffffff) : const Color(0xff989BA1),
                ),
              ),
              label: '',
            ),
          ],
        ),
      );
    }

    Widget body() {
      switch (currentIndex) {
        case 0:
          return const HomePage();
        case 1:
          return const ReportPage();
        case 2:
          return const HistoryPage();
        case 3:
          return const ProfilePage();

        default:
          return Container();
      }
    }

    return Scaffold(
      bottomNavigationBar: customBottomNav(),
      body: body(),
    );
  }
}
