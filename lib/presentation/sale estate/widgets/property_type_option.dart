import 'package:flutter/material.dart';

class PropertyTypeOption extends StatelessWidget {
  final String label;
  final String? groupValue;
  final ValueChanged<String?> onChanged;

  const PropertyTypeOption({
    super.key,
    required this.label,
    required this.groupValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Radio<String>(
          value: label,
          groupValue: groupValue,
          onChanged: onChanged,
        ),
        Text(label, style: const TextStyle(fontSize: 14)),
      ],
    );
  }
}
