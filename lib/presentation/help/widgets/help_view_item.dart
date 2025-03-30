import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:salvest_app/utility/app_colors.dart';

class HelpViewItem extends StatelessWidget {
  const HelpViewItem({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 345,
      height: 56,
      decoration: ShapeDecoration(
        color: const Color(0x9E9A8AEC),
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 1, color: const Color(0x755B5B5B)),
          borderRadius: BorderRadius.circular(7),
        ),
      ),
      child: Row(
        spacing: 80,
        crossAxisAlignment: CrossAxisAlignment.center,

        children: [
          Padding(
            padding: const EdgeInsets.only(left: 6.0),
            child: Icon(
              CupertinoIcons.question_circle_fill,
              color: AppColors.background,
            ),
          ),

          Text(
            text,

            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
