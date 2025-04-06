import 'package:flutter/material.dart';

class ProertyDetailsInfo extends StatelessWidget {
  const ProertyDetailsInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Colors.white,

          width: 345,
          height: 927,
          child: Text.rich(
            TextSpan(
              children: [
                _buildBoldText('Basic Information:\n'),
                _buildBoldText('Price: '),
                _buildSmallBoldText('\$'),
                _buildNormalText('200,340.\n'),

                _buildBoldText('Location: '),
                _buildNormalText(
                  'Situated in the heart of Lattakia, Syria, close to schools, supermarkets, and public transport.\n',
                ),

                _buildBoldText('Property Details:\n'),
                _buildBoldText('Kind of property: '),
                _buildNormalText('Residential apartment.\n'),

                _buildBoldText('Number of rooms: '),
                _buildNormalText('Four (three bedrooms and a living room).\n'),

                _buildBoldText('Floor: '),
                _buildNormalText('Positioned on the third floor.\n'),

                _buildBoldText('Size: '),
                _buildNormalText('Approximately 1,400 square feet.\n'),

                _buildBoldText('Age of building: '),
                _buildNormalText(
                  'Constructed 10 years ago and well-maintained.\n',
                ),

                _buildBoldText('Legal Information:\n'),
                _buildBoldText('Legal status: '),
                _buildNormalText(
                  'Fully registered, compliant with legal requirements, and free from disputes.\n',
                ),

                _buildBoldText('Interior Features:\n'),
                _buildBoldText('Flooring: '),
                _buildNormalText(
                  'High-quality marble flooring in living areas and wooden flooring in bedrooms.\n',
                ),

                _buildBoldText('Bathrooms: '),
                _buildNormalText(
                  'Two modern bathrooms, fully tiled and fitted with contemporary fixtures.\n',
                ),

                _buildBoldText('Kitchen: '),
                _buildNormalText(
                  'Includes custom cabinetry, built-in appliances, and ample counter space.\n',
                ),

                _buildBoldText('Lighting: '),
                _buildNormalText(
                  'Energy-efficient LED lighting throughout with stylish fixtures.\n',
                ),

                _buildBoldText('Storage: '),
                _buildNormalText(
                  'Additional built-in closets and storage spaces for convenience.\n',
                ),

                _buildBoldText('Amenities:\n'),
                _buildBoldText('Heating/Cooling: '),
                _buildNormalText(
                  'Central air-conditioning and heating systems.\n',
                ),

                _buildBoldText('Balcony: '),
                _buildNormalText('Includes a private balcony with a view.\n'),

                _buildBoldText('Parking: '),
                _buildNormalText(
                  'Reserved parking space within the building.\n',
                ),

                _buildBoldText('Elevator: '),
                _buildNormalText('Modern elevator for easy access.\n'),

                _buildBoldText('Security: '),
                _buildNormalText(
                  'Secure entry system with surveillance cameras.\n',
                ),

                _buildBoldText('Connectivity: '),
                _buildNormalText(
                  'High-speed internet access and cable TV ready.\n',
                ),

                _buildBoldText('Additional Perks:\n'),
                _buildBoldText('Neighborhood: '),
                _buildNormalText(
                  'Located in a safe and vibrant neighborhood.\n',
                ),

                _buildBoldText('Accessibility: '),
                _buildNormalText(
                  'Designed for easy access for individuals with mobility challenges.\n',
                ),

                _buildBoldText('Noise Levels: '),
                _buildNormalText(
                  'Quiet building with soundproofed walls for privacy.\n',
                ),
                _buildBoldText('Shared Areas: '),
                _buildNormalText(
                  'Quiet building with soundproofed walls for privacy.\n',
                ),
                _buildBoldText('Investment kind: '),
                _buildNormalText(
                  'Quiet building with soundproofed walls for privacy.\n',
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

TextSpan _buildBoldText(String text) {
  return TextSpan(
    text: text,
    style: const TextStyle(
      color: Colors.black,
      fontSize: 14,
      fontFamily: 'Inter',
      fontWeight: FontWeight.w600,
    ),
  );
}

TextSpan _buildSmallBoldText(String text) {
  return TextSpan(
    text: text,
    style: const TextStyle(
      color: Colors.black,
      fontSize: 12,
      fontFamily: 'Inter',
      fontWeight: FontWeight.w600,
    ),
  );
}

TextSpan _buildNormalText(String text) {
  return TextSpan(
    text: text,
    style: const TextStyle(
      color: Colors.black,
      fontSize: 14,
      fontFamily: 'Inter',
      fontWeight: FontWeight.w400,
    ),
  );
}
