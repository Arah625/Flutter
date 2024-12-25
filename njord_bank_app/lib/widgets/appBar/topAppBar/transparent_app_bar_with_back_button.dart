import 'package:flutter/material.dart';
import 'package:njord_bank_app/colors/app_colors.dart';
import 'package:njord_bank_app/navigation/navigation_service_with_loader.dart';
import 'package:njord_bank_app/utils/colors/gradients/gradient_icon.dart';
import 'package:njord_bank_app/utils/colors/gradients/gradient_text.dart';

class TransparentTopAppBarWithBackButton extends StatelessWidget
    implements PreferredSizeWidget {
  final String title;

  const TransparentTopAppBarWithBackButton({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: IconButton(
        icon: const GradientIcon(
          colors: goldGradient,
          center: Alignment.center,
          radius: 0.5,
          child: Icon(Icons.arrow_back, color: Colors.white, size: 30),
        ),
        onPressed: () => NavigationService.popWithLoader(context),
      ),
      title: GradientText(
        text: title,
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        colors: goldGradient,
        textAlign: TextAlign.center,
      ),
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
