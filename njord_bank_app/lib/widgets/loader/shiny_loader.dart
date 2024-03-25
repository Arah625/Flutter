import 'package:flutter/material.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

class ShinyLoader extends StatelessWidget {
  const ShinyLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return SleekCircularSlider(
      appearance: CircularSliderAppearance(
        spinnerMode: true,
        size: 60.0,
        customColors: CustomSliderColors(
          trackColor: Colors.transparent, // Set the track color to transparent
          dynamicGradient: true,
          progressBarColors: [const Color(0xFFad7f2d), const Color(0xFFead188)],
        ),
      ),
    );
  }
}
