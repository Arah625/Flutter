import 'package:flutter/material.dart';
import 'package:njord_bank_app/widgets/appBar/topAppBar/transparent_app_bar_with_back_button.dart';
import 'package:njord_bank_app/widgets/button/custom_button.dart';
import 'package:njord_bank_app/colors/constants.dart';
import 'package:njord_bank_app/widgets/textFields/background_image_text_field.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: const TransparentTopAppBarWithBackButton(
          title: "Login to your account"),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/login_background.webp'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              SizedBox(
                  height: MediaQuery.of(context).size.height *
                      0.28), // Increased spacing
              BackGroundImageTextField(
                hint: 'Email',
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                obscureText: false,
              ),
              const SizedBox(height: 20),
              BackGroundImageTextField(
                hint: 'Password',
                controller: passwordController,
                keyboardType: TextInputType.text,
                obscureText: true,
              ),
              const Spacer(),
              CustomButton(
                label: 'Login',
                onPressed: () {
                  print('Login button pressed');
                },
                gradientColors: goldGradient,
                textColor: pureWhite,
                width: double.infinity,
                height: 50.0,
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.05),
            ],
          ),
        ),
      ),
    );
  }
}
