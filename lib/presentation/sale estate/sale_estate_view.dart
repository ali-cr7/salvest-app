import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:go_router/go_router.dart';
import 'package:salvest_app/business_logic/sale%20property%20bloc/sale_property_bloc.dart';
import 'package:salvest_app/business_logic/send%20property%20bloc/send_property_bloc.dart';
import 'package:salvest_app/presentation/auth/widgets/custom_button.dart';
import 'package:salvest_app/presentation/sale%20estate/widgets/check_mark_box.dart';
import 'package:salvest_app/presentation/sale%20estate/widgets/custom_button.dart';
import 'package:salvest_app/presentation/sale%20estate/widgets/financial_information.dart';
import 'package:salvest_app/presentation/sale%20estate/widgets/location_info.dart';
import 'package:salvest_app/presentation/sale%20estate/widgets/property_description.dart';
import 'package:salvest_app/presentation/sale%20estate/widgets/property_images.dart';
import 'package:salvest_app/presentation/sale%20estate/widgets/property_type.dart';
import 'package:salvest_app/presentation/sale%20estate/widgets/sales_estate_container.dart';
import 'package:salvest_app/presentation/sale%20estate/widgets/send_property_button.dart';
import 'package:salvest_app/utility/app_colors.dart';
import 'package:intl/intl.dart';
import 'package:salvest_app/utility/dialogs_snackBar.dart';
import 'package:salvest_app/utility/enums.dart';
import 'package:salvest_app/utility/router.dart';

class SaleEstateView extends StatelessWidget {
  const SaleEstateView({super.key, required this.salePropertyState});
  final SalePropertyState salePropertyState;

  @override
  Widget build(BuildContext context) {
    return BlocListener<SendPropertyBloc, SendPropertyState>(
      listener: (context, state) {
        if (state is SendPropertyLoading) {
          EasyLoading.show(status: 'loading...');
        }  

        if (state is SendPropertyStatus &&
            state.helperResponse.servicesResponse ==
                ServicesResponseStatues.success) {
          EasyLoading.dismiss();
          EasyLoading.showSuccess('Sent Succefully');
          GoRouter.of(context).push(AppRouter.kHomePageView);
          // DialogsWidgetsSnackBar.showSnackBarFromStatus(
          //   context: context,
          //   helperResponse:  ,
          //   showServerError: true,
          //   popOnSuccessCount: 2,
          // );
        }
        if (state is SendPropertyStatus &&
            state.helperResponse.servicesResponse ==
                ServicesResponseStatues.someThingWrong) {
          EasyLoading.dismiss();
          DialogsWidgetsSnackBar.showSnackBarFromStatus(
            context: context,
            helperResponse: state.helperResponse,
            showServerError: true,
          );
        }
      },
      child: Scaffold(
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
                        SaleEstateContainer(
                          height: 170,
                          child: LoactionInformation(),
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
                            isPropertyDocuments: true,
                            title: "Property documents",
                            maxImages: 8,
                          ),
                        ),
                        const SizedBox(height: 10),
                        SaleEstateContainer(
                          height: 215,
                          child: PropertyImagesUploader(
                            isIdImages: true,
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
                              InkWell(
                                onTap: () {
                                  context.read<SalePropertyBloc>();
                                },
                                child: Text(
                                  'accept all ',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w400,
                                  ),
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

                        SendPropertyButton(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
