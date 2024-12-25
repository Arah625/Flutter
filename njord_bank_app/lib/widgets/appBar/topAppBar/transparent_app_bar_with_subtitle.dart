import 'package:flutter/material.dart';
import 'package:njord_bank_app/colors/app_colors.dart';
import 'package:njord_bank_app/utils/colors/gradients/gradient_text.dart';

class TransparentTopAppBarWithSubtitle extends StatelessWidget
    implements PreferredSizeWidget {
  final String title;
  final String subtitle;

  const TransparentTopAppBarWithSubtitle({
    super.key,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          GradientText(
            text: title,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            colors: goldGradient,
          ),
          GradientText(
            text: subtitle,
            style: const TextStyle(
                fontSize: 14), // Smaller font size for the subtitle
            colors: goldGradient,
          ),
        ],
      ),
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(
      kToolbarHeight + 20); // Increased height to accommodate subtitle
}
