import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:salvest_app/utility/app_assests.dart';

class SaleStateRequsetViewItem extends StatelessWidget {
  const SaleStateRequsetViewItem({
    super.key,
    required this.address,
    required this.exactLocation,
    required this.propertyType,
    required this.status,
  });
  final String address;
  final String exactLocation;
  final String propertyType;
  final int status;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 345,
          height: 56,
          decoration: ShapeDecoration(
            gradient: const LinearGradient(
              begin: Alignment(0.00, 1.00),
              end: Alignment(1.00, 0.00),
              colors: [
                Color(0xFF9A8AEC),
                Color(0xFF786CB9),
                Color(0xFF685D9F),
                Color(0xFF574E86),
              ],
            ).withOpacity(0.25),
            shape: RoundedRectangleBorder(
              side: BorderSide(width: 1, color: Colors.black.withAlpha(117)),
              borderRadius: BorderRadius.circular(7),
            ),
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Image(image: AssetImage(AppAssets.propertyIcon)),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  '$address  - $exactLocation - $propertyType',
                  style: TextStyle(
                    color: Colors.black.withAlpha(80),
                    fontSize: 15,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 4,
          right: 8,
          child: Icon(
            status == 1 ? Icons.check_circle : Icons.cancel,
            color: status == 1 ? Colors.green : Colors.red,
            size: 18,
          ),
        ),
      ],
    );
  }
}
