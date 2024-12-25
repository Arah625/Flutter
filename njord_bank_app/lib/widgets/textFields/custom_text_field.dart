import 'package:flutter/material.dart';
import 'package:gradient_borders/gradient_borders.dart';
import 'package:njord_bank_app/colors/app_colors.dart'; // Adjust path as necessary

class CustomTextField extends StatelessWidget {
  final String hint;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final bool obscureText;
  final EdgeInsetsGeometry padding;

  const CustomTextField({
    super.key,
    required this.hint,
    required this.controller,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.padding = const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
  });

  @override
  Widget build(BuildContext context) {
    // Since we can't directly apply a gradient to the hint, we choose a solid color that complements the gradient.
    const hintStyle = TextStyle(color: Colors.amber);

    return Padding(
      padding: padding,
      child: TextField(
        controller: controller,
        keyboardType: keyboardType,
        obscureText: obscureText,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: hintStyle,
          border: GradientOutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            gradient: const LinearGradient(colors: goldGradient),
            width: 2.0,
          ),
          enabledBorder: GradientOutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            gradient: const LinearGradient(colors: goldGradient),
            width: 2.0,
          ),
          focusedBorder: GradientOutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            gradient: const LinearGradient(colors: goldGradient),
            width: 2.0,
          ),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
        ),
      ),
    );
  }
}
