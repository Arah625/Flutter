import 'package:flutter/material.dart';
import 'package:njord_bank_app/colors/app_colors.dart';

class GradientBulletList extends StatelessWidget {
  final List<String> items;

  const GradientBulletList({
    super.key,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: items
          .map(
            (item) => Padding(
              padding: const EdgeInsets.only(
                  bottom: 8.0), // Adjust spacing as needed
              child: Row(
                crossAxisAlignment:
                    CrossAxisAlignment.center, // Adjust to center align items
                children: [
                  ShaderMask(
                    shaderCallback: (Rect bounds) {
                      return const LinearGradient(
                        colors: goldGradient,
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ).createShader(bounds);
                    },
                    child: const Icon(
                      Icons.circle_rounded, // circle_rounded icon
                      color: Colors.white, // Base color for the shader
                      size: 12.0, // Adjust size as needed
                    ),
                  ),
                  const SizedBox(
                      width: 8.0), // Space between the bullet and the text
                  Expanded(
                    child: ShaderMask(
                      shaderCallback: (Rect bounds) {
                        return const LinearGradient(
                          colors: goldGradient,
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ).createShader(bounds);
                      },
                      child: Text(
                        item,
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              color: Colors.white, // Base color for the shader
                            ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
          .toList(),
    );
  }
}
