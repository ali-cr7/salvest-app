import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

import 'package:salvest_app/presentation/home%20page/widgets/custom_drawer.dart';
import 'package:salvest_app/presentation/home%20page/widgets/home_page_view_body.dart';

import 'package:salvest_app/utility/app_colors.dart';

class HomePageView extends StatelessWidget {
  const HomePageView({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(gradient: AppColors.blueGradient),
      child: ZoomDrawer(
        angle: 0.0,
        borderRadius: 30.0,
        mainScreenOverlayColor: Colors.transparent,
        menuBackgroundColor: Colors.transparent,
        menuScreen: CustomDrawer(),
        mainScreen: HomePageViewBody(),
      ),
    );
  }
}  






// Card Header Class



