import 'package:flutter/material.dart';

class SmallText extends StatelessWidget {
  final String text;
  double size;
  Color color;
  FontWeight weight;
  double spacing;
  double height ;
  TextOverflow? overflow;

  SmallText({
    super.key,
    required this.text,
    this.size= 14,
    this.color = const Color(0xFF909090),
    this.weight = FontWeight.w400,
    this.spacing = 1,
    this.height =1.2,
    this.overflow
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontSize: size,
          color: color,
          fontWeight: weight,
          fontFamily: 'nunito',
          letterSpacing: spacing,
          height: height,overflow: overflow
      ),
    );
  }
}
