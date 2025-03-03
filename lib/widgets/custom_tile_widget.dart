import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:space_x_rocket_launches/theme/app_colors.dart';

class CustomListTileWidget extends StatelessWidget {
  const CustomListTileWidget(
      {super.key, required this.name, required this.title, this.onTap});

  final String name;
  final String title;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ListTile(
          onTap: onTap,
          tileColor: AppColors.darkAccent,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
          title: Text(
            title,
            style: Theme.of(context).textTheme.bodySmall,
          ),
          subtitle: Text(
            name,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          trailing: const Icon(
            Icons.zoom_out_map_outlined,
            color: AppColors.darkSubText,
          ),
        ),
        Divider(
          color: Theme.of(context).primaryColorDark,
        )
      ],
    );
  }
}
