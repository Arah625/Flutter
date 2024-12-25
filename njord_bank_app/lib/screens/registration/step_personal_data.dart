// import 'package:flutter/material.dart';
// import 'package:njord_bank_app/colors/constants.dart';
// import 'package:njord_bank_app/widgets/datepicker/date_picker.dart';
// import 'package:njord_bank_app/widgets/radiobutton/gender_selection_radio_button.dart';
// import 'package:njord_bank_app/widgets/textFields/background_image_text_field.dart';
// import 'package:njord_bank_app/widgets/appBar/topAppBar/transparent_app_bar_with_back_button.dart';
// import 'package:njord_bank_app/widgets/button/custom_button.dart';

// class StepPersonalData extends StatelessWidget {
//   final TextEditingController firstNameController = TextEditingController();
//   final TextEditingController secondNameController = TextEditingController();
//   final TextEditingController lastNameController = TextEditingController();
//   final TextEditingController peselNumberControler = TextEditingController();

//   StepPersonalData({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       extendBodyBehindAppBar: true,
//       appBar: const TransparentTopAppBarWithBackButton(
//         title: "Personal Information",
//       ),
//       body: Container(
//         decoration: const BoxDecoration(
//           image: DecorationImage(
//             image: AssetImage(
//                 "assets/images/registration/registration_personal_data.webp"),
//             fit: BoxFit.cover,
//           ),
//         ),
//         child: Padding(
//           padding: const EdgeInsets.all(20.0),
//           child: LayoutBuilder(
//             builder: (context, constraints) {
//               return SingleChildScrollView(
//                 child: ConstrainedBox(
//                   constraints: BoxConstraints(minHeight: constraints.maxHeight),
//                   child: IntrinsicHeight(
//                     child: Column(
//                       mainAxisSize: MainAxisSize.max,
//                       children: [
//                         SizedBox(
//                             height: MediaQuery.of(context).size.height * 0.1),
//                         BackGroundImageTextField(
//                           label: 'First Name',
//                           hint: 'Enter your first name',
//                           controller: firstNameController,
//                         ),
//                         const SizedBox(height: 20),
//                         BackGroundImageTextField(
//                           label: 'Second Name',
//                           hint: 'Enter your second name (Optional)',
//                           controller: secondNameController,
//                         ),
//                         const SizedBox(height: 20),
//                         BackGroundImageTextField(
//                           label: 'Last Name',
//                           hint: 'Enter your last name',
//                           controller: lastNameController,
//                         ),
//                         const SizedBox(height: 20),
//                         BackGroundImageTextField(
//                           label: 'SSN',
//                           hint: 'Enter your SSC number',
//                           controller: peselNumberControler,
//                         ),
//                         const SizedBox(height: 20),
//                         CustomDatePicker(
//                           onDateSelected: (DateTime date) {
//                             // Handle date selection
//                           },
//                         ),
//                         const SizedBox(height: 20),
//                         Center(
//                           // Center the radio buttons
//                           child: GenderSelectionRadioButton(
//                             onGenderSelected: (gender) {
//                               // Handle gender selection
//                             },
//                           ),
//                         ),
//                         const SizedBox(height: 20),
//                         CustomButton(
//                           label: 'Next',
//                           onPressed: () {
//                             // Handle next button press
//                           },
//                           gradientColors: goldGradient,
//                           textColor: Colors.white,
//                         ),
//                         SizedBox(
//                             height: MediaQuery.of(context).size.height * 0.05),
//                       ],
//                     ),
//                   ),
//                 ),
//               );
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:njord_bank_app/colors/constants.dart';
// import 'package:njord_bank_app/widgets/datepicker/date_picker.dart';
// import 'package:njord_bank_app/widgets/radiobutton/gender_selection_radio_button.dart';
// import 'package:njord_bank_app/widgets/appBar/topAppBar/transparent_app_bar_with_back_button.dart';
// import 'package:njord_bank_app/widgets/button/custom_button.dart';
// import 'package:njord_bank_app/services/validators.dart';
// import 'package:njord_bank_app/widgets/textFields/background_image_validated_text_field.dart';

// class StepPersonalData extends StatefulWidget {
//   const StepPersonalData({super.key});

//   @override
//   // ignore: library_private_types_in_public_api
//   _StepPersonalDataState createState() => _StepPersonalDataState();
// }

