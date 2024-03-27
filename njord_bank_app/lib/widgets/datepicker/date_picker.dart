import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:njord_bank_app/colors/constants.dart'; // Import your constants correctly
import 'package:njord_bank_app/widgets/button/button_with_label.dart'; // Ensure this path is correct

class CustomDatePicker extends StatefulWidget {
  final Function(DateTime) onDateSelected;

  const CustomDatePicker({super.key, required this.onDateSelected});

  @override
  // ignore: library_private_types_in_public_api
  _CustomDatePickerState createState() => _CustomDatePickerState();
}

class _CustomDatePickerState extends State<CustomDatePicker> {
  DateTime? _selectedDate;

  void _showDatePicker() async {
    DateTime now = DateTime.now();
    DateTime firstDate = DateTime(1900);
    DateTime lastDate = DateTime(now.year - 16, now.month, now.day);

    // Adjust initialDate to ensure it's within the valid range
    DateTime initialDate = _selectedDate ?? now;
    if (initialDate.isAfter(lastDate)) {
      initialDate = lastDate;
    } else if (initialDate.isBefore(firstDate)) {
      initialDate = firstDate;
    }

    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: firstDate,
      lastDate: lastDate,
      // Customize the look of your DatePicker here if needed
    );

    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
      widget.onDateSelected(picked);
    }
  }

  @override
  Widget build(BuildContext context) {
    // Use MediaQuery to ensure the button matches the text fields' width
    double padding =
        40.0; // Assuming there's 20.0 padding on each side for text fields
    double buttonWidth = MediaQuery.of(context).size.width - padding;

    return LabeledAnimatedButton(
      labelText: 'Select your birth date',
      buttonText: _selectedDate == null
          ? "dd.MM.yyyy"
          : DateFormat('dd.MM.yyyy').format(_selectedDate!),
      onPressed: _showDatePicker,
      gradientColors: goldGradient,
      textColor: pureWhite, // Assuming pureWhite is defined in your constants
      labelStyle: const TextStyle(
        color:
            textFieldBackgroundHint, // Assuming this is defined in your constants
        fontSize: 16,
      ),
      width: buttonWidth, // Adjusted to match text fields' width
      height: 50.0,
    );
  }
}






// import 'package:flutter/material.dart';
// import 'package:njord_bank_app/colors/constants.dart'; // Ensure you have goldGradient defined
// import 'package:njord_bank_app/widgets/button/custom_button.dart'; // Use your CustomButton

// class CustomDatePicker extends StatefulWidget {
//   final Function(DateTime) onDateSelected;

//   const CustomDatePicker({super.key, required this.onDateSelected});

//   @override
//   State<CustomDatePicker> createState() => _CustomDatePickerState();
// }

// class _CustomDatePickerState extends State<CustomDatePicker> {
//   DateTime selectedDate = DateTime.now();

//   Future<void> _selectDate(BuildContext context) async {
//     final DateTime? picked = await showDatePicker(
//       context: context,
//       initialDate: selectedDate,
//       firstDate: DateTime(1900),
//       lastDate: DateTime.now(),
//     );
//     if (picked != null && picked != selectedDate) {
//       setState(() {
//         selectedDate = picked;
//       });
//       widget.onDateSelected(picked);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return CustomButton(
//       label: 'Select your birth date',
//       onPressed: () => _selectDate(context),
//       gradientColors: goldGradient,
//       textColor: Colors.white,
//       width: double.infinity, // Adjust based on your layout needs
//       height: 50.0,
//     );
//   }
// }
