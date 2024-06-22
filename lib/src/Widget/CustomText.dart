import 'package:flutter/material.dart';

class CustomText extends StatefulWidget {
  final String text;
  final Color? textcolor;
  final double? textsize;
  final FontWeight? fontweight;

  // static const String fontfamily = 'manrope';

  const CustomText({
    super.key,
    required this.text,
    this.textsize = 14,
    this.fontweight,
    this.textcolor,
  });

  @override
  State<CustomText> createState() => _CustomTextState();
}

class _CustomTextState extends State<CustomText> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget.text,
      style: TextStyle(
        color: widget.textcolor,
        fontSize: widget.textsize,
        fontWeight: widget.fontweight,
        fontFamily: 'manrope',
      ),
    );
  }
}
