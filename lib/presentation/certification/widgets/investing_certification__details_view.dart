import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:salvest_app/utility/app_assests.dart';
import 'package:salvest_app/utility/app_colors.dart';

class InvestingCertificationDetailsView extends StatelessWidget {
  const InvestingCertificationDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            GoRouter.of(context).pop();
          },
        ),
        title: const Text(
          'Certification',
          style: TextStyle(color: Colors.black, fontSize: 18),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      backgroundColor: AppColors.white,
      body: Center(
        child: Container(
          width: 349,
          height: 724,
          child: Stack(
            children: [
              Positioned(
                left: 0,
                top: 0,
                child: Container(
                  width: 349,
                  height: 724,
                  decoration: ShapeDecoration(
                    gradient: LinearGradient(
                      begin: Alignment(0.00, 1.00),
                      end: Alignment(1.00, -0.00),
                      colors: [
                        const Color(0xFF9A8AEC),
                        const Color(0xFF786CB9),
                        const Color(0xFF685D9F),
                        const Color(0xFF574E86),
                      ],
                    ).withOpacity(0.5),
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        width: 3,
                        color: const Color(0xFF836DF3),
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 21,
                top: 23,
                child: SizedBox(
                  width: 306,
                  height: 636,
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: 'First Party:',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        TextSpan(
                          text:
                              ' Mr. Ammar Aloush, who has chosen as his elected domicile for the purposes of this contract the address located in Damascus - Malkee-Ahmraa - 112 - 3, and is referred to in this contract as "the Owner."\n',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        TextSpan(
                          text: 'Second Party:',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        TextSpan(
                          text:
                              ' Mr. Company, who has chosen as his elected domicile for the purposes of this contract the address located in Damascus - Baramekah - Main - 12 - 3, and is referred to in this contract as "the Investor."\nThe Leased Store: The entirety of the store known as "[Store Name]" with all its contents and legal elements as stipulated in Article 42 of the Commercial Law, established on property No. 100000 in the [Real Estate Area], which consists of [description]. Its approximate area is 500 square meters. The store is leased to the Owner by the property owner, Mr. [Name], under a formal written lease agreement. The aforementioned store is situated in Damascus - [District] - [Street] - [Building No.], and is equipped with all the equipment, tools, decorations, furniture, and inventory necessary for its operation in accordance with its intended purpose.\nAn inventory list of these equipment and items has been prepared, which constitutes an integral part of this contract. This list bears the signatures of both parties, as acknowledgment of the presence of the equipment specified therein within the leased store and as acknowledgment of the Investor’s receipt of the equipment in full upon signing this contract.',
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
                ),
              ),
              Positioned(
                left: 280,
                top: 660,
                child: Container(
                  width: 63,
                  height: 63,
                  decoration: ShapeDecoration(
                    color: const Color(0xFFD9D9D9),
                    shape: OvalBorder(
                      side: BorderSide(
                        width: 2,
                        color: const Color(0xFF685D9F),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 286.88,
                top: 675.09,
                child: Container(
                  width: 43.97,
                  height: 30.84,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(AppAssets.appICnon),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
