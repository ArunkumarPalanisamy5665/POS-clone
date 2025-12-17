import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final TextAlign textAlign;
  final int? maxLines;
  final TextOverflow overflow;

  const CustomText(
      this.text, {
        super.key,
        this.style,
        this.textAlign = TextAlign.start,
        this.maxLines,
        this.overflow = TextOverflow.ellipsis,
      });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
      style: style ?? Theme.of(context).textTheme.bodyMedium,
    );
  }
}
