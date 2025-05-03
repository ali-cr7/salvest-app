import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:salvest_app/presentation/home%20page/widgets/details_row.dart';
import 'package:salvest_app/utility/app_assests.dart';
import 'package:salvest_app/utility/app_colors.dart';

class PropertyInfo extends StatelessWidget {
  const PropertyInfo({super.key, required this.bedRoomNum, required this.bathRoomNum, required this.yearlyProfit, required this.deadLine, required this.valuation});
  final String bedRoomNum;
  final String bathRoomNum;
  final String yearlyProfit;
  final String deadLine;
  final String valuation;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12.0, right: 12.0, top: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 120,
            height: 8,
            decoration: BoxDecoration(
              color: AppColors.lightPurple,
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          Row(
            children: [
              Row(
                children: [
                  Image(image: AssetImage(AppAssets.bedRoomImage)),
                  SizedBox(width: 5),
                  Text(
                    '3',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(width: 5),
                  Container(width: 3, height: 12, color: AppColors.black38),
                  SizedBox(width: 5),
                  Icon(
                    FontAwesomeIcons
                        .bath, // This looks very close to your image
                    size: 16,
                    // color: Colors.black,
                  ),
                  SizedBox(width: 5),
                  Text(
                    '2',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),

              Spacer(),
              Column(
                children: [
                  const Icon(
                    Icons.star_rounded,
                    color: Colors.yellowAccent,
                    size: 28,
                  ),
                  Text(
                    '3.7',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ],
          ),

          Container(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              children: [
                DetailsRow(
                  title: 'yearly investment return',
                  value: yearlyProfit,
                ),
                //    const Divider(height: 12, thickness: 0.5),
                DetailsRow(
                  title: 'Dead line investment',
                  value: deadLine,
                ),
                //  const Divider(height: 12, thickness: 0.5),
                DetailsRow(
                  title: 'current valuation',
                  value: valuation,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
