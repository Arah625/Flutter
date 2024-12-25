import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:njord_bank_app/colors/app_colors.dart'; // Ensure correct import path

class GradientText extends StatelessWidget {
  final String text;
  final TextStyle? style; // Make style optional
  final List<Color> colors;
  final TextAlign textAlign;

  const GradientText({
    super.key,
    required this.text,
    this.style,
    this.colors = goldGradient, // Use your goldGradient
    this.textAlign = TextAlign.start,
  });

  @override
  Widget build(BuildContext context) {
    // Apply Google Fonts to the style. If style is not provided, default to a Google Font style.
    TextStyle effectiveStyle = style ?? GoogleFonts.roboto(fontSize: 14);
    return ShaderMask(
      shaderCallback: (bounds) => LinearGradient(
        colors: colors,
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
      ).createShader(Rect.fromLTWH(0, 0, bounds.width, bounds.height)),
      child: Text(
        text,
        textAlign: textAlign,
        style: effectiveStyle.copyWith(
            color: Colors.white), // Temp color for compatibility
      ),
    );
  }
}
