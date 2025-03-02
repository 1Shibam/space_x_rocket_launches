import 'package:flutter/material.dart';
import 'package:space_x_rocket_launches/screens/launches_list_page.dart';
import 'package:space_x_rocket_launches/screens/rockets_list_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectPage = 0;
  void onItemTapped(int index) {
    setState(() {
      selectPage = index;
    });
  }

  final List<Widget> pages = [
    const LaunchesListPage(),
    const RocketsListPage()

    //5e9d0d95eda69955f709d1eb
    //5e9d0d95eda69973a809d1ec
    //5e9d0d96eda699382d09d1ee
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: PreferredSize(
                preferredSize: const Size.fromHeight(80.0), child: AppBar()),
            bottomNavigationBar: BottomNavigationBar(
              backgroundColor: Theme.of(context).primaryColor,
              currentIndex: selectPage,
              onTap: (value) {
                onItemTapped(value);
              },
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.search),
                  label: 'Search',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.details),
                  label: 'detail',
                ),
              ],
            ),
            body: AnimatedSwitcher(
                duration: const Duration(
                  milliseconds: 600,
                ),
                switchInCurve: Curves.easeIn,
                switchOutCurve: Curves.easeOut,
                child: pages[selectPage])));
  }
}
