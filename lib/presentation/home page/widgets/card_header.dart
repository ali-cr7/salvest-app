import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CardHeader extends StatelessWidget {
  final String category;
  final IconData iconData;
  final Color categoryColor;

  const CardHeader({
    super.key,
    required this.category,
    required this.iconData,
    required this.categoryColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: categoryColor.withOpacity(0.4),
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        border: Border.all(color: Colors.black87, width: 1),
      ),
      child: Row(
        children: [
          Icon(iconData, color: categoryColor, size: 18),
          const SizedBox(width: 6),
          Text(
            category,
            style: GoogleFonts.poppins(
              color: Colors.black,
              fontWeight: FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
