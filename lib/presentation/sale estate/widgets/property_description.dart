import 'package:flutter/material.dart';
import 'package:salvest_app/presentation/sale%20estate/widgets/drop_down_field.dart';
import 'package:salvest_app/presentation/sale%20estate/widgets/number_picker.dart';

class PropertyDescriptionWidget extends StatefulWidget {
  const PropertyDescriptionWidget({super.key});

  @override
  State<PropertyDescriptionWidget> createState() =>
      _PropertyDescriptionWidgetState();
}

class _PropertyDescriptionWidgetState extends State<PropertyDescriptionWidget> {
  int space = 350;
  int rooms = 4;
  int bathrooms = 2;
  int propertyAge = 2;
  int overlook = 4;
  int balconySize = 100;

  final List<String> decorations = ['deluxe', 'modern', 'classic'];
  final List<String> kitchenTypes = ['western', 'open', 'closed'];
  final List<String> flooringTypes = ['granite', 'marble', 'wood'];
  final List<String> paintingTypes = ['regular', 'matte', 'glossy'];

  String selectedDecoration = 'deluxe';
  String selectedKitchen = 'western';
  String selectedFlooring = 'granite';
  String selectedPainting = 'regular';

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 22,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Text(
            'Property descriptions:',
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
          label: 'Space:',
          value: space,
          onChanged: (val) => setState(() => space = val),
          suffix: 'm²',
        ),
        NumberPicker(
          label: 'Number of rooms:',
          value: rooms,
          onChanged: (val) => setState(() => rooms = val),
        ),
        NumberPicker(
          label: 'Number of bathrooms:',
          value: bathrooms,
          onChanged: (val) => setState(() => bathrooms = val),
        ),
        NumberPicker(
          label: 'Property age:',
          value: propertyAge,
          onChanged: (val) => setState(() => propertyAge = val),
          suffix: 'year',
        ),
        DropdownField(
          label: 'Decoration:',
          items: decorations,
          selectedValue: selectedDecoration,
          onChanged: (val) => setState(() => selectedDecoration = val),
        ),
        DropdownField(
          label: 'Kitchen type:',
          items: kitchenTypes,
          selectedValue: selectedKitchen,
          onChanged: (val) => setState(() => selectedKitchen = val),
        ),
        DropdownField(
          label: 'Flooring type:',
          items: flooringTypes,
          selectedValue: selectedFlooring,
          onChanged: (val) => setState(() => selectedFlooring = val),
        ),
        NumberPicker(
          label: 'Overlook from 10:',
          value: overlook,
          onChanged: (val) => setState(() => overlook = val),
        ),
        NumberPicker(
          label: 'Balcony size:',
          value: balconySize,
          onChanged: (val) => setState(() => balconySize = val),
          suffix: 'm²',
        ),
        DropdownField(
          label: 'Painting type:',
          items: paintingTypes,
          selectedValue: selectedPainting,
          onChanged: (val) => setState(() => selectedPainting = val),
        ),
      ],
    );
  }
}
