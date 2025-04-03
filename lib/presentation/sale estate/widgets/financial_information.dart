import 'package:flutter/material.dart';
import 'package:salvest_app/presentation/sale%20estate/widgets/drop_down_field.dart';
import 'package:salvest_app/presentation/sale%20estate/widgets/number_picker.dart';

class FinancialInformation extends StatefulWidget {
  const FinancialInformation({super.key});

  @override
  State<FinancialInformation> createState() => _FinancialInformationState();
}

class _FinancialInformationState extends State<FinancialInformation> {
  int expectedPrice = 350;
  int rooms = 4;
  int bathrooms = 2;
  int propertyAge = 2;
  int overlook = 4;
  int balconySize = 100;

  final List<String> payWays = ['regular', 'matte', 'glossy'];

  String selectedPayWay = 'regular';

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 22,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 12.0, top: 12.0),
          child: Text(
            'financial information:',
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
          label: 'expected price:',
          value: expectedPrice,
          onChanged: (val) => setState(() => expectedPrice = val),
          suffix: 'm²',
        ),

        DropdownField(
          label: 'Decoration:',
          items: payWays,
          selectedValue: selectedPayWay,
          onChanged: (val) => setState(() => selectedPayWay = val),
        ),
      ],
    );
  }
}
