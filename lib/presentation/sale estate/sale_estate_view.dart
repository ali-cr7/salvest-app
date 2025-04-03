import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:salvest_app/presentation/sale%20estate/widgets/drop_down_field.dart';
import 'package:salvest_app/presentation/sale%20estate/widgets/financial_information.dart';
import 'package:salvest_app/presentation/sale%20estate/widgets/number_picker.dart';
import 'package:salvest_app/presentation/sale%20estate/widgets/property_description.dart';
import 'package:salvest_app/presentation/sale%20estate/widgets/property_type.dart';
import 'package:salvest_app/presentation/sale%20estate/widgets/sales_estate_container.dart';
import 'package:salvest_app/utility/app_colors.dart';
import 'package:intl/intl.dart';

class SaleEstateView extends StatelessWidget {
  const SaleEstateView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            GoRouter.of(context).pop();
          },
        ),
        title: const Text(
          'Sale Estate',
          style: TextStyle(color: Colors.black, fontSize: 18),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      backgroundColor: AppColors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 38.0),
            child: Text(
              'Enter Real Estate Informatidon:',
              style: TextStyle(
                color: Colors.black.withValues(alpha: 102),
                fontSize: 16,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          SizedBox(height: 20),
          Expanded(
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Column(
                    children: [
                      SaleEstateContainer(
                        height: 309,
                        child: PropertyTypeWidget(),
                      ),
                      const SizedBox(height: 10),
                      SaleEstateContainer(
                        height: 575,
                        child: PropertyDescriptionWidget(),
                      ),
                      const SizedBox(height: 10),
                      SaleEstateContainer(
                        height: 170,
                        child: FinancialInformation(),
                      ),
                      const SizedBox(height: 10),
                      SaleEstateContainer(height: 280, child: Text('data')),
                      const SizedBox(height: 10),
                      SaleEstateContainer(height: 280, child: Text('data')),
                      const SizedBox(height: 10),
                      SaleEstateContainer(height: 215, child: Text('data')),
                      const SizedBox(height: 10),
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: 'accept all ',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            TextSpan(
                              text: 'conditions',
                              style: TextStyle(
                                color: const Color(0xFF22832D),
                                fontSize: 12,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class PropertyTypeSelector extends StatefulWidget {
  @override
  _PropertyTypeSelectorState createState() => _PropertyTypeSelectorState();
}

class _PropertyTypeSelectorState extends State<PropertyTypeSelector> {
  String? selectedPropertyType;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Radio<String>(
          value: 'Villa',
          groupValue: selectedPropertyType,
          onChanged: (value) {
            setState(() {
              selectedPropertyType = value;
            });
          },
        ),
        const Text(
          'Villa',
          style: TextStyle(fontSize: 16, color: Colors.black),
        ),
      ],
    );
  }
}

class PriceSelector extends StatefulWidget {
  @override
  _PriceSelectorState createState() => _PriceSelectorState();
}

class _PriceSelectorState extends State<PriceSelector> {
  int price = 150000;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Expected Price: ', style: TextStyle(fontSize: 20)),
          SizedBox(width: 10),
          Text(
            NumberFormat('#,###').format(price),
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(width: 10),
          DropdownButtonHideUnderline(
            child: DropdownButton<int>(
              items:
                  <int>[1, 5, 10].map((int value) {
                    return DropdownMenuItem<int>(
                      value: value,
                      child: Text('$value'),
                    );
                  }).toList(),
              onChanged: (value) {
                setState(() {
                  price += value ?? 0;
                });
              },
              icon: Icon(Icons.arrow_drop_up),
            ),
          ),
          SizedBox(width: 10),
          DropdownButtonHideUnderline(
            child: DropdownButton<int>(
              items:
                  <int>[1, 5, 10].map((int value) {
                    return DropdownMenuItem<int>(
                      value: -value,
                      child: Text('$value'),
                    );
                  }).toList(),
              onChanged: (value) {
                setState(() {
                  price += value ?? 0;
                });
              },
              icon: Icon(Icons.arrow_drop_down),
            ),
          ),
          SizedBox(width: 10),
          Text('\$', style: TextStyle(fontSize: 20)),
        ],
      ),
    );
  }
}

class KitchenTypeDropdown extends StatefulWidget {
  @override
  _KitchenTypeDropdownState createState() => _KitchenTypeDropdownState();
}

class _KitchenTypeDropdownState extends State<KitchenTypeDropdown> {
  String selectedKitchenType = 'western';
  final List<String> kitchenTypes = ['western', 'modern', 'traditional'];

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text(
          'Kitchen Type:',
          style: TextStyle(fontSize: 14, color: Colors.black),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: DropdownButtonFormField<String>(
            value: selectedKitchenType,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 8,
              ),
            ),
            items:
                kitchenTypes.map((String type) {
                  return DropdownMenuItem<String>(
                    value: type,
                    child: Text(type),
                  );
                }).toList(),
            onChanged: (newValue) {
              setState(() {
                selectedKitchenType = newValue!;
              });
            },
          ),
        ),
      ],
    );
  }
}
