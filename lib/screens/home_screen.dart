import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:space_x_rocket_launches/common_exports.dart';
import 'package:space_x_rocket_launches/screens/launches_list_page.dart';
import 'package:space_x_rocket_launches/screens/rockets_list_page.dart';
import 'package:space_x_rocket_launches/widgets/drawer/drawer_widget.dart';

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
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: PreferredSize(
                preferredSize: const Size.fromHeight(60.0),
                child: AppBar(
                  leading: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.w),
                    child: Builder(
                      builder: (context) => IconButton(
                          onPressed: () {
                            Scaffold.of(context).openDrawer();
                          },
                          icon: const Icon(Icons.menu)),
                    ),
                  ),
                  actions: [
                    Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.w),
                        child: Consumer(
                          builder: (context, ref, child) {
                            return IconButton(
                                onPressed: () {
                                  
                                  context.go(RouterName.splash);
                                },
                                icon: const Icon(Icons.refresh));
                          },
                        ))
                  ],
                  title: Text(
                    'Space-X',
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  centerTitle: true,
                )),
            drawer: const DrawerWidget(),
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
