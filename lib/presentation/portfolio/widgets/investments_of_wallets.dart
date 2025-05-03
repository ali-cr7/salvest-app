import 'package:flutter/material.dart';
import 'package:salvest_app/utility/app_assests.dart';
import 'package:salvest_app/utility/app_colors.dart';

class InvestmentsOfWallet extends StatelessWidget {
  const InvestmentsOfWallet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 345,
      height: 200,
      decoration: ShapeDecoration(
        gradient: LinearGradient(
          begin: Alignment(-0.00, 0.92),
          end: Alignment(1.00, -0.00),
          colors: [
            const Color(0xFF9A8AEC),
            const Color(0xFF786CB9),
            const Color(0xFF685D9F),
            const Color(0xFF574E86),
          ],
        ),
        image: const DecorationImage(
          image: AssetImage(AppAssets.walletBackg),
          fit: BoxFit.fill,
        ),
        //    color: const Color(0xFF9A8AEC),
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 2, color: const Color(0x7F9A8AEC)),
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 12.0, right: 8.0),
            child: Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  height: 140,
                  width: 140,
                  child: CircularProgressIndicator(
                    value: 0.87,
                    backgroundColor: Colors.white.withOpacity(0.3),
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                    strokeWidth: 10,
                  ),
                ),
                Column(
                  children: [
                    Text(
                      "87%",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'investments of your wallet\n',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Expanded(child: SizedBox()),
        ],
      ),
    );
  }
}
