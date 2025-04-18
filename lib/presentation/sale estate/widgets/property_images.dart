import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:salvest_app/business_logic/sale%20property%20bloc/sale_property_bloc.dart';

import 'package:salvest_app/utility/app_assests.dart';

class PropertyImagesUploader extends StatelessWidget {
  final String title;
  final int maxImages;
  final bool isIdImages;
  final bool isPropertyDocuments;

  const PropertyImagesUploader({
    super.key,
    this.title = "Property images:",
    this.maxImages = 8,
    this.isIdImages = false,
    this.isPropertyDocuments = false,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SalePropertyBloc, SalePropertyState>(
      builder: (context, state) {
        final images = isIdImages 
            ? state.idImages 
            : isPropertyDocuments 
                ? state.propertyDocument 
                : state.images;

        return Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.grey.shade100,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 4),
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
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () => _uploadImage(context),
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
                      itemCount: images.length < maxImages 
                          ? images.length + 1 
                          : images.length,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                        crossAxisSpacing: 8,
                        mainAxisSpacing: 8,
                      ),
                      itemBuilder: (context, index) {
                        if (index == images.length && images.length < maxImages) {
                          return GestureDetector(
                            onTap: () => _uploadImage(context),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.grey.shade300,
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Image.asset(
                                "assets/images/photo_icon.png",
                                width: 40,
                                height: 40,
                              ),
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
                                onTap: () => _removeImage(context, index),
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
      },
    );
  }

  Future<void> _uploadImage(BuildContext context) async {
    final state = context.read<SalePropertyBloc>().state;
    final currentImages = isIdImages 
        ? state.idImages 
        : isPropertyDocuments 
            ? state.propertyDocument 
            : state.images;

    if (currentImages.length >= maxImages) return;

    final XFile? pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );

    if (pickedFile != null) {
      final event = isIdImages
          ? UpdateIdImagesEvent(idImages: [...currentImages, File(pickedFile.path)])
          : isPropertyDocuments
              ? UpdatePropertyDocumentsEvent(
                  propertyDocuments: [...currentImages, File(pickedFile.path)])
              : UpdateImagesEvent(images: [...currentImages, File(pickedFile.path)]);

      context.read<SalePropertyBloc>().add(event);
    }
  }

  void _removeImage(BuildContext context, int index) {
    final state = context.read<SalePropertyBloc>().state;
    final currentImages = isIdImages
        ? List<File>.from(state.idImages)
        : isPropertyDocuments
            ? List<File>.from(state.propertyDocument)
            : List<File>.from(state.images);

    if (index >= 0 && index < currentImages.length) {
      currentImages.removeAt(index);
      
      final event = isIdImages
          ? UpdateIdImagesEvent(idImages: currentImages)
          : isPropertyDocuments
              ? UpdatePropertyDocumentsEvent(propertyDocuments: currentImages)
              : UpdateImagesEvent(images: currentImages);

      context.read<SalePropertyBloc>().add(event);
    }
  }
}