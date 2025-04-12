import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';
import 'package:salvest_app/presentation/home%20page/widgets/details_row.dart';
import 'package:salvest_app/presentation/property%20details/widgets/property_details_card.dart';
import 'package:salvest_app/presentation/property%20details/widgets/property_details_info.dart';
import 'package:salvest_app/presentation/property%20details/widgets/property_info.dart';
import 'package:salvest_app/presentation/sale%20estate/widgets/custom_button.dart';
import 'package:salvest_app/utility/app_assests.dart';
import 'package:salvest_app/utility/app_colors.dart';
import 'package:salvest_app/utility/biometric.dart';

class PropertyDetailsView extends StatefulWidget {
  const PropertyDetailsView({super.key});

  @override
  State<PropertyDetailsView> createState() => _PropertyDetailsViewState();
}

class _PropertyDetailsViewState extends State<PropertyDetailsView> {
  bool _isAuthenticated = false;
  int _opportunityCount = 15; // Add this in your _PropertyDetailsViewState
  final LocalAuthentication _auth = LocalAuthentication();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          PropertyDetailsCard(
            yearlyReturn: '12.4%',
            deadline: '2 April 2025',
            category: 'Capital Growth',
            iconData: CupertinoIcons.money_dollar_circle_fill,
            categoryColor: Colors.green,
            imageUrls: [
              AppAssets.property,
              AppAssets.property,
              AppAssets.property,
            ], // Replace with real URL
            rating: 4.5,
          ),

          Expanded(
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Column(
                    children: [
                      // Property Info
                      PropertyInfo(),
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
                              '\$10 for each Opportunity',
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
                                          if (_opportunityCount < 48) {
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
                                  ' \$150',
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
                                  '48',
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
    );
  }
}
