// Details Row Class
import 'package:flutter/material.dart';


class DetailsRow extends StatelessWidget {
  final String title;
  final String value;

  const DetailsRow({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style:TextStyle(fontSize: 12)),
        Text(
          value,
          style: TextStyle(
            fontSize: 12,
            color: Colors.black54,
            fontWeight: FontWeight.normal,
          ),
        ),
      ],
    );
  }
}
