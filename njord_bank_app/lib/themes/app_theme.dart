import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static ThemeData get theme {
    return ThemeData(
      primarySwatch: Colors.blue,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      appBarTheme: AppBarTheme(
        titleTextStyle: GoogleFonts.caesarDressing(
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      buttonTheme: const ButtonThemeData(
        buttonColor: Colors.blueAccent,
        textTheme: ButtonTextTheme.primary,
      ),
      textTheme: TextTheme(
        bodyLarge: GoogleFonts.roboto(fontSize: 14.0), // Primary body text
        labelLarge: GoogleFonts.roboto(
            fontSize: 16.0, fontWeight: FontWeight.bold), // Button text
        titleMedium: GoogleFonts.roboto(
            fontSize: 15.0), // Subtitles or secondary headlines
        bodySmall: GoogleFonts.roboto(fontSize: 12.0), // Secondary body text
        labelSmall:
            GoogleFonts.roboto(fontSize: 10.0), // Smaller labels or annotations
        headlineMedium: GoogleFonts.roboto(
            fontSize: 18.0, fontWeight: FontWeight.bold), // Main headlines
        // Add more styles as needed
      ),
      inputDecorationTheme: InputDecorationTheme(
        hintStyle: GoogleFonts.roboto(fontSize: 14.0, color: Colors.grey),
      ),
      dialogTheme: DialogTheme(
        titleTextStyle:
            GoogleFonts.roboto(fontSize: 20.0, fontWeight: FontWeight.bold),
        contentTextStyle: GoogleFonts.roboto(fontSize: 16.0),
      ),
      // Further customization goes here
    );
  }
}
