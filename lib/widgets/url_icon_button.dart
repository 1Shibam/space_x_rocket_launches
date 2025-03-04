import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:space_x_rocket_launches/theme/app_colors.dart';
import 'package:space_x_rocket_launches/widgets/custom_snackbar.dart';
import 'package:url_launcher/url_launcher.dart';

class UrlIconButton extends StatelessWidget {
  const UrlIconButton(
      {super.key,
      required this.imageUrl,
      required this.link,
      required this.title});
  final String imageUrl;
  final String link;
  final String title;

  Future<void> _launchURL(BuildContext context) async {
    final Uri uri = Uri.parse(link);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      if (context.mounted) {
        customSnackBar(
            'Couldn\'t launch the URL', const Duration(seconds: 2), context,
            bgColor: AppColors.errorRed);
      }
      debugPrint("Could not launch $link");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 8.h),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
        decoration: BoxDecoration(
            color: AppColors.darkAccent,
            borderRadius: BorderRadius.circular(20.r)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.labelLarge,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SvgPicture.asset(
                  imageUrl,
                  width: 40.w,
                  height: 40.h,
                ),
                IconButton(
                    onPressed: () async {
                      try {
                        _launchURL(context);
                      } catch (e) {
                        debugPrint('lmao');
                      }
                    },
                    icon: const Icon(
                      Icons.launch,
                      color: AppColors.darkText,
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
