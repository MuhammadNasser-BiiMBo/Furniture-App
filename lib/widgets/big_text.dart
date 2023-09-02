import 'package:flutter/material.dart';

class BigText extends StatelessWidget {
  final String text;
  double size;
  Color color;
  FontWeight weight;
  double spacing;
  String family;


  BigText({
    super.key,
    required this.text,
    this.size = 20,
    this.color = const Color(0xFF303030),
    this.weight = FontWeight.w500,
    this.spacing = 1,
    this.family = 'nunito'
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: size,
        color: color,
        fontWeight: weight,
        fontFamily: family,
        letterSpacing: spacing,
      ),
    );
  }
}
