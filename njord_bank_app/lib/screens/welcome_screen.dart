import 'package:flutter/material.dart';
import 'package:njord_bank_app/colors/constants.dart';
import 'package:njord_bank_app/navigation/navigation_service_with_loader.dart';
import 'package:njord_bank_app/widgets/appBar/topAppBar/transparent_app_bar_with_subtitle.dart';
import 'package:njord_bank_app/widgets/button/custom_button.dart';
import 'package:njord_bank_app/screens/registration/register_informative_screen.dart';
import 'package:njord_bank_app/screens/login_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: const TransparentTopAppBarWithSubtitle(
        title: "Welcome to Njord Bank",
        subtitle: "What do you want to do?",
      ), // Use CustomAppBar here
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/welcome_screen_background.webp'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              const Spacer(),
              CustomButton(
                label: 'Open Account',
                onPressed: () => NavigationService.navigateWithLoader(
                    context, const RegisterInformativeScreen()),
                gradientColors: goldGradient,
                textColor: pureWhite,
                width: 200,
                height: 50,
              ),
              const SizedBox(height: 20),
              CustomButton(
                label: 'Activate application',
                onPressed: () => NavigationService.navigateWithLoader(
                    context, const LoginScreen()),
                gradientColors: goldGradient,
                textColor: pureWhite,
                width: 200,
                height: 50,
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.1),
            ],
          ),
        ),
      ),
    );
  }
}
