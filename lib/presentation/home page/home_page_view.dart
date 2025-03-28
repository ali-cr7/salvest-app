import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:salvest_app/presentation/home%20page/widgets/card_tabs.dart';
import 'package:salvest_app/presentation/home%20page/widgets/custom_appbar.dart';
import 'package:salvest_app/presentation/home%20page/widgets/custom_drawer.dart';
import 'package:salvest_app/presentation/home%20page/widgets/home_page_view_body.dart';
import 'package:salvest_app/presentation/home%20page/widgets/property_card.dart';
import 'package:salvest_app/presentation/home%20page/widgets/property_listview.dart';
import 'package:salvest_app/presentation/home%20page/widgets/search_bar.dart';
import 'package:salvest_app/utility/app_colors.dart';

// Home Screen
class HomePageView extends StatelessWidget {
  const HomePageView({super.key});

  @override
  Widget build(BuildContext context) {
    return ZoomDrawer(
      //  showShadow: true,
      angle: 0.0,
      borderRadius: 30.0,
      menuBackgroundColor: AppColors.lightPurple ?? Colors.white,
      menuScreen: CustomDrawer(),
      mainScreen: HomePageViewBody(),
    );
  }
}






// Card Header Class



