import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  final String text;
  final String? fontFamily;
  final Color? color;
  final FontWeight? fontWeight;
  final double? fontSize;
  final TextAlign? textAlign;
  final double? height;
  final int? maxLines;
  final TextOverflow? overflow;
  final double? letterSpacing;
  final double? wordSpacing;
  final FontStyle? fontStyle;

  const AppText(
    this.text, {
    Key? key,
    this.color,
    this.fontWeight,
    this.fontSize,
    this.textAlign,
    this.height,
    this.maxLines,
    this.overflow,
    this.letterSpacing,
    this.wordSpacing,
    this.fontFamily,
    this.fontStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
      style: TextStyle(
        color: color ?? Colors.black,
        fontWeight: fontWeight,
        fontSize: fontSize,
        fontStyle: fontStyle,
        height: height,
        letterSpacing: letterSpacing,
        wordSpacing: wordSpacing,
      ),
    );
  }
}