// class _StepPersonalDataState extends State<StepPersonalData> {
//   final _formKey = GlobalKey<FormState>();
//   final TextEditingController firstNameController = TextEditingController();
//   final TextEditingController secondNameController = TextEditingController();
//   final TextEditingController lastNameController = TextEditingController();
//   final TextEditingController peselNumberController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       extendBodyBehindAppBar: true,
//       appBar: const TransparentTopAppBarWithBackButton(
//           title: "Personal Information"),
//       body: Container(
//         decoration: const BoxDecoration(
//           image: DecorationImage(
//             image: AssetImage(
//                 "assets/images/registration/registration_personal_data.webp"),
//             fit: BoxFit.cover,
//           ),
//         ),
//         child: Padding(
//           padding: const EdgeInsets.all(20.0),
//           child: Form(
//             key: _formKey,
//             child: SingleChildScrollView(
//               child: Column(
//                 children: [
//                   ValidatedTextField(
//                     label: 'First Name',
//                     hint: 'Enter your first name',
//                     controller: firstNameController,
//                     validator: Validators.validateName,
//                   ),
//                   ValidatedTextField(
//                     label: 'Second Name (Optional)',
//                     hint: 'Enter your second name',
//                     controller: secondNameController,
//                     validator: Validators.validateOptionalName,
//                   ),
//                   ValidatedTextField(
//                     label: 'Last Name',
//                     hint: 'Enter your last name',
//                     controller: lastNameController,
//                     validator: Validators.validateName,
//                   ),
//                   ValidatedTextField(
//                     label: 'PESEL',
//                     hint: 'Enter your PESEL number',
//                     controller: peselNumberController,
//                     validator: Validators.validatePesel,
//                   ),
//                   CustomDatePicker(
//                     onDateSelected: (DateTime date) {
//                       // Handle date selection
//                     },
//                   ),
//                   GenderSelectionRadioButton(
//                     onGenderSelected: (Gender gender) {
//                       // Handle gender selection
//                     },
//                   ),
//                   const SizedBox(height: 20),
//                   CustomButton(
//                     label: 'Next',
//                     onPressed: () {
//                       if (_formKey.currentState!.validate()) {
//                         // Form is valid, proceed to the next step
//                         // Implement the next step logic here
//                       }
//                     },
//                     gradientColors: goldGradient,
//                     textColor: Colors.white,
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:njord_bank_app/colors/app_colors.dart';
import 'package:njord_bank_app/widgets/appBar/topAppBar/transparent_app_bar_with_back_button.dart';
import 'package:njord_bank_app/widgets/button/custom_button.dart';
import 'package:njord_bank_app/widgets/checkbox/gradient_checkbox.dart';

class StepPersonalData extends StatefulWidget {
  const StepPersonalData({super.key});

  @override
  State<StepPersonalData> createState() => _StepPersonalDataState();
}

class _StepPersonalDataState extends State<StepPersonalData> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _termsAccepted = false;
  bool _attemptedSubmit =
      false; // Used to determine if validation errors should be shown

  // Placeholder variables for other form fields
  String _name = 'aaaa';
  String _email = 'ssss';

  void _submitForm() {
    setState(() {
      _attemptedSubmit =
          true; // Mark the form as having been attempted to be submitted
    });

    if (_formKey.currentState!.validate() && _termsAccepted) {
      // If the form is valid and terms are accepted, proceed with the submission
      print("Form is valid and terms are accepted");
    } else {
      // Show an error or indication that the form is not correctly filled out
      print("Form is incomplete or invalid");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: const TransparentTopAppBarWithBackButton(
          title: "Personal Information"),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                "assets/images/registration/registration_personal_data.webp"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: 'Enter your name',
                        hintStyle: TextStyle(
                            color:
                                Colors.white), // Use your actual color variable
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your name';
                        }
                        return null;
                      },
                      onChanged: (value) => _name = value,
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: 'Enter your email',
                        hintStyle: TextStyle(
                            color:
                                Colors.white), // Use your actual color variable
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email';
                        }
                        return null;
                      },
                      onChanged: (value) => _email = value,
                    ),
                    const SizedBox(height: 20),
                    CustomGradientCheckbox(
                      value: _termsAccepted,
                      onChanged: (bool value) {
                        setState(() {
                          _termsAccepted = value;
                        });
                      },
                      label: "I agree to the Terms and Conditions",
                      isRequired: true,
                      showError: _attemptedSubmit && !_termsAccepted,
                    ),
                    if (_attemptedSubmit && !_termsAccepted)
                      const Padding(
                        padding: EdgeInsets.only(top: 8.0),
                        child: Text(
                          'You must accept the terms and conditions to continue.',
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                    const SizedBox(height: 20),
                    CustomButton(
                      label: 'Next',
                      onPressed: _submitForm,
                      gradientColors: goldGradient,
                      textColor: Colors.white,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
