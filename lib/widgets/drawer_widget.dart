import 'package:flutter/material.dart';

import 'package:space_x_rocket_launches/theme/app_colors.dart';
import 'package:space_x_rocket_launches/widgets/all_drawer_tiles.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
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
          const AllDrawerTiles()
        ],
      ),
    );
  }
}
