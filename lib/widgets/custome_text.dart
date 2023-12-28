import 'package:flutter/material.dart';

class customText extends StatelessWidget {
  String text;
  double size;
  Color? color;
  double? space;
  FontWeight? wight;
  customText(
      {required this.text,
      required this.size,
      this.color,
      this.wight,
      this.space});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          letterSpacing: space ?? 1.0,
          fontSize: size,
          color: color ?? Colors.white,
          fontWeight: wight ?? FontWeight.w400),
    );
  }
}
