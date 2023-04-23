import 'package:flutter/material.dart';
import 'package:eventapp_mobile/additional_widgets/buttonstyles_and_colours.dart';

class Logo extends StatelessWidget {
  const Logo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 200, // Set the width of the container
          height: 60, // Set the height of the container
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
                10), // Set the border radius of the container
            image: const DecorationImage(
              image: AssetImage(
                  "images/logo_v4.png"), // Use NetworkImage for loading image from URL
              fit: BoxFit.contain,
            ),
          ),
        ),
      ],
    );
  }
}

class GradientText extends StatelessWidget {
  const GradientText(
    this.text, {
    required this.gradient,
    this.style,
  });

  final String text;
  final TextStyle? style;
  final Gradient gradient;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (bounds) => gradient.createShader(
        Rect.fromLTWH(0, 0, bounds.width, bounds.height),
      ),
      child: Text(text, style: style),
    );
  }
}
