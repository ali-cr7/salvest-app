
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AddButton extends StatelessWidget {
  final VoidCallback tap;
  const AddButton({
    super.key, required this.tap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: tap,
      child: Container(
        width: 130,
        height: 33,
        decoration: ShapeDecoration(
          gradient: LinearGradient(
            begin: Alignment(0.00, 1.00),
            end: Alignment(1.00, -0.00),
            colors: [
              const Color(0xFF9A8AEC),
              const Color(0xFF786CB9),
              const Color(0xFF685D9F),
              const Color(0xFF574E86),
            ],
          ),
          shape: RoundedRectangleBorder(
            side: BorderSide(
              width: 1,
              color: const Color(0x7A634AE2),
            ),
            borderRadius: BorderRadius.circular(25),
          ),
        ),
        child: Center(
          child: Text(
            'add',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}