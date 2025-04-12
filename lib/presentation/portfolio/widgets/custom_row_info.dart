import 'package:flutter/material.dart';

class CustomRowInfo extends StatelessWidget {
  const CustomRowInfo({
    super.key,
    required this.title,
    required this.availability,
    required this.titleFontSize,
    required this.titleColor,
    required this.titleFontWeight,
    required this.availabilityFontSize,
    required this.availabilityColor,
    required this.availabilityFontWeight,
  });
  final String title;
  final String availability;

  final double titleFontSize;
  final Color titleColor;
  final FontWeight titleFontWeight;

  final double availabilityFontSize;
  final Color availabilityColor;
  final FontWeight availabilityFontWeight;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            color: titleColor,
            fontSize: 12,
            fontFamily: 'Inter',
            fontWeight: titleFontWeight,
          ),
        ),
        Text(
          availability,
          style: TextStyle(
            color: availabilityColor,
            fontSize: availabilityFontSize,
            fontFamily: 'Inter',
            fontWeight: availabilityFontWeight,
          ),
        ),
      ],
    );
  }
}
