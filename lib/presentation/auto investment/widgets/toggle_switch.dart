import 'package:flutter/material.dart';

class ToggleSwitchWidget extends StatefulWidget {
  @override
  _ToggleSwitchWidgetState createState() => _ToggleSwitchWidgetState();
}

class _ToggleSwitchWidgetState extends State<ToggleSwitchWidget> {
  bool isActive = true;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          isActive ? "activated" : "deactivated",
          style: TextStyle(
            color: isActive ? Colors.green : Colors.grey,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(width: 8),
        Switch(
          value: isActive,
          activeColor: Colors.black,
          activeTrackColor: Colors.green.shade200,
          inactiveThumbColor: Colors.black,
          inactiveTrackColor: Colors.grey.shade400,
          
          onChanged: (bool value) {
            setState(() {
              isActive = value;
            });
          },
        ),
      ],
    );
  }
}
