import 'package:space_x_rocket_launches/common_exports.dart';

class BuildTile extends StatelessWidget {
  const BuildTile({super.key, required this.title, required this.subtitle});

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 4.w),
      child: ListTile(
        tileColor: AppColors.darkAccent,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.r)),
        title: Text(
          title,
          style: Theme.of(context).textTheme.labelLarge,
        ),
        subtitle: Text(
          subtitle,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ),
    );
  }
}
