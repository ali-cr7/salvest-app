import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:salvest_app/utility/app_assests.dart';

class WalletListViewItem extends StatelessWidget {
  const WalletListViewItem({
    super.key,
    required this.date,
    required this.mainText,
    required this.iconAsset,
    required this.itemColor,
  });
  final String date;
  final String mainText;
  final String iconAsset;
  final Color itemColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 345,
      height: 56,
      decoration: ShapeDecoration(
        color: itemColor,
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 1, color: const Color(0x755B5B5B)),
          borderRadius: BorderRadius.circular(7),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 12.0),
            child: Image(image: AssetImage(iconAsset)),
          ),

          SizedBox(width: 10),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0, top: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: '\$',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        TextSpan(
                          text: mainText,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                  //    const SizedBox(height: 8), // Adds spacing between texts
                  Flexible(
                    child: Text(
                      date,

                      style: TextStyle(color: Colors.black38, fontSize: 12),
                      softWrap: false, // Ensures proper wrapping
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
