// ListView for Property Cards
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:salvest_app/business_logic/property%20for%20investment%20bloc/properties_for_investment_bloc.dart';
import 'package:salvest_app/presentation/home%20page/widgets/property_card.dart';
import 'package:salvest_app/presentation/home%20page/widgets/property_card_shimmer.dart';
import 'package:salvest_app/utility/app_assests.dart';
import 'package:salvest_app/utility/elevated_button_widget.dart';
import 'package:salvest_app/utility/router.dart';
import 'package:salvest_app/utility/somthing_wrong.dart';

class PropertyListView extends StatelessWidget {
  const PropertyListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<
      PropertiesForInvestmentBloc,
      PropertiesForInvestmentState
    >(
      builder: (context, state) {
        final deleteUpdate = context.watch<PropertiesForInvestmentBloc>().state;
        if (deleteUpdate is PropertiesForInvestmentLoading) {
          return ListView.builder(
            itemCount: 8,
            itemBuilder: (BuildContext context, int index) {
              return PropertyCardShimmer();
            },
          );
        }
        if (deleteUpdate is PropertiesForInvestmentInitial) {
          return ListView.builder(
            itemCount: 8,
            itemBuilder: (BuildContext context, int index) {
              return PropertyCardShimmer();
            },
          );
        }

        if (deleteUpdate is PropertiesForInvestmentSuccess &&
            deleteUpdate.getPropertiesForInvestmentResponse.data == null) {
          return SomethingWrongWidget(
            title: "No Questions found !",
            svgPath: 'assets/images/search.svg',
            elevatedButtonWidget: ElevatedButtonWidget(
              title: "Refresh",
              onPressed: () {
                // context.read<PropertiesForInvestmentBloc>().add(GetFqmEvent());
              },
            ),
          );
        }
        if (deleteUpdate is PropertiesForInvestmentSuccess) {
          return ListView.builder(
            // physics:
            //     const NeverScrollableScrollPhysics(), // Disable ListView scrolling
            itemCount:
                deleteUpdate
                    .getPropertiesForInvestmentResponse
                    .data!
                    .properties!
                    .length, // Repeat PropertyCard 10 times
            itemBuilder: (context, index) {
              final property =
                  deleteUpdate
                      .getPropertiesForInvestmentResponse
                      .data!
                      .properties![index];
              return InkWell(
                onTap:
                    () => GoRouter.of(
                      context,
                    ).push(AppRouter.kPropertyDetailsView,
                    extra: property,),
                child: PropertyCard(
                  title: property.area!,
                  location: property.state!,
                  price: '\$${property.chancePrice}',
                  availability: '${property.progressPercent}% available',
                  investors: '${property.numberOfChances} investors',
                  yearlyReturn: '${property.profitPercent}%',
                  deadline: formatJoinedDate(property.investmentTime!),
                  valuation: '\$${property.expectedPrice}',
                  category: property.investmentMode!,
                  iconData: CupertinoIcons.money_dollar_circle_fill,
                  categoryColor: Colors.green,
                  imageUrls:
                      property.propertyImages
                          ?.map((img) => img.path)
                          .toList() ??
                      [], // Replace with real URL
                  rating: 4.5,
                ),
              );
            },
          );
        }
        return SomethingWrongWidget(
          elevatedButtonWidget: ElevatedButtonWidget(
            title: "Refresh",
            onPressed: () {
              //  context.read<HelpBloc>().add(GetFqmEvent());
            },
          ),
        );
      },
    );
  }
}

String formatJoinedDate(String isoDate) {
  try {
    // Parse the ISO date string into a DateTime object
    DateTime date = DateTime.parse(isoDate);

    // Format the date as "d MMMM yyyy" (e.g., "14 April 2025")
    String formattedDate = DateFormat('d MMMM yyyy').format(date);

    return '$formattedDate';
  } catch (e) {
    // Fallback if parsing fails
    return 'joined in Unknown date';
  }
}
