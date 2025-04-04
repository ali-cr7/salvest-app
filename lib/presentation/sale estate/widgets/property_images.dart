import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:salvest_app/utility/app_assests.dart';

class PropertyImagesUploader extends StatefulWidget {
  final String title;
  final int maxImages;

  const PropertyImagesUploader({
    super.key,
    this.title = "Property images:",
    this.maxImages = 8,
  });

  @override
  _PropertyImagesUploaderState createState() => _PropertyImagesUploaderState();
}

class _PropertyImagesUploaderState extends State<PropertyImagesUploader> {
  static const String photoIcon = "assets/images/photo_icon.png"; // Default Image
  final ImagePicker _picker = ImagePicker(); // Image Picker instance
  List<File> images = []; // List to store picked images

  // Function to pick images
  Future<void> _uploadImage() async {
    if (images.length >= widget.maxImages) return; // Prevent exceeding limit

    final XFile? pickedFile = await _picker.pickImage(
      source: ImageSource.gallery,
    );

    if (pickedFile != null) {
      setState(() {
        images.add(File(pickedFile.path)); // Add new image
      });
    }
  }

  // Function to remove an image
  void _removeImage(int index) {
    setState(() {
      images.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Dynamic Title
          Text(
            widget.title,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 4),

          // Notice Text
          const Text(
            'notice: please make the photos clear and real',
            style: TextStyle(
              color: Color(0x9EF1272A),
              fontSize: 12,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: 8),

          // Image Upload Section
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: _uploadImage,
                child: Image.asset(
                  AppAssets.uploadIcon,
                  width: 24,
                  height: 24,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 10),

              Container(
                padding: const EdgeInsets.all(8),
                decoration: ShapeDecoration(
                  color: const Color(0x60D9D9D9),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: images.length < widget.maxImages
                      ? images.length + 1
                      : images.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                  ),
                  itemBuilder: (context, index) {
                    if (index == images.length && images.length < widget.maxImages) {
                      return GestureDetector(
                        onTap: _uploadImage,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.grey.shade300,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Image.asset(photoIcon, width: 40, height: 40),
                        ),
                      );
                    }
                    return Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(6),
                          child: Image.file(images[index], fit: BoxFit.cover),
                        ),
                        Positioned(
                          top: 1,
                          right: 2,
                          child: GestureDetector(
                            onTap: () => _removeImage(index),
                            child: Container(
                              padding: const EdgeInsets.all(2),
                              decoration: const BoxDecoration(
                                color: Colors.redAccent,
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(
                                Icons.close,
                                size: 16,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
