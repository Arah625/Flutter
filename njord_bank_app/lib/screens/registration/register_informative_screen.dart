import 'package:flutter/material.dart';
import 'package:njord_bank_app/navigation/navigation_service_with_loader.dart';
import 'package:njord_bank_app/screens/registration/step_personal_data.dart';
import 'package:njord_bank_app/utils/colors/gradients/gradient_text.dart';
import 'package:njord_bank_app/widgets/appBar/topAppBar/transparent_app_bar_with_back_button.dart';
import 'package:njord_bank_app/widgets/button/custom_button.dart';
import 'package:njord_bank_app/colors/app_colors.dart';
import 'package:njord_bank_app/widgets/textElement/gradient_bullet_list.dart';

class RegisterInformativeScreen extends StatelessWidget {
  const RegisterInformativeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: const TransparentTopAppBarWithBackButton(
          title: "Required data for registration"),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                'assets/images/registration/registration_informative_background.webp'),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          // Wrap with SingleChildScrollView
          child: ConstrainedBox(
            // Add ConstrainedBox
            constraints: BoxConstraints(
              minHeight: MediaQuery.of(context).size.height, // Min height
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: IntrinsicHeight(
                // Use IntrinsicHeight to size column properly
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                        height:
                            kToolbarHeight + 20), // Push content below AppBar
                    GradientText(
                      text:
                          "Welcome to Njord Bank opening account process. Before we start, we want to inform you, that we will need information such as:",
                      style: Theme.of(context).textTheme.bodyLarge!,
                      colors: goldGradient,
                    ),
                    const SizedBox(height: 16),
                    const GradientBulletList(
                      items: [
                        'Personal information',
                        'Address information',
                        'Contact information',
                      ],
                    ),
                    GradientText(
                      text: "Do you wish to continue?",
                      style: Theme.of(context).textTheme.bodyLarge!,
                      colors: goldGradient,
                    ),
                    const Spacer(), // Adjust or remove Spacer based on content size
                    CustomButton(
                      label: 'Continue',
                      onPressed: () => NavigationService.navigateWithLoader(
                          context, StepPersonalData()),
                      gradientColors: goldGradient,
                      textColor: pureWhite,
                      width: double.infinity,
                      height: 50,
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.1),
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
