import 'package:flutter/material.dart';
import 'package:njord_bank_app/widgets/datepicker/date_picker.dart';
import 'package:njord_bank_app/widgets/radiobutton/gender_selection_radio_button.dart';
import 'package:njord_bank_app/widgets/textFields/background_image_text_field.dart';
import 'package:njord_bank_app/widgets/appBar/topAppBar/transparent_app_bar_with_back_button.dart';
import 'package:njord_bank_app/widgets/button/custom_button.dart';
import 'package:njord_bank_app/colors/constants.dart';

class StepPersonalData extends StatelessWidget {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController secondNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();

  StepPersonalData({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: const TransparentTopAppBarWithBackButton(
        title: "Personal Information",
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                "assets/images/registration/registration_personal_data.webp"), // Adjust path as necessary
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              SizedBox(
                  height: MediaQuery.of(context).size.height *
                      0.1), // Adjust spacing to move content below AppBar
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      BackGroundImageTextField(
                        hint: 'First Name',
                        controller: firstNameController,
                        keyboardType: TextInputType.name,
                      ),
                      const SizedBox(height: 20),
                      BackGroundImageTextField(
                        hint: 'Second Name (Optional)',
                        controller: secondNameController,
                        keyboardType: TextInputType.name,
                      ),
                      const SizedBox(height: 20),
                      BackGroundImageTextField(
                        hint: 'Last Name',
                        controller: lastNameController,
                        keyboardType: TextInputType.name,
                      ),
                      const SizedBox(height: 20),
                      CustomDatePicker(
                        onDateSelected: (date) {
                          // Handle selected date
                        },
                      ),
                      const SizedBox(height: 20),
                      GenderSelectionRadioButton(
                        onGenderSelected: (gender) {
                          // Handle selected gender
                        },
                      ),
                      const SizedBox(height: 40), // Adjust based on your need
                      CustomButton(
                        label: 'Next',
                        onPressed: () {
                          //  onPressed: () => NavigationService.navigateWithLoader(context, StepPersonalData()),
                          // Navigate to the next step
                        },
                        gradientColors: goldGradient,
                        textColor: pureWhite,
                        width: double.infinity,
                        height: 50.0,
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height *
                              0.1), // Adjust bottom spacing
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
