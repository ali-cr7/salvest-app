import 'package:flutter/material.dart';

class SaleEstateContainer extends StatelessWidget {
  const SaleEstateContainer({
    super.key,
    required this.height,
    required this.child,
  });
  final double height;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 334,
      height: height,
      decoration: ShapeDecoration(
        color: const Color(0x7FE8E8E8),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
      child: child,
    );
  }
}
