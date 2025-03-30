import 'package:flutter/material.dart';
import 'package:salvest_app/utility/app_colors.dart';

class NotificationItem extends StatelessWidget {
  const NotificationItem({
    super.key,
    required this.mainText,
    required this.secondText,
    required this.color,
    required this.imageICon,
  });
  final String mainText;
  final String secondText;
  final Color color;
  final String imageICon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 345,
      height: 56,
      decoration: ShapeDecoration(
        color: color,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 1,
            color: Colors.black.withValues(alpha: 117),
          ),
          borderRadius: BorderRadius.circular(7),
        ),
      ),

      child: Padding(
        padding: const EdgeInsets.only(
          right: 12.0,
          left: 12.0,
          top: 8.0,
          bottom: 8.0,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image(image: AssetImage(imageICon)),
            SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    mainText,
                    style: TextStyle(color: Colors.black87, fontSize: 16),
                  ),
                  //    const SizedBox(height: 8), // Adds spacing between texts
                  Flexible(
                    child: Text(
                      secondText,

                      style: TextStyle(color: Colors.black38, fontSize: 12),
                      softWrap: false, // Ensures proper wrapping
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
