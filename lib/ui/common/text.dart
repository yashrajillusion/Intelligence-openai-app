import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  const AppText(
      {Key? key,
      required this.title,
      this.titleColor,
      this.titleTextAlign = TextAlign.left,
      this.maxLine,
      this.fontWeight,
      this.softWrap,
      this.fontStyle,
      this.textDecoration,
      this.textScaleFactor,
      required this.fontSize,
      this.lineHeight,
      this.isUnderline = false,
      this.fontFamily,
      this.overflow,
      this.letterSpacing})
      : super(key: key);

  final String title;
  final double? fontSize;
  final Color? titleColor;
  final TextAlign titleTextAlign;
  final int? maxLine;
  final FontWeight? fontWeight;
  final FontStyle? fontStyle;
  final String? fontFamily;
  final bool? softWrap;
  final TextDecoration? textDecoration;
  final double? textScaleFactor;
  final bool? isUnderline;
  final double? lineHeight;
  final double? letterSpacing;
  final TextOverflow? overflow;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textScaleFactor: 1,
      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
          color: titleColor,
          fontWeight: fontWeight ?? FontWeight.w400,
          decoration: isUnderline == true ? TextDecoration.underline : textDecoration,
          fontFamily: fontFamily ?? 'Inter',
          letterSpacing: letterSpacing ?? 0,
          height: lineHeight ?? 1.5,
          fontSize: fontSize ?? 16),
      textAlign: titleTextAlign,
      maxLines: maxLine,
      overflow: overflow,
    );
  }
}
