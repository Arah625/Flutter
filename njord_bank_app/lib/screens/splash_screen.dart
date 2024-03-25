import 'package:flutter/material.dart';
import 'package:njord_bank_app/screens/welcome_screen.dart';
import 'package:njord_bank_app/widgets/loader/shiny_loader.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Using Future.delayed to handle the navigation
    Future.delayed(const Duration(seconds: 3), () {
      // Ensure that we're using pushReplacement to avoid back navigation to the splash screen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const WelcomeScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/splash_background.webp'),
            fit: BoxFit.cover,
          ),
        ),
        child: const Center(
          child: ShinyLoader(),
        ),
      ),
    );
  }
}
