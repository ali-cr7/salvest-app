import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoryTab extends StatelessWidget {
  final String text;
  final bool isSelected;

  const CategoryTab({super.key, required this.text, this.isSelected = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: isSelected ? Colors.blue[500] : Colors.grey[300],
        borderRadius: BorderRadius.circular(5),
      ),
      child: Text(
        text,
        style: GoogleFonts.poppins(
          color: isSelected ? Colors.white : Colors.grey,
          fontSize: 14,
        ),
      ),
    );
  }
}
