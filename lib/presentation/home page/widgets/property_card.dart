// Single Tab
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'package:salvest_app/presentation/home%20page/widgets/card_header.dart';
import 'package:salvest_app/presentation/home%20page/widgets/details_row.dart';

class PropertyCard extends StatefulWidget {
  final String title;
  final String location;
  final String price;
  final String availability;
  final String investors;
  final String yearlyReturn;
  final String deadline;
  final String valuation;
  final String category;
  final IconData iconData;
  final Color categoryColor;
  final List<String> imageUrls;
  final double rating;

  const PropertyCard({
    super.key,
    required this.title,
    required this.location,
    required this.price,
    required this.availability,
    required this.investors,
    required this.yearlyReturn,
    required this.deadline,
    required this.valuation,
    required this.category,
    required this.iconData,
    required this.categoryColor,
    required this.imageUrls,
    required this.rating,
  });

  @override
  _PropertyCardState createState() => _PropertyCardState();
}

class _PropertyCardState extends State<PropertyCard> {
  int _currentImageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.purple, width: 1),
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
      ),
      child: Column(
        children: [
          Stack(
            children: [
              // Image Slider
              CarouselSlider(
                disableGesture: true,
                items:
                    widget.imageUrls.map((imageUrl) {
                      return ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(12),
                          topRight: Radius.circular(12),
                        ),
                        child: Image(
                          image: AssetImage(imageUrl),
                          //  imageUrl,
                          width: double.infinity,
                          height: 300,
                          fit: BoxFit.cover,
                        ),
                      );
                    }).toList(),
                options: CarouselOptions(
                  height: 300,
                  autoPlay: false,
                  enlargeCenterPage: true,
                  viewportFraction: 1,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _currentImageIndex = index;
                    });
                  },
                ),
              ),

              // Page Indicators (Dots)
              Positioned(
                bottom: 8,
                left: 0,
                right: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:
                      widget.imageUrls.asMap().entries.map((entry) {
                        return Container(
                          width: _currentImageIndex == entry.key ? 10 : 6,
                          height: _currentImageIndex == entry.key ? 10 : 6,
                          margin: const EdgeInsets.symmetric(horizontal: 3),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color:
                                _currentImageIndex == entry.key
                                    ? Colors.white
                                    : Colors.white.withOpacity(0.5),
                          ),
                        );
                      }).toList(),
                ),
              ),

              // Category Tag
              Positioned(
                top: 10,
                left: 10,
                child: CardHeader(
                  category: widget.category,
                  iconData: widget.iconData,
                  categoryColor: widget.categoryColor,
                ),
              ),

              // Star Rating
              Positioned(
                top: 10,
                right: 10,
                child: Column(
                  children: [
                    const Icon(
                      Icons.star_rounded,
                      color: Colors.yellowAccent,
                      size: 28,
                    ),

                    Text(
                      widget.rating.toString(),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          // Property Info
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(Icons.location_on, size: 16, color: Colors.grey),
                    const SizedBox(width: 4),
                    Text(
                      widget.location,
                      style: TextStyle(fontSize: 12, color: Colors.black54),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                Row(
                  spacing: 110,
                  children: [
                    Text(
                      widget.title,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      widget.availability,
                      style: TextStyle(color: Colors.green, fontSize: 12),
                    ),
                  ],
                ),
                const SizedBox(height: 4),

                const SizedBox(height: 4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.price,
                      style: TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),

                    Text(
                      widget.investors,
                      style: TextStyle(color: Colors.black54, fontSize: 12),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 12,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    children: [
                      DetailsRow(
                        title: 'yearly investment return',
                        value: widget.yearlyReturn,
                      ),
                      //    const Divider(height: 12, thickness: 0.5),
                      DetailsRow(
                        title: 'dead line investment',
                        value: widget.deadline,
                      ),
                      //  const Divider(height: 12, thickness: 0.5),
                      DetailsRow(
                        title: 'current valuation',
                        value: widget.valuation,
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
