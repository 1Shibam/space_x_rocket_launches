import 'package:space_x_rocket_launches/common_exports.dart';
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
          onTap: () => context.push(RouterName.savedRocket),
          iconName: Icons.bookmark,
          title: 'Launches',
        ),
        DrawerTile(
            iconName: Icons.bookmark,
            title: 'Rockets',
            onTap: () => context.push(RouterName.savedRocket)),
        DrawerTile(
          iconName: Icons.source,
          title: 'Source-code',
          onTap: () async {
            await launchUrl(
                Uri.parse('https://github.com/1Shibam/space_x_rocket_launches'),
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
