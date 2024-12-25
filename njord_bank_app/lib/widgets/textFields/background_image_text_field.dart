import 'package:flutter/material.dart';
import 'package:gradient_borders/gradient_borders.dart';
import 'package:njord_bank_app/colors/app_colors.dart'; // Import your constants

class BackGroundImageTextField extends StatelessWidget {
  final String hint;
  final String label; // Add a label property
  final TextEditingController controller;
  final TextInputType keyboardType;
  final bool obscureText;
  final EdgeInsetsGeometry padding;

  const BackGroundImageTextField({
    super.key,
    required this.hint,
    required this.label, // Initialize the label
    required this.controller,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.padding = const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
  });

  @override
  Widget build(BuildContext context) {
    // Light blue, but still transparent background
    final Color lightBlueTransparent = textFieldBackground
        .withOpacity(0.5); // Assuming lightBlue is defined in your constants

    return Padding(
      padding: padding,
      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment.start, // Align the label to the start
        children: [
          Text(
            label, // Display the label
            style: const TextStyle(
              color:
                  textFieldBackgroundHint, // Use your theme or specific color for the label
              fontSize: 16, // Adjust the font size according to your design
            ),
          ),
          const SizedBox(height: 6), // Space between label and text field
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 6,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: TextField(
              controller: controller,
              keyboardType: keyboardType,
              obscureText: obscureText,
              cursorColor: textFieldBackgroundHint, // Change the cursor color
              decoration: InputDecoration(
                hintText: hint,
                hintStyle: const TextStyle(
                    color: textFieldBackgroundHint,
                    fontStyle: FontStyle.italic),
                border: GradientOutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  gradient: const LinearGradient(colors: goldGradient),
                  width: 1.5,
                ),
                enabledBorder: GradientOutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  gradient: const LinearGradient(colors: goldGradient),
                  width: 1.5,
                ),
                focusedBorder: GradientOutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  gradient: const LinearGradient(colors: goldGradient),
                  width: 2.3,
                ),
                contentPadding: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 20.0),
                fillColor:
                    lightBlueTransparent, // Set the partially transparent light blue as the fill color
                filled: true,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
