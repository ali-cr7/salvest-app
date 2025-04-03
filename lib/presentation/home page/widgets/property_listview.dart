// ListView for Property Cards
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:salvest_app/presentation/home%20page/widgets/property_card.dart';
import 'package:salvest_app/utility/app_assests.dart';

class PropertyListView extends StatelessWidget {
  const PropertyListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      // physics:
      //     const NeverScrollableScrollPhysics(), // Disable ListView scrolling
      itemCount: 10, // Repeat PropertyCard 10 times
      itemBuilder: (context, index) {
        return const PropertyCard(
          title: 'Super Deluxe Villa',
          location: 'Lattakia',
          price: '\$200,340',
          availability: '46% available',
          investors: '15002 investors',
          yearlyReturn: '12.4%',
          deadline: '2 April 2025',
          valuation: '\$200,340',
          category: 'Capital Growth',
          iconData: CupertinoIcons.money_dollar_circle_fill,
          categoryColor: Colors.green,
          imageUrls: [
          AppAssets.property,
             AppAssets.property,
             AppAssets.property,
          ], // Replace with real URL
          rating: 4.5,
        );
      },
    );
  }
}
