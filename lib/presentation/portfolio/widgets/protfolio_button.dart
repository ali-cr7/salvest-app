import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:salvest_app/presentation/portfolio/widgets/protfolio_item.dart';
import 'package:salvest_app/utility/app_assests.dart';
import 'package:salvest_app/utility/router.dart';

class ProtfolioButtons extends StatelessWidget {
  const ProtfolioButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          spacing: 25,
          children: [
            InkWell(
              onTap: () {
                GoRouter.of(context).push(AppRouter.kCapitalGrowthView);
              },
              child: ProtfolioItem(
                color: const Color(0x998CE996),
                icon: AppAssets.cashGreen,
                text: 'Capital Growth',
              ),
            ),
            ProtfolioItem(
              color: const Color(0x99D8EC43),
              icon: AppAssets.balanceIcon,
              text: 'Balanced',
            ),
          ],
        ),
        SizedBox(height: 20),
        ProtfolioItem(
          color: const Color(0x99C0B4FF),
          icon: AppAssets.highIncome,
          text: 'High Incoming',
        ),
      ],
    );
  }
}
