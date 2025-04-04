import 'package:flutter/material.dart';

class CheckMarkBox extends StatefulWidget {
  const CheckMarkBox({super.key});

  @override
  _CheckMarkBoxState createState() => _CheckMarkBoxState();
}

class _CheckMarkBoxState extends State<CheckMarkBox> {
  bool isChecked = false; // Track selection state

  void _toggleCheck() {
    setState(() {
      isChecked = !isChecked; // Toggle state
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _toggleCheck, // Toggle check state on tap
      child: Container(
        width: 15,
        height: 15,
        decoration: ShapeDecoration(
          color: isChecked ? Colors.green : Colors.transparent, // Fill if checked
          shape: RoundedRectangleBorder(
            side: BorderSide(
              width: 2,
              color: Colors.black38,
            ),
          ),
        ),
        child: isChecked
            ? const Icon(Icons.check, size: 12, color: Colors.white) // ✅ Show checkmark
            : null, // Empty if not checked
      ),
    );
  }
}
