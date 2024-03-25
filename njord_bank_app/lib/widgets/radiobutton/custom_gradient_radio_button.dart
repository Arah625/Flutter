import 'package:flutter/material.dart';

class CustomGradientRadioButton extends StatelessWidget {
  final bool isSelected;
  final VoidCallback? onTap;
  final List<Color> borderGradient;
  final List<Color> innerCircleGradient;

  const CustomGradientRadioButton({
    super.key,
    required this.isSelected,
    this.onTap,
    required this.borderGradient,
    required this.innerCircleGradient,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CustomPaint(
        painter: _GradientCircleBorderPainter(borderGradient: borderGradient),
        child: Container(
          width: 24,
          height: 24,
          decoration: const BoxDecoration(shape: BoxShape.circle),
          child: isSelected
              ? Center(
                  child: SizedBox(
                    width: 16, // Smaller size for the transparent gap
                    height: 16,
                    child: CustomPaint(
                      painter: _GradientInnerCirclePainter(
                          innerCircleGradient: innerCircleGradient),
                    ),
                  ),
                )
              : Container(),
        ),
      ),
    );
  }
}

// Custom painter to draw the border with a gradient
class _GradientCircleBorderPainter extends CustomPainter {
  final List<Color> borderGradient;

  _GradientCircleBorderPainter({required this.borderGradient});

  @override
  void paint(Canvas canvas, Size size) {
    final Rect rect = Offset.zero & size;
    final Gradient gradient = LinearGradient(
      colors: borderGradient,
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    );
    final Paint paint = Paint()
      ..shader = gradient.createShader(rect)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3.0; // Adjust for visible border

    canvas.drawCircle(size.center(Offset.zero), size.width / 2, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

// Custom painter to draw the inner circle with a gradient
class _GradientInnerCirclePainter extends CustomPainter {
  final List<Color> innerCircleGradient;

  _GradientInnerCirclePainter({required this.innerCircleGradient});

  @override
  void paint(Canvas canvas, Size size) {
    final Rect rect = Offset.zero & size;
    final Gradient gradient = LinearGradient(
      colors: innerCircleGradient,
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    );
    final Paint paint = Paint()
      ..shader = gradient.createShader(rect)
      ..style = PaintingStyle.fill; // Use fill style for inner circle

    canvas.drawCircle(size.center(Offset.zero), size.width / 2, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
