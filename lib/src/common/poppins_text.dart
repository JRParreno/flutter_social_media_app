import 'package:flutter/material.dart';
import 'package:social_media_app/src/core/theme.dart';

class PoppinsText extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextDirection? textDirection;

  const PoppinsText({
    Key? key,
    required this.text,
    this.style,
    this.textAlign,
    this.textDirection,
    this.maxLines,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLines,
      style: style ??
          const TextStyle(
              fontFamily: "Poppins", fontSize: 14, color: AppTheme.darkColor),
      textAlign: textAlign ?? TextAlign.left,
      textDirection: textDirection ?? TextDirection.ltr,
    );
  }
}
