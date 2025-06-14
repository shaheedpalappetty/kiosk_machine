import 'package:flutter/material.dart';

class ServicesWidget extends StatelessWidget {
  final String text;
  final double width;
  final double height;
  final TextStyle? textStyle;
  final Color borderColor;
  final double borderWidth;
  final double borderRadius;
  final Color? backgroundColor;
  final void Function()? onTap;


  const ServicesWidget({
    super.key,
    required this.text,
    this.width = 200,
    this.height = 100,
    this.textStyle,
    this.borderColor = const Color(0xFF0D3440),
    this.borderWidth = 2.0,
    this.borderRadius = 12.0,
    this.backgroundColor,
    this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: backgroundColor,
          border: Border.all(
            color: borderColor,
            width: borderWidth,
          ),
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: Text(
          text,
          style: textStyle ??
              const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
