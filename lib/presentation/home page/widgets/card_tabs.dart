// Category Tabs Class
import 'package:flutter/material.dart';
import 'package:salvest_app/presentation/home%20page/widgets/category_tab.dart'
    show CategoryTab;
import 'package:salvest_app/presentation/home%20page/widgets/property_card.dart';

class CategoryTabs extends StatelessWidget {
  const CategoryTabs({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CategoryTab(text: 'Houses', isSelected: true),
        CategoryTab(text: 'Apartment'),
        CategoryTab(text: 'Hotels'),
        CategoryTab(text: 'Farms'),
      ],
    );
  }
}
