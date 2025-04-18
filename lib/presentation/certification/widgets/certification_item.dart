import 'package:flutter/material.dart';

class CertifiactionsItem extends StatelessWidget {
  const CertifiactionsItem({
    super.key,
    required this.itemColor,
    required this.icon,
    required this.text,
  });
  final Color itemColor;
  final String icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 345,
      height: 56,
      decoration: ShapeDecoration(
        color: itemColor,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 1,
            color: Colors.black.withValues(alpha: 117),
          ),
          borderRadius: BorderRadius.circular(7),
        ),
      ),
      child: Row(
        spacing: 20,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Image(image: AssetImage(icon)),
          ),
          Text(
            text,
            style: TextStyle(
              color: Colors.black,
              fontSize: 14,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}