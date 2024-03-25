import 'package:flutter/material.dart';
import 'package:njord_bank_app/colors/constants.dart'; // Ensure you have goldGradient defined
import 'package:njord_bank_app/widgets/button/custom_button.dart'; // Use your CustomButton

class CustomDatePicker extends StatefulWidget {
  final Function(DateTime) onDateSelected;

  const CustomDatePicker({super.key, required this.onDateSelected});

  @override
  State<CustomDatePicker> createState() => _CustomDatePickerState();
}

class _CustomDatePickerState extends State<CustomDatePicker> {
  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
      widget.onDateSelected(picked);
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      label: 'Select your birth date',
      onPressed: () => _selectDate(context),
      gradientColors: goldGradient,
      textColor: Colors.white,
      width: double.infinity, // Adjust based on your layout needs
      height: 50.0,
    );
  }
}
