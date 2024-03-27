import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LabeledAnimatedButton extends StatefulWidget {
  final String labelText;
  final String buttonText;
  final VoidCallback onPressed;
  final List<Color> gradientColors;
  final Color textColor;
  final TextStyle labelStyle;
  final double width;
  final double height;

  const LabeledAnimatedButton({
    super.key,
    required this.labelText,
    required this.buttonText,
    required this.onPressed,
    required this.gradientColors,
    this.textColor = Colors.white,
    required this.labelStyle,
    this.width = 200.0,
    this.height = 50.0,
  });

  @override
  // ignore: library_private_types_in_public_api
  _LabeledAnimatedButtonState createState() => _LabeledAnimatedButtonState();
}

class _LabeledAnimatedButtonState extends State<LabeledAnimatedButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scale;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 100),
      vsync: this,
      lowerBound: 0.8,
      upperBound: 1.0,
    );
    _scale = CurvedAnimation(parent: _controller, curve: Curves.easeOut);

    _controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onTapDown(TapDownDetails details) {
    _controller.reverse();
  }

  void _onTapUp(TapUpDetails details) {
    _controller.forward();
  }

  void _onTapCancel() {
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    // Assuming a standard horizontal padding that matches your TextField's effective padding
    const double horizontalPadding = 20.0;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: horizontalPadding),
          child: Text(
            widget.labelText,
            style: widget.labelStyle,
          ),
        ),
        GestureDetector(
          onTapDown: _onTapDown,
          onTapUp: _onTapUp,
          onTapCancel: _onTapCancel,
          onTap: widget.onPressed,
          child: Transform.scale(
            scale: _scale.value,
            child: Container(
              width: widget.width,
              height: widget.height,
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: widget.gradientColors),
                borderRadius: BorderRadius.circular(25),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.25),
                    spreadRadius: 0,
                    blurRadius: 4,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Center(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: horizontalPadding),
                  child: Text(
                    widget.buttonText,
                    style: GoogleFonts.roboto(
                      fontSize: 16,
                      color: widget.textColor,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
