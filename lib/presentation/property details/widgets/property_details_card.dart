import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:salvest_app/presentation/home%20page/widgets/card_header.dart';
import 'package:salvest_app/utility/api_config/api_config.dart';

import 'package:salvest_app/utility/router.dart';

class PropertyDetailsCard extends StatefulWidget {
  final String yearlyReturn;
  final String deadline;

  final String category;
  final IconData iconData;
  final Color categoryColor;
  final List<String?> imageUrls;
  final double rating;

  const PropertyDetailsCard({
    super.key,

    required this.yearlyReturn,
    required this.deadline,

    required this.category,
    required this.iconData,
    required this.categoryColor,
    required this.imageUrls,
    required this.rating,
  });

  @override
  _PropertyDetailsCardState createState() => _PropertyDetailsCardState();
}

class _PropertyDetailsCardState extends State<PropertyDetailsCard> {
  int _currentImageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      //  margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        //  border: Border.all(color: Colors.purple, width: 1),
        //  borderRadius: BorderRadius.circular(12),
        color: Colors.white,
      ),
      child: Column(
        children: [
          Stack(
            children: [
              CarouselSlider(
                items:
                    widget.imageUrls.map((imageUrl) {
                      final fullImageUrl =
                          Uri.parse(
                            APIConfig.baseUrl,
                          ).resolve(imageUrl!).toString();

                      print('Image URL: $fullImageUrl');
                      return ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(12),
                          topRight: Radius.circular(12),
                        ),
                        child: CachedNetworkImage(
                          imageUrl: fullImageUrl,
                          width: 200,
                          height: 300,
                          fit: BoxFit.fill,
                          placeholder:
                              (context, url) => Container(
                                color: Colors.grey[300],
                                child: const Center(
                                  child: CircularProgressIndicator(),
                                ),
                              ),
                          errorWidget:
                              (context, url, error) => Container(
                                color: Colors.grey[300],
                                child: const Center(child: Icon(Icons.error)),
                              ),
                          imageBuilder:
                              (context, imageProvider) => Image(
                                image: imageProvider,
                                fit: BoxFit.cover,
                                width: double.infinity,
                                height: 300,
                              ),
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
              IconButton(
                onPressed: () {
                  GoRouter.of(context).push(AppRouter.kHomePageView);
                },
                icon: Icon(Icons.arrow_back_ios),
              ),
              // Category Tag
              Positioned(
                top: 10,
                right: 10,
                child: CardHeader(
                  category: widget.category,
                  iconData: widget.iconData,
                  categoryColor: widget.categoryColor,
                ),
              ),

              // Star Rating
            ],
          ),
        ],
      ),
    );
  }
}
