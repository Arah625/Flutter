import 'package:flutter/material.dart';
import 'package:njord_bank_app/colors/app_colors.dart';

class CustomGradientCheckbox extends StatelessWidget {
  final bool value;
  final ValueChanged<bool> onChanged;
  final String? label;
  final bool isRequired;
  final bool showError; // Added to control error display

  const CustomGradientCheckbox({
    super.key,
    required this.value,
    required this.onChanged,
    this.label,
    this.isRequired = false,
    this.showError = false, // Defaults to false
  });

  @override
  Widget build(BuildContext context) {
    Color borderColor =
        showError ? Colors.red : goldGradient[0]; // Updated logic
    Color labelColor = showError
        ? Colors.red
        : textFieldBackgroundHint; // Assuming this is a defined color in your theme

    return InkWell(
      onTap: () => onChanged(!value),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            decoration: BoxDecoration(
              color: value ? goldGradient[1] : Colors.transparent,
              border: Border.all(color: borderColor, width: 2),
              borderRadius: BorderRadius.circular(4),
            ),
            width: 24,
            height: 24,
            child: value
                ? const Icon(Icons.check, size: 20, color: Colors.white)
                : null,
          ),
          if (label != null) ...[
            const SizedBox(width: 8),
            Text(label!, style: TextStyle(color: labelColor)),
          ],
        ],
      ),
    );
  }
}
