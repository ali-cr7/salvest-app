import 'package:flutter/material.dart';

class ProtfolioItem extends StatelessWidget {
  const ProtfolioItem({
    super.key,
    required this.gradient,
    required this.text,
    required this.icon,
  });
  final Gradient gradient;
  final String text;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 157,
      height: 93,
      decoration: ShapeDecoration(
        gradient: gradient,
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 1),
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 12.0, top: 12),
            child: Image(image: AssetImage(icon)),
          ),
          Center(
            child: Text(
              text,

              style: TextStyle(
                color: Colors.black.withValues(alpha: 10),
                fontSize: 15,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}