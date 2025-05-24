import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salvest_app/business_logic/property%20for%20investment%20bloc/properties_for_investment_bloc.dart';
import 'package:salvest_app/presentation/home%20page/widgets/category_tab.dart'
    show CategoryTab;

class CategoryTabs extends StatefulWidget {
  const CategoryTabs({super.key});

  @override
  State<CategoryTabs> createState() => _CategoryTabsState();
}

class _CategoryTabsState extends State<CategoryTabs> {
  int selectedIndex = 0;

  final List<String> categories = [
    'vila',
    'Land',
    'Office',
    'Commercial Store',
    'Apartment',
    'Other',
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(categories.length, (index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
              context.read<PropertiesForInvestmentBloc>().add(
                GetPropertiesForInvestmentsEvent(
                  propertyType: categories[index],
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: CategoryTab(
                text: categories[index],
                isSelected: selectedIndex == index,
              ),
            ),
          );
        }),
      ),
    );
  }
}
