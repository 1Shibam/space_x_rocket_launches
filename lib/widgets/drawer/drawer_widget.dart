

import 'package:space_x_rocket_launches/common_exports.dart';

import 'all_drawer_tiles.dart';



class DrawerWidget extends StatelessWidget {
  const DrawerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final ScrollController drawerScrollController = ScrollController();
    return Drawer(
      backgroundColor: AppColors.darkAccent,
      child: ListView(
        controller: drawerScrollController,
        children: [
          DrawerHeader(
              child: Align(
            alignment: Alignment.bottomCenter,
            child: Text(
              'Menu',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
          )),
          const AllDrawerTiles()
        ],
      ),
    );
  }
}
