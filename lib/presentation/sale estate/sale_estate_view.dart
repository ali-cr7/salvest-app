import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:salvest_app/presentation/auth/widgets/custom_button.dart';
import 'package:salvest_app/presentation/sale%20estate/widgets/check_mark_box.dart';
import 'package:salvest_app/presentation/sale%20estate/widgets/custom_button.dart';
import 'package:salvest_app/presentation/sale%20estate/widgets/financial_information.dart';
import 'package:salvest_app/presentation/sale%20estate/widgets/property_description.dart';
import 'package:salvest_app/presentation/sale%20estate/widgets/property_images.dart';
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
                    spacing: 10,
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
                      SaleEstateContainer(
                        height: 280,
                        child: PropertyImagesUploader(),
                      ),
                      const SizedBox(height: 10),
                      SaleEstateContainer(
                        height: 280,
                        child: PropertyImagesUploader(
                          title: "Property documents",
                          maxImages: 8,
                        ),
                      ),
                      const SizedBox(height: 10),
                      SaleEstateContainer(
                        height: 215,
                        child: PropertyImagesUploader(
                          title: 'id images (2 faces):',
                          maxImages: 2,
                        ),
                      ),
                      const SizedBox(height: 10),

                      Padding(
                        padding: const EdgeInsets.only(left: 33.0),
                        child: Row(
                          children: [
                            CheckMarkBox(),
                            SizedBox(width: 10),
                            Text(
                              'accept all ',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Text(
                              'conditions',
                              style: TextStyle(
                                color: const Color(0xFF22832D),
                                fontSize: 12,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w400,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ],
                        ),
                      ),

                      Padding(
                        padding: EdgeInsets.only(top: 20, bottom: 8.0),
                        child: CustomSendButton(
                          buttonName: 'send',
                          onTap: () {}),
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
