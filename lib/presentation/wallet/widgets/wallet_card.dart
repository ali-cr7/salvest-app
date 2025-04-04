import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:salvest_app/presentation/wallet/widgets/wallet_button.dart';
import 'package:salvest_app/utility/app_assests.dart';
import 'package:salvest_app/utility/app_colors.dart';

class WalletCard extends StatelessWidget {
  const WalletCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      // crossAxisAlignment: CrossAxisAlignment.center,
      // mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          AppAssets.walletBackground, // Ensure correct path
          fit: BoxFit.contain,
        ),
        Container(
          width: 345,
          height: 174,
          decoration: ShapeDecoration(
            image: const DecorationImage(
              image: AssetImage(AppAssets.walletBackg),
              fit: BoxFit.fill,
            ),
            color: const Color(0xFF9A8AEC),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: '\$',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      TextSpan(
                        text: '25,456.12',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 32,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const Expanded(child: SizedBox()),
              Padding(
                padding: const EdgeInsets.only(right: 6.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Icon(Icons.arrow_forward_ios, color: AppColors.white),
                  ],
                ),
              ),
              const Expanded(child: SizedBox()),

              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Row(
                  spacing: 10,
                  //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    WalletButton(
                      iconData: CupertinoIcons.plus,
                      text: 'Deposit',
                    ),
                    WalletButton(
                      iconData: CupertinoIcons.arrow_2_circlepath,
                      text: 'Exchange',
                    ),
                    SizedBox(width: 120),
                    Column(
                      children: [
                        //   SizedBox(height: 10),
                        SvgPicture.asset(AppAssets.investmentSvg),

                        Text(
                          'Investment wallet',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 10,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 8),
              // const Flexible(child: SizedBox(height: 10)),
            ],
          ),
        ),
      ],
    );
  }
}
