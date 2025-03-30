import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:salvest_app/utility/app_assests.dart';
import 'package:salvest_app/utility/app_colors.dart';

class NegotiationNotificationView extends StatelessWidget {
  const NegotiationNotificationView({super.key});

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
          'Negotiation',
          style: TextStyle(color: Colors.black, fontSize: 18),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),

      backgroundColor: AppColors.white,
      body: Center(
        child: Container(
          width: 348,
          height: 243,
          decoration: ShapeDecoration(
            color: AppColors.green15,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(7),
            ),
          ),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Image(image: AssetImage(AppAssets.negotiationICon)),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 16.0),
                    child: SizedBox(
                      width: 279,
                      height: 153,
                      child: Text(
                        'Our expert team reached an offer about your home that requires that half of the amount be paid over three months and after the end of the remaining half investment in addition to 5% of the investments',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30),

              Padding(
                padding: const EdgeInsets.only(left: 65.0),
                child: Row(
                  spacing: 80,
                  children: [
                    InkWell(
                      child: Container(
                        width: 67,
                        height: 33,
                        decoration: ShapeDecoration(
                          color: const Color(0x5946E050),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(7),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            'Accept',
                            style: TextStyle(
                              color: const Color(0xFF036D0F),
                              fontSize: 12,

                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                    ),

                    InkWell(
                      child: Container(
                        width: 67,
                        height: 33,
                        decoration: ShapeDecoration(
                          color: const Color(0x3FD9D9D9),
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              width: 1,
                              color: const Color(0xBFF1272A),
                            ),
                            borderRadius: BorderRadius.circular(7),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            'reject',
                            style: TextStyle(
                              color: const Color(0xBFF1272A),
                              fontSize: 12,

                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
