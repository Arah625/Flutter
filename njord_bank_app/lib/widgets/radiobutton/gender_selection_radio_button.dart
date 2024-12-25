// import 'package:flutter/material.dart';
// import 'package:njord_bank_app/colors/constants.dart'; // Contains the goldGradient
// import 'package:njord_bank_app/utils/colors/gradients/gradient_text.dart';
// import 'package:njord_bank_app/widgets/radiobutton/custom_gradient_radio_button.dart';

// enum Gender { male, female }

// class GenderSelectionRadioButton extends StatefulWidget {
//   final Function(Gender) onGenderSelected;

//   const GenderSelectionRadioButton({super.key, required this.onGenderSelected});

//   @override
//   // ignore: library_private_types_in_public_api
//   _GenderSelectionRadioButtonState createState() =>
//       _GenderSelectionRadioButtonState();
// }

// class _GenderSelectionRadioButtonState
//     extends State<GenderSelectionRadioButton> {
//   Gender? _selectedGender;

//   void _handleRadioValueChanged(Gender value) {
//     setState(() {
//       _selectedGender = value;
//     });
//     widget.onGenderSelected(value);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.center, // Ensure the row is centered
//       children: <Widget>[
//         GestureDetector(
//           onTap: () => _handleRadioValueChanged(Gender.male),
//           child: Row(
//             mainAxisSize: MainAxisSize.min, // Use min to prevent stretching
//             children: <Widget>[
//               CustomGradientRadioButton(
//                 isSelected: _selectedGender == Gender.male,
//                 onTap: () => _handleRadioValueChanged(Gender.male),
//                 borderGradient: goldGradient, // Pass the gradient for border
//                 innerCircleGradient:
//                     goldGradient, // Pass the color for the inner circle
//               ),
//               const Padding(
//                 padding: EdgeInsets.only(left: 8.0),
//                 child: GradientText(
//                   text: "Male",
//                   style: TextStyle(fontSize: 16),
//                   colors: goldGradient,
//                 ),
//               ),
//             ],
//           ),
//         ),
//         const SizedBox(width: 20), // Space between Male and Female options
//         GestureDetector(
//           onTap: () => _handleRadioValueChanged(Gender.female),
//           child: Row(
//             mainAxisSize: MainAxisSize.min, // Use min to prevent stretching
//             children: <Widget>[
//               CustomGradientRadioButton(
//                 isSelected: _selectedGender == Gender.female,
//                 onTap: () => _handleRadioValueChanged(Gender.female),
//                 borderGradient:
//                     goldGradient, // Pass the same or a different gradient for border
//                 innerCircleGradient:
//                     goldGradient, // Pass the color for the inner circle
//               ),
//               const Padding(
//                 padding: EdgeInsets.only(left: 8.0),
//                 child: GradientText(
//                   text: "Female",
//                   style: TextStyle(fontSize: 16),
//                   colors: goldGradient,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:njord_bank_app/colors/app_colors.dart'; // Make sure this import path is correct
import 'package:njord_bank_app/widgets/radiobutton/custom_gradient_radio_button.dart';

enum Gender { male, female }

class GenderSelectionRadioButton extends StatefulWidget {
  final Function(Gender) onGenderSelected;

  const GenderSelectionRadioButton({
    super.key,
    required this.onGenderSelected,
  });

  @override
  // ignore: library_private_types_in_public_api
  _GenderSelectionRadioButtonState createState() =>
      _GenderSelectionRadioButtonState();
}

class _GenderSelectionRadioButtonState
    extends State<GenderSelectionRadioButton> {
  Gender? selectedGender;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: InkWell(
            onTap: () {
              setState(() {
                selectedGender = Gender.male;
                widget.onGenderSelected(Gender.male);
              });
            },
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomGradientRadioButton(
                  isSelected: selectedGender == Gender.male,
                  onTap: () {
                    setState(() {
                      selectedGender = Gender.male;
                      widget.onGenderSelected(Gender.male);
                    });
                  },
                  borderGradient:
                      goldGradient, // Assuming goldGradient is defined in your constants
                  innerCircleGradient: selectedGender == Gender.male
                      ? goldGradient
                      : [Colors.transparent],
                ),
                const SizedBox(width: 8), // Provide some spacing
                const Text("Male", style: TextStyle(color: Colors.white)),
              ],
            ),
          ),
        ),
        Expanded(
          child: InkWell(
            onTap: () {
              setState(() {
                selectedGender = Gender.female;
                widget.onGenderSelected(Gender.female);
              });
            },
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomGradientRadioButton(
                  isSelected: selectedGender == Gender.female,
                  onTap: () {
                    setState(() {
                      selectedGender = Gender.female;
                      widget.onGenderSelected(Gender.female);
                    });
                  },
                  borderGradient: goldGradient,
                  innerCircleGradient: selectedGender == Gender.female
                      ? goldGradient
                      : [Colors.transparent],
                ),
                const SizedBox(width: 8), // Provide some spacing
                const Text("Female", style: TextStyle(color: Colors.white)),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
