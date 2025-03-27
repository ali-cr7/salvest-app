// ListView for Property Cards
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:salvest_app/presentation/home%20page/widgets/property_card.dart';

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
            'https://as2.ftcdn.net/jpg/03/00/10/35/1000_F_300103505_oBLUa4dEG8mFdP60givbyNdoy7aHFmuu.webp',
            'https://as2.ftcdn.net/jpg/03/00/10/35/1000_F_300103505_oBLUa4dEG8mFdP60givbyNdoy7aHFmuu.webp',
            'https://as2.ftcdn.net/jpg/03/00/10/35/1000_F_300103505_oBLUa4dEG8mFdP60givbyNdoy7aHFmuu.webp',
          ], // Replace with real URL
          rating: 4.5,
        );
      },
    );
  }
}
