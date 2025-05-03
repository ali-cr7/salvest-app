import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:salvest_app/business_logic/offered%20properties%20bloc/offered_properties_bloc.dart';
import 'package:salvest_app/presentation/help/widgets/faq_item_shimmer.dart';
import 'package:salvest_app/presentation/sale%20estate/widgets/add_button.dart';
import 'package:salvest_app/presentation/sale%20estate/widgets/sale_state_requests_view_item.dart';
import 'package:salvest_app/utility/app_assests.dart';
import 'package:salvest_app/utility/app_colors.dart';
import 'package:salvest_app/utility/elevated_button_widget.dart';
import 'package:salvest_app/utility/router.dart';
import 'package:salvest_app/utility/somthing_wrong.dart';

class SaleStateRequestView extends StatelessWidget {
  const SaleStateRequestView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              GoRouter.of(context).push(AppRouter.kSaleEstateView);
            },
          ),
        ],
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
      backgroundColor: AppColors.background,
      body: BlocBuilder<OfferedPropertiesBloc, OfferedPropertiesState>(
        builder: (context, state) {
          final deleteUpdate = context.watch<OfferedPropertiesBloc>().state;
          if (deleteUpdate is OfferedPropertiesLoading) {
            return ListView.builder(
              itemCount: 8,
              itemBuilder: (BuildContext context, int index) {
                return FAQShimmerItem();
              },
            );
          }
          if (state is OfferedPropertiesInitial) {
            return ListView.builder(
              itemCount: 8,
              itemBuilder: (BuildContext context, int index) {
                return FAQShimmerItem();
              },
            );
          }
          if (state is OfferedPropertiesSuccess &&
              state.getOfferedProprtiesResponse.data!.isEmpty) {
            return Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(image: AssetImage(AppAssets.emptyRequestsState)),
                  AddButton(
                    tap: () {
                      GoRouter.of(context).push(AppRouter.kSaleEstateView);
                    },
                  ),
                ],
              ),
            );

            // SomethingWrongWidget(
            //   title: "No Questions found !",
            //   svgPath: 'assets/images/search.svg',
            //   elevatedButtonWidget: ElevatedButtonWidget(
            //     title: "Refresh",
            //     onPressed: () {
            //       context.read<OfferedPropertiesBloc>().add(
            //         GetOfferedPropertiesEvent(),
            //       );
            //     },
            //   ),
            // );
          }
          if (state is OfferedPropertiesSuccess) {
            return RefreshIndicator(
              onRefresh: () async {
                context.read<OfferedPropertiesBloc>().add(
                  GetOfferedPropertiesEvent(),
                );
              },
              child: ListView.builder(
                itemCount: state.getOfferedProprtiesResponse.data!.length,

                itemBuilder: (context, index) {
                  final propertyItem =
                      state.getOfferedProprtiesResponse.data![index];
                  return Padding(
                    padding: const EdgeInsets.only(
                      top: 12.0,
                      left: 42.0,
                      right: 42.0,
                    ),
                    child: SaleStateRequsetViewItem(
                      status: propertyItem.accept!,
                      address: propertyItem.state!,
                      exactLocation: propertyItem.exactPosition!,
                      propertyType: propertyItem.paintingType!,
                    ),
                  );
                },
              ),
            );
          }
          return SomethingWrongWidget(
            elevatedButtonWidget: ElevatedButtonWidget(
              title: "Refresh",
              onPressed: () {
                context.read<OfferedPropertiesBloc>().add(
                  GetOfferedPropertiesEvent(),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
