import 'package:flutter/material.dart';
import 'package:space_x_rocket_launches/screens/launches_list_page.dart';
import 'package:space_x_rocket_launches/screens/rockets_list_page.dart';
import 'package:space_x_rocket_launches/theme/app_colors.dart';

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
                preferredSize: const Size.fromHeight(60.0),
                child: AppBar(
                  leading: Builder(
                    builder: (context) => IconButton(
                        onPressed: () {
                          Scaffold.of(context).openDrawer();
                        },
                        icon: const Icon(Icons.menu)),
                  ),
                  title: Text(
                    'Space-X',
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  centerTitle: true,
                )),
            drawer: Drawer(
              backgroundColor: AppColors.darkAccent,
              child: ListView(
                children: [
                  DrawerHeader(
                      child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Text(
                      'Menu',
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                  )),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ListTile(
                        leading: const Icon(
                          Icons.bookmark,
                          color: AppColors.darkText,
                        ),
                        title: Text(
                          'Launches',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ),
                      ListTile(
                        leading: const Icon(
                          Icons.bookmark,
                          color: AppColors.darkText,
                        ),
                        title: Text(
                          'Rockets',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ),
                      ListTile(
                        leading: const Icon(
                          Icons.info,
                          color: AppColors.darkText,
                        ),
                        title: Text(
                          'About',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ),
                      ListTile(
                        leading: const Icon(
                          Icons.source,
                          color: AppColors.darkText,
                        ),
                        title: Row(
                          children: [
                            Text(
                              'Source-Code',
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: selectPage,
              onTap: (value) {
                onItemTapped(value);
              },
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.search),
                  label: 'Launches',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.rocket),
                  label: 'Rockets',
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
