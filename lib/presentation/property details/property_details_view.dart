import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:local_auth/local_auth.dart';
import 'package:salvest_app/business_logic/wallet%20bloc/wallet_bloc.dart';
import 'package:salvest_app/data/models/get_proprties_for_investment_response/property_image.dart';

import 'package:salvest_app/presentation/home%20page/widgets/details_row.dart';
import 'package:salvest_app/presentation/property%20details/widgets/property_details_card.dart';
import 'package:salvest_app/presentation/property%20details/widgets/property_details_info.dart';
import 'package:salvest_app/presentation/property%20details/widgets/property_info.dart';
import 'package:salvest_app/presentation/sale%20estate/widgets/custom_button.dart';
import 'package:salvest_app/utility/app_assests.dart';
import 'package:salvest_app/utility/app_colors.dart';
import 'package:salvest_app/utility/biometric.dart';
import 'package:salvest_app/utility/dialogs_snackBar.dart';
import 'package:salvest_app/utility/router.dart';

class PropertyDetailsView extends StatefulWidget {
  const PropertyDetailsView({
    super.key,
    required this.yearlyReturn,
    required this.deadline,
    required this.category,
    required this.iconData,
    required this.categoryColor,
    required this.imageUrls,
    required this.bedRoomNum,
    required this.bathRoomNum,
    required this.yearlyProfit,
    required this.valuation,
    required this.chancePrice,
    required this.chanceNum,
    required this.propertyId,
  });
  final String yearlyReturn;
  final String deadline;
  final int chancePrice;
  final String propertyId;
  final int chanceNum;
  final String category;
  final IconData iconData;
  final Color categoryColor;
  final List<PropertyImage> imageUrls;
  // final double rating;
  final String bedRoomNum;
  final String bathRoomNum;
  final String yearlyProfit;
  final String valuation;
  @override
  State<PropertyDetailsView> createState() => _PropertyDetailsViewState();
}

class _PropertyDetailsViewState extends State<PropertyDetailsView> {
  bool _isAuthenticated = false;
  int _opportunityCount = 15; // Add this in your _PropertyDetailsViewState
  final LocalAuthentication _auth = LocalAuthentication();
  @override
  Widget build(BuildContext context) {
    return BlocListener<WalletBloc, WalletState>(
      listener: (context, state) {
        if (state is GetWalletBalanceLoading) {
          EasyLoading.show(status: 'loading...');
        }
        if (state is InvestSuccess) {
          EasyLoading.dismiss();
          EasyLoading.showSuccess(state.message);
          GoRouter.of(context).push(AppRouter.kResetPasswordView);
        }
        if (state is InvestFailure) {
          EasyLoading.dismiss();
          DialogsWidgetsSnackBar.showSnackBarFromStatus(
            context: context,
            helperResponse: state.helperResponse,
            showServerError: true,
          );
        }
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            PropertyDetailsCard(
              yearlyReturn: widget.yearlyReturn,
              deadline: formatJoinedDate(widget.deadline!),
              category: widget.category,
              iconData: CupertinoIcons.money_dollar_circle_fill,
              categoryColor: Colors.green,
              imageUrls:
                  widget.imageUrls?.map((img) => img.path).toList() ??
                  [], // Replace with real URL
              rating: 4.5,
            ),

            Expanded(
              child: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: Column(
                      children: [
                        // Property Info
                        PropertyInfo(
                          bathRoomNum: widget.bathRoomNum,
                          bedRoomNum: widget.bathRoomNum,
                          deadLine: widget.deadline,
                          valuation: widget.valuation,
                          yearlyProfit: widget.yearlyProfit,
                        ),
                        SizedBox(height: 10),
                        ProertyDetailsInfo(),
                        Center(
                          child: Container(
                            width: 365,
                            height: 4,
                            color: Color(0x70088711),
                          ),
                        ),
                        SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                '\$${widget.chancePrice} for each Opportunity',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.only(
                            left: 10.0,
                            top: 9.0,
                            right: 10.0,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  Row(
                                    children: [
                                      // Add Button
                                      GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            if (_opportunityCount <
                                                widget.chanceNum) {
                                              _opportunityCount++;
                                            }
                                          });
                                        },
                                        child: Container(
                                          width: 30,
                                          height: 30,
                                          decoration: ShapeDecoration(
                                            color: Colors.white,
                                            shape: OvalBorder(
                                              side: BorderSide(width: 1),
                                            ),
                                          ),
                                          child: Icon(Icons.add, size: 20),
                                        ),
                                      ),

                                      SizedBox(width: 10),

                                      // Count Text
                                      Text(
                                        '$_opportunityCount',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 14,
                                          fontFamily: 'Inter',
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),

                                      SizedBox(width: 10),

                                      // Remove Button
                                      GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            if (_opportunityCount > 0) {
                                              _opportunityCount--;
                                            }
                                          });
                                        },
                                        child: Container(
                                          width: 30,
                                          height: 30,
                                          decoration: ShapeDecoration(
                                            color: Colors.white,
                                            shape: OvalBorder(
                                              side: BorderSide(width: 1),
                                            ),
                                          ),
                                          child: Icon(Icons.remove, size: 20),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    ' \$${_opportunityCount * widget.chancePrice}',
                                    style: TextStyle(
                                      color: const Color(0xAA1E1E1E),
                                      fontSize: 12,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ],
                              ),

                              Row(
                                spacing: 4,
                                children: [
                                  Text(
                                    widget.chanceNum.toString(),
                                    style: TextStyle(
                                      color: const Color(0xFF0E891C),
                                      fontSize: 14,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  Text(
                                    'opportunities',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 10),
                        CustomSendButton(
                          buttonName: 'invest',
                          onTap: () async {
                            // bool isAuthenticated =
                            //     await authService.authenticateWithBiometrics();
                            if (!_isAuthenticated) {
                              final bool caAuthenticateWithBiometrics =
                                  await _auth.canCheckBiometrics;
                              if (caAuthenticateWithBiometrics) {
                                try {
                                  final bool
                                  didAuthenticate = await _auth.authenticate(
                                    localizedReason:
                                        'Please authenticate to in confirm the investing',
                                    options: AuthenticationOptions(
                                      biometricOnly: false,
                                    ),
                                  );
                                  setState(() {
                                    _isAuthenticated = didAuthenticate;
                                  });
                                } catch (e) {
                                  print(e);
                                }
                              }

                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  backgroundColor: AppColors.green,
                                  content: Text('Authentication success'),
                                ),
                              );
                              context.read<WalletBloc>().add(
                                InvestEvent(
                                  chanceInvested: _opportunityCount,
                                  propertyForInvestmentId: widget.propertyId,
                                ),
                              );
                            } else {
                              // Show an error message
                              setState(() {
                                _isAuthenticated = false;
                              });
                            }
                          },
                        ),
                        SizedBox(height: 10),
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
