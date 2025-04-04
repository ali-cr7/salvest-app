import 'package:flutter/material.dart';
import 'package:salvest_app/utility/app_assests.dart';

class WalletListViewItem extends StatelessWidget {
  const WalletListViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 345,
      height: 56,
      decoration: ShapeDecoration(
        color: const Color(0x3F9A8AEC),
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 1, color: const Color(0x755B5B5B)),
          borderRadius: BorderRadius.circular(7),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(image: AssetImage(AppAssets.tourIcon)),
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
                          text: '70 invested in Kaseon Mole ',
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
                      '7 April 2024',

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
