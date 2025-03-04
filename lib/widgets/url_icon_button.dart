import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:space_x_rocket_launches/theme/app_colors.dart';
import 'package:space_x_rocket_launches/widgets/custom_snackbar.dart';
import 'package:url_launcher/url_launcher.dart';

class UrlIconButton extends StatelessWidget {
  const UrlIconButton({super.key, required this.imageUrl, required this.link});
  final String imageUrl;
  final String link;

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
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SvgPicture.asset(imageUrl, height: 24, width: 24),
        const SizedBox(width: 8), // Proper spacing
        IconButton(
          onPressed: () => _launchURL(context), // Pass context here
          icon: const Icon(
            Icons.launch,
            color: AppColors.darkText,
          ),
        )
      ],
    );
  }
}
