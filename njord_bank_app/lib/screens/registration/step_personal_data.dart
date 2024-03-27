import 'package:flutter/material.dart';
import 'package:njord_bank_app/colors/constants.dart';
import 'package:njord_bank_app/widgets/datepicker/date_picker.dart';
import 'package:njord_bank_app/widgets/radiobutton/gender_selection_radio_button.dart';
import 'package:njord_bank_app/widgets/textFields/background_image_text_field.dart';
import 'package:njord_bank_app/widgets/appBar/topAppBar/transparent_app_bar_with_back_button.dart';
import 'package:njord_bank_app/widgets/button/custom_button.dart';

class StepPersonalData extends StatelessWidget {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController secondNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController peselNumberControler = TextEditingController();

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
                "assets/images/registration/registration_personal_data.webp"),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: LayoutBuilder(
            builder: (context, constraints) {
              return SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: constraints.maxHeight),
                  child: IntrinsicHeight(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.1),
                        BackGroundImageTextField(
                          label: 'First Name',
                          hint: 'Enter your first name',
                          controller: firstNameController,
                        ),
                        const SizedBox(height: 20),
                        BackGroundImageTextField(
                          label: 'Second Name',
                          hint: 'Enter your second name (Optional)',
                          controller: secondNameController,
                        ),
                        const SizedBox(height: 20),
                        BackGroundImageTextField(
                          label: 'Last Name',
                          hint: 'Enter your last name',
                          controller: lastNameController,
                        ),
                        const SizedBox(height: 20),
                        BackGroundImageTextField(
                          label: 'SSN',
                          hint: 'Enter your SSC number',
                          controller: peselNumberControler,
                        ),
                        const SizedBox(height: 20),
                        CustomDatePicker(
                          onDateSelected: (DateTime date) {
                            // Handle date selection
                          },
                        ),
                        const SizedBox(height: 20),
                        Center(
                          // Center the radio buttons
                          child: GenderSelectionRadioButton(
                            onGenderSelected: (gender) {
                              // Handle gender selection
                            },
                          ),
                        ),
                        const SizedBox(height: 20),
                        CustomButton(
                          label: 'Next',
                          onPressed: () {
                            // Handle next button press
                          },
                          gradientColors: goldGradient,
                          textColor: Colors.white,
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.05),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
