import 'package:flutter/material.dart';
import 'package:salvest_app/presentation/sale%20estate/widgets/property_type_option.dart';

class PropertyTypeWidget extends StatefulWidget {
  const PropertyTypeWidget({super.key});

  @override
  State<PropertyTypeWidget> createState() => _PropertyTypeWidgetState();
}

class _PropertyTypeWidgetState extends State<PropertyTypeWidget> {
  String? selectedProperty;
  bool showOtherField = false;
  final TextEditingController _otherController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 12.0, top: 12.0),
          child: Text(
            'Property Type :',
            style: TextStyle(
              color: Colors.black,
              fontSize: 15,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        const SizedBox(height: 10),
        Row(
          spacing: 85,
          children: [
            PropertyTypeOption(
              label: 'Villa',
              groupValue: selectedProperty,
              onChanged: _handleSelection,
            ),
            PropertyTypeOption(
              label: 'Land',
              groupValue: selectedProperty,
              onChanged: _handleSelection,
            ),
          ],
        ),
        Row(
          spacing: 75,
          children: [
            PropertyTypeOption(
              label: 'Office',
              groupValue: selectedProperty,
              onChanged: _handleSelection,
            ),
            PropertyTypeOption(
              label: 'Apartment',
              groupValue: selectedProperty,
              onChanged: _handleSelection,
            ),
          ],
        ),
        Row(
          children: [
            PropertyTypeOption(
              label: 'Commercial Store',
              groupValue: selectedProperty,
              onChanged: _handleSelection,
            ),
          ],
        ),
        PropertyTypeOption(
          label: 'Other',
          groupValue: selectedProperty,
          onChanged: _handleSelection,
        ),
        SizedBox(height: 30),
        if (showOtherField) ...[
          //      const SizedBox(height: 18, width: 52.02),
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Column(
              spacing: -20,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Other :',
                  style: TextStyle(
                    color: Colors.black.withValues(alpha: 79),
                    fontSize: 14,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(
                  width: 259.02,
                  height: 18.50,
                  child: TextField(
                    controller: _otherController,
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ],
    );
  }

  void _handleSelection(String? value) {
    setState(() {
      selectedProperty = value;
      showOtherField = (value == 'Other');
    });
  }
}
