import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:salvest_app/presentation/certification/widgets/certification_item.dart';
import 'package:salvest_app/utility/app_assests.dart';
import 'package:salvest_app/utility/app_colors.dart';
import 'package:salvest_app/utility/router.dart';

class CertificationsView extends StatelessWidget {
  const CertificationsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            GoRouter.of(context).pop();
          },
        ),
        title: const Text(
          ' Selling Certifications',
          style: TextStyle(color: Colors.black, fontSize: 18),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            spacing: 20,
            children: [
              // CertifiactionsItem(
              //   icon: AppAssets.certificateGreen,
              //   itemColor: Color(0x477BF383),
              //   text: 'Buying Certification',
              // ),
              InkWell(
                onTap: () {
                  GoRouter.of(
                    context,
                  ).push(AppRouter.kInvestingCertificationDetailsView);
                },
                child: CertifiactionsItem(
                  icon: AppAssets.certificateBlue,
                  itemColor: Color(0x3F9A8AEC),
                  text: 'Selling Certification',
                ),
              ),
              InkWell(
                onTap: () {
                  GoRouter.of(
                    context,
                  ).push(AppRouter.kOwneredStakesCretifications);
                },
                child: CertifiactionsItem(
                  icon: AppAssets.certificateBlue,
                  itemColor: Color(0x3F9A8AEC),
                  text: 'Ownered Stakes Certification',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
