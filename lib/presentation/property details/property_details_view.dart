import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:salvest_app/presentation/home%20page/widgets/details_row.dart';

import 'package:salvest_app/presentation/property%20details/widgets/property_details_card.dart';
import 'package:salvest_app/presentation/property%20details/widgets/property_details_info.dart';
import 'package:salvest_app/presentation/property%20details/widgets/property_info.dart';
import 'package:salvest_app/presentation/sale%20estate/widgets/custom_button.dart';
import 'package:salvest_app/utility/app_assests.dart';
import 'package:salvest_app/utility/app_colors.dart';

class PropertyDetailsView extends StatelessWidget {
  const PropertyDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          PropertyDetailsCard(
            yearlyReturn: '12.4%',
            deadline: '2 April 2025',
            category: 'Capital Growth',
            iconData: CupertinoIcons.money_dollar_circle_fill,
            categoryColor: Colors.green,
            imageUrls: [
              AppAssets.property,
              AppAssets.property,
              AppAssets.property,
            ], // Replace with real URL
            rating: 4.5,
          ),

          Expanded(
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Column(
                    children: [
                      // Property Info
                      PropertyInfo(),
                      ProertyDetailsInfo(),
                      SizedBox(height: 10),
                      Center(
                        child: Container(
                          width: 365,
                          height: 4,
                          color: Color(0x70088711),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 100.0),
                        child: SizedBox(
                          width: 174,
                          height: 17,
                          child: Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: '\$',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                TextSpan(
                                  text: '10 for each Opportunity',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 118,
                            height: 53,
                            child: Stack(
                              children: [
                                Positioned(
                                  left: 0,
                                  top: 0,
                                  child: Container(
                                    width: 30,
                                    height: 30,
                                    decoration: ShapeDecoration(
                                      color: Colors.white,
                                      shape: OvalBorder(
                                        side: BorderSide(width: 1),
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  left: 88,
                                  top: 0,
                                  child: Container(
                                    width: 30,
                                    height: 30,
                                    decoration: ShapeDecoration(
                                      color: Colors.white,
                                      shape: OvalBorder(
                                        side: BorderSide(width: 1),
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  left: 48,
                                  top: 6,
                                  child: SizedBox(
                                    width: 22,
                                    height: 21,
                                    child: Text(
                                      '15',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontFamily: 'Inter',
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  left: 40,
                                  top: 34,
                                  child: SizedBox(
                                    width: 33,
                                    height: 19,
                                    child: Text.rich(
                                      TextSpan(
                                        children: [
                                          TextSpan(
                                            text: '\$',
                                            style: TextStyle(
                                              color: const Color(0xAA1E1E1E),
                                              fontSize: 10,
                                              fontFamily: 'Inter',
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                          TextSpan(
                                            text: '150',
                                            style: TextStyle(
                                              color: const Color(0xAA1E1E1E),
                                              fontSize: 12,
                                              fontFamily: 'Inter',
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: '48',
                                  style: TextStyle(
                                    color: const Color(0xFF0E891C),
                                    fontSize: 14,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                TextSpan(
                                  text: ' opportunities',
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
                        ],
                      ),
                      CustomSendButton(buttonName: 'invest', onTap: () {}),
                      //  SizedBox(height: 10),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
