import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:salvest_app/business_logic/sale%20property%20bloc/sale_property_bloc.dart';
import 'package:salvest_app/business_logic/send%20property%20bloc/send_property_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salvest_app/presentation/home%20page/widgets/drawer_item.dart';
import 'package:salvest_app/utility/app_assests.dart';
import 'package:salvest_app/utility/app_colors.dart';
import 'package:salvest_app/utility/router.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent, // Light purple background
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            //  padding: EdgeInsets.zero,
            children: [
              DrawerItem(
                icon: AppAssets.homeIcon,
                title: 'Home',
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              DrawerItem(
                icon: AppAssets.profileIcon,
                title: 'Profile',
                onTap: () {
                  GoRouter.of(context).push(AppRouter.kProfileView);
                },
              ),
              DrawerItem(
                icon: AppAssets.chart,
                title: 'Portfolio',
                onTap: () {
                  GoRouter.of(context).push(AppRouter.kPortfolioView);
                },
              ),
              DrawerItem(
                icon: AppAssets.walletWhite,
                title: 'Wallet',
                onTap: () {
                  // GoRouter.of(context).push(AppRouter.kWalitView);
                  GoRouter.of(context).push(AppRouter.kWalitView);
                },
              ),
              DrawerItem(
                icon: AppAssets.autoInvestment,
                title: 'Auto Invest',
                onTap: () {
                  GoRouter.of(context).push(AppRouter.kAutoInvestmentView);
                },
              ),
              DrawerItem(
                icon: AppAssets.saleState,
                title: 'Sale Estate',
                onTap: () {
                  GoRouter.of(context).push(AppRouter.kSaleStateRequestView);
                  // final sendPropertyBloc = context.read<SalePropertyBloc>();
                  // GoRouter.of(context).push(
                  //   AppRouter.kSaleEstateView,
                  //   extra: sendPropertyBloc.state,
                  // );
                },
              ),
              DrawerItem(
                icon: AppAssets.certificateWhite,
                title: 'certifications ',
                onTap: () {
                  GoRouter.of(context).push(AppRouter.kCertificationsView);
                },
              ),
              DrawerItem(
                icon: AppAssets.questionMark,
                title: 'Help',
                onTap: () {
                  GoRouter.of(context).push(AppRouter.kHelpView);
                },
              ),
              const Divider(thickness: 4, color: AppColors.white, indent: 19),
              DrawerItem(
                icon: AppAssets.settingICon,
                title: 'Setting',
                onTap: () {},
              ),

              DrawerItem(
                icon: AppAssets.logoutIcon,
                title: 'Logout',
                onTap: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}
