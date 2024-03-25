import 'package:flutter/material.dart';
import 'package:njord_bank_app/colors/constants.dart';
import 'package:njord_bank_app/utils/colors/gradients/gradient_text.dart'; // Import your constants

class TransparentTopAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  final String title;

  const TransparentTopAppBar({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: GradientText(
        text: title,
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
        colors:
            goldGradient, // Optionally specify the gradient colors, defaults to goldGradient
      ),
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
