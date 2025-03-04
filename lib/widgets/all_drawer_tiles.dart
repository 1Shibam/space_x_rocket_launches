import 'package:flutter/material.dart';
import 'package:space_x_rocket_launches/screens/saved_launches_screen.dart';
import 'package:space_x_rocket_launches/screens/saved_rocket_screen.dart';
import 'package:space_x_rocket_launches/theme/app_colors.dart';
import 'package:url_launcher/url_launcher.dart';

class AllDrawerTiles extends StatelessWidget {
  const AllDrawerTiles({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        DrawerTile(
          onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const SavedLaunchesScreen())),
          iconName: Icons.bookmark,
          title: 'Launches',
        ),
        DrawerTile(
          iconName: Icons.bookmark,
          title: 'Rockets',
          onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const SavedRocketsScreen(),
              )),
        ),
        DrawerTile(
          iconName: Icons.info,
          title: 'About',
          onTap: () {},
        ),
        DrawerTile(
          iconName: Icons.source,
          title: 'Source-code',
          onTap: () async {
            await launchUrl(
                Uri.parse(
                    'https://github.com/1Shibam/space_x_rocket_launches'),
                mode: LaunchMode.externalApplication);
          },
        ),
      ],
    );
  }
}

class DrawerTile extends StatelessWidget {
  const DrawerTile(
      {super.key, this.onTap, required this.iconName, required this.title});

  final void Function()? onTap;
  final IconData iconName;
  final String title;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: Icon(
        iconName,
        color: AppColors.darkText,
      ),
      title: Text(
        title,
        style: Theme.of(context).textTheme.bodyLarge,
      ),
    );
  }
}
