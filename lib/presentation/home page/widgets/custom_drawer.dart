import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:salvest_app/presentation/home%20page/widgets/drawer_item.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[400], // Light purple background
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        //  padding: EdgeInsets.zero,
        children: [
          // Drawer Header

          // Drawer Items
          DrawerItem(
            icon: Icons.home,
            title: 'Home',
            onTap: () {
              Navigator.pop(context);
            },
          ),
          DrawerItem(icon: Icons.person, title: 'Profile', onTap: () {}),
          DrawerItem(icon: Icons.pie_chart, title: 'Portfolio', onTap: () {}),
          DrawerItem(
            icon: Icons.account_balance_wallet,
            title: 'Wallet',
            onTap: () {},
          ),
          DrawerItem(
            icon: Icons.auto_graph,
            title: 'Auto Invest',
            onTap: () {},
          ),
          DrawerItem(icon: Icons.house, title: 'Sale Estate', onTap: () {}),
          DrawerItem(icon: Icons.help, title: 'Help', onTap: () {}),
          DrawerItem(icon: Icons.settings, title: 'Setting', onTap: () {}),
          const Divider(),
          DrawerItem(icon: Icons.logout, title: 'Logout', onTap: () {}),
        ],
      ),
    );
  }
}
