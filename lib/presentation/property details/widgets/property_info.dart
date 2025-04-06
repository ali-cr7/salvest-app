import 'package:flutter/material.dart';
import 'package:salvest_app/presentation/home%20page/widgets/details_row.dart';
import 'package:salvest_app/utility/app_assests.dart';
import 'package:salvest_app/utility/app_colors.dart';

class PropertyInfo extends StatelessWidget {
  const PropertyInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 12.0,
        right: 12.0,
        top: 12.0,
      ),
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
              Image(
                image: AssetImage(AppAssets.bedRoomImage),
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
            padding: const EdgeInsets.symmetric(
              vertical: 8,
              horizontal: 12,
            ),
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              children: [
                DetailsRow(
                  title: 'yearly investment return',
                  value: ' widget.yearlyReturn',
                ),
                //    const Divider(height: 12, thickness: 0.5),
                DetailsRow(
                  title: 'dead line investment',
                  value: ' widget.deadline',
                ),
                //  const Divider(height: 12, thickness: 0.5),
                DetailsRow(
                  title: 'current valuation',
                  value: ' widget.valuation,',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
