import 'package:flutter/material.dart';
import 'package:furnitured/widgets/big_text.dart';
import 'package:sizer/sizer.dart';

class DefaultTextButton extends StatelessWidget {
  final String text;
  double fontSize;
  Color fontColor;
  final VoidCallback onPressed;
  DefaultTextButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.fontSize = 18,
    this.fontColor = const Color(0xFF242424),
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: BigText(
        text: text,
        weight:FontWeight.w600,
        spacing: 0,
        size: fontSize,
        color: fontColor,
      ),
    );
  }
}
