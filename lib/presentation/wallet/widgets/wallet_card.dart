import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:salvest_app/presentation/wallet/widgets/wallet_button.dart';
import 'package:salvest_app/utility/app_assests.dart';
import 'package:salvest_app/utility/app_colors.dart';

class WalletCard extends StatelessWidget {
  const WalletCard({
    super.key,
    required this.cardColr,
    required this.cardStrting,
    required this.cardIcon,
    required this.arrowCallback,
    required this.walletValue,
    required this.arrowIconData,
    required this.deposite, required this.rfreshCallback, required this.isLoading,
  });
  final Gradient cardColr;
  final String walletValue;
  final String cardStrting;
  final String cardIcon;
  final VoidCallback arrowCallback;
   final VoidCallback rfreshCallback;
  final IconData arrowIconData;
  final VoidCallback deposite;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 345,
      height: 174,
      decoration: ShapeDecoration(
        image: const DecorationImage(
          image: AssetImage(AppAssets.walletBackg),
          fit: BoxFit.fill,
        ),
        gradient: cardColr,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: 
                isLoading
      ? const CupertinoActivityIndicator(radius: 12)
      :Text.rich(
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
                        text: walletValue,
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
              Spacer(),
              IconButton(
                icon: const Icon(Icons.refresh, color: Colors.white),
                onPressed: rfreshCallback,
                tooltip: 'Refresh',
              ),
            ],
          ),

          const Expanded(child: SizedBox()),
          Padding(
            padding: const EdgeInsets.only(right: 6.0),
            child: InkWell(
              onTap: arrowCallback,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [Icon(arrowIconData, color: AppColors.white)],
              ),
            ),
          ),
          const Expanded(child: SizedBox()),

          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Row(
              spacing: 10,
              //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: deposite,
                  child: WalletButton(
                    iconData: CupertinoIcons.plus,
                    text: 'Deposit',
                  ),
                ),
                WalletButton(
                  iconData: CupertinoIcons.arrow_2_circlepath,
                  text: 'Exchange',
                ),
                SizedBox(width: 120),
                Column(
                  children: [
                    //   SizedBox(height: 10),
                    SvgPicture.asset(cardIcon),

                    Text(
                      cardStrting,
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
    );
  }
}
