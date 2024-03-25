import 'package:flutter/material.dart';
import 'package:njord_bank_app/themes/app_theme.dart';
import 'screens/splash_screen.dart'; // Adjust the path based on your project structure

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Remove `const` before `MaterialApp`
    return MaterialApp(
      title: 'Njord Bank App',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.theme, // Now it's okay to use AppTheme.theme here
      home:
          const SplashScreen(), // Assuming SplashScreen has a const constructor
      // Optionally, define routes for the app
    );
  }
}
