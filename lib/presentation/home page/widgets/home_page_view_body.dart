import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:go_router/go_router.dart';
import 'package:salvest_app/presentation/home%20page/widgets/card_tabs.dart';

import 'package:salvest_app/presentation/home%20page/widgets/custom_drawer.dart';
import 'package:salvest_app/presentation/home%20page/widgets/property_listview.dart';
import 'package:salvest_app/presentation/home%20page/widgets/search_bar.dart';
import 'package:salvest_app/utility/router.dart';

class HomePageViewBody extends StatelessWidget {
  const HomePageViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Ali Mossa',
          style: TextStyle(color: Colors.black, fontSize: 18),
        ),
        centerTitle: true,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                ZoomDrawer.of(context)!.toggle();
              },
            );
          },
        ),
        actions: [
          InkWell(
            onTap: () {
              GoRouter.of(context).push(AppRouter.kNotificationView);
            },
            child: Icon(Icons.notifications, color: Colors.black),
          ),
          SizedBox(width: 10),
        ],
      ),
      drawer: const CustomDrawer(),

      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10),
              CustomSearchBar(),
              SizedBox(height: 20),
              CategoryTabs(),
              SizedBox(height: 20),
              // ListView Builder to Repeat PropertyCard 10 times
              SizedBox(
                height: 650, // Fixed height to avoid infinite scroll
                child: PropertyListView(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
