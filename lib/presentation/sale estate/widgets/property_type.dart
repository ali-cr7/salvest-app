import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salvest_app/business_logic/sale%20property%20bloc/sale_property_bloc.dart';
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
    return BlocListener<SalePropertyBloc, SalePropertyState>(
      listener: (context, state) {
        // Update local state if needed when bloc state changes
        if (state.propertyType != selectedProperty &&
            state.propertyType != 'Other') {
          setState(() {
            selectedProperty = state.propertyType;
            showOtherField = false;
          });   
        }
      },
      child: Column(
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
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: SizedBox(
                width: 259.02,
                height: 18.50,
                child: TextField(
                  controller: _otherController,
                  decoration: InputDecoration(
                    hintText: 'Other :',
                    hintStyle: TextStyle(
                      color: Colors.black.withValues(alpha: 79),
                      fontSize: 14,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                    ),
                    border: UnderlineInputBorder(),
                  ),
                  onChanged: (value) {
                    // Send update when typing in "Other" field
                    context.read<SalePropertyBloc>().add(
                      UpdatePropertyTypeEvent(propertyType: value),
                    );
                  },
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }

  void _handleSelection(String? value) {
    setState(() {
      selectedProperty = value;
      showOtherField = (value == 'Other');
    });

    // Send event to bloc
    final propertyType = value == 'Other' ? _otherController.text : value;
    if (propertyType != null) {
      context.read<SalePropertyBloc>().add(
        UpdatePropertyTypeEvent(propertyType: propertyType),
      );
    }
  }
}
