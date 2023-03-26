import 'package:flutter/material.dart';
import 'package:eventapp_mobile/additional_widgets/buttonstyles_and_colours.dart';

class Logo extends StatelessWidget {
  const Logo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GradientText(
        'Dionizos',
        style: TextStyle(fontSize: 35),
    gradient: LinearGradient(
    colors: [PageColor.logo1, PageColor.logo2],
      ),
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