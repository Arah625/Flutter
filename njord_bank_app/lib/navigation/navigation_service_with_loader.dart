import 'package:flutter/material.dart';
import 'package:njord_bank_app/widgets/loader/shiny_loader.dart';

class NavigationService {
  static Future<void> navigateWithLoader(
      BuildContext context, Widget destination) async {
    // Show the loader
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return const Dialog(
          backgroundColor: Colors.transparent,
          child: ShinyLoader(), // Your loader widget
        );
      },
    );

    // Optional delay to ensure the loader animation is smooth
    await Future.delayed(const Duration(milliseconds: 300));

    // Navigate to the destination screen
    await Navigator.push(
      // ignore: use_build_context_synchronously
      context,
      MaterialPageRoute(builder: (context) => destination),
    );

    // Dismiss the loader
    // ignore: use_build_context_synchronously
    Navigator.of(context, rootNavigator: true).pop();
  }

  // Method for popping the current screen with a loader, if necessary
  static void popWithLoader(BuildContext context) {
    // Show the loader, if needed
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return const Dialog(
          backgroundColor: Colors.transparent,
          child: ShinyLoader(), // Your loader widget
        );
      },
    );

    // Assuming immediate pop, so loader might not be necessary.
    // If there's a delay or async operation, adjust the timing and logic accordingly.

    // Pop the screen
    Navigator.of(context).pop();

    // Then dismiss the loader if it was shown
    // Check if the context is still mounted (i.e., widget tree hasn't been disposed)
    if (Navigator.canPop(context)) {
      Navigator.of(context, rootNavigator: true).pop();
    }
  }
}
