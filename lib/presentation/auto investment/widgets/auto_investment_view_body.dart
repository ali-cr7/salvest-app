import 'package:flutter/material.dart';
import 'package:salvest_app/presentation/sale%20estate/widgets/custom_button.dart';
import 'package:salvest_app/presentation/sale%20estate/widgets/drop_down_field.dart';
import 'package:salvest_app/presentation/sale%20estate/widgets/number_picker.dart';

class AutoInvestmentViewBody extends StatefulWidget {
  const AutoInvestmentViewBody({super.key});

  @override
  State<AutoInvestmentViewBody> createState() => _AutoInvestmentViewBodyState();
}

class _AutoInvestmentViewBodyState extends State<AutoInvestmentViewBody> {
  int expectedPrice = 350;
  // int rooms = 4;
  // int bathrooms = 2;
  // int propertyAge = 2;
  // int overlook = 4;
  // int balconySize = 100;

  final List<String> dayOfWeeks = [
    'Sunday',
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
  ];

  String selectedDay = 'Sunday';

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 22,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 12.0, top: 12.0),
          child: Text(
            'investing information:',
            style: TextStyle(
              color: Colors.black,
              fontSize: 15,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        // const SizedBox(height: 5),
        NumberPicker(
          label: 'Investing price:',
          value: expectedPrice,
          onChanged: (val) => setState(() => expectedPrice = val),
          suffix: '\$',
        ),

        DropdownField(
          label: 'day of investing:',
          items: dayOfWeeks,
          selectedValue: selectedDay,
          onChanged: (val) => setState(() => selectedDay = val),
        ),
        DropdownField(
          label: 'them:',
          items: dayOfWeeks,
          selectedValue: selectedDay,
          onChanged: (val) => setState(() => selectedDay = val),
        ),
    
      ],
    );
  }
}
