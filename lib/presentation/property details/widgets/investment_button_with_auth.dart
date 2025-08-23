import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:local_auth/local_auth.dart';
import 'package:salvest_app/business_logic/deputizations%20bloc/deputizations_bloc.dart';
import 'package:salvest_app/business_logic/wallet%20bloc/wallet_bloc.dart';
import 'package:salvest_app/constants.dart';
import 'package:local_auth/local_auth.dart';
//import 'package:easy_loading/easy_loading.dart';
import 'package:salvest_app/presentation/sale%20estate/widgets/custom_button.dart';

// Main widget with the enhanced authentication flow
class InvestmentButtonWithAuth extends StatefulWidget {
  final String deputizationText;
  //  final String deputizationState;
  final VoidCallback onPaymentInitiated;

  const InvestmentButtonWithAuth({
    Key? key,
    required this.deputizationText,
    //    required this.deputizationState,
    required this.onPaymentInitiated,
  }) : super(key: key);

  @override
  _InvestmentButtonWithAuthState createState() =>
      _InvestmentButtonWithAuthState();
}

class _InvestmentButtonWithAuthState extends State<InvestmentButtonWithAuth> {
  final LocalAuthentication _auth = LocalAuthentication();
  bool _isAuthenticated = false;
  final TextEditingController _nationalIdController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<DeputizationsBloc, DeputizationsState>(
      listener: (context, state) {
        if (state is CreateDeputizationsLoading) {
          EasyLoading.show(status: 'Processing deputization...');
        } else if (state is CreateDeputizationsSuccess) {
          EasyLoading.dismiss();
          EasyLoading.showSuccess(state.message);
          // Proceed with payment after successful deputization
          widget.onPaymentInitiated();
        } else if (state is CreateDeputizationsFailure) {
          EasyLoading.dismiss();
          EasyLoading.showError(
            state.helperResponse.fullBody!['message'] ?? 'Deputization failed',
          );
        }
      },
      child: CustomSendButton(
        buttonName: 'invest',
        onTap: () async {
          // Step 1: Biometric Authentication
          final bool canAuthenticateWithBiometrics =
              await _auth.canCheckBiometrics;

          if (!canAuthenticateWithBiometrics) {
            EasyLoading.showError('Biometric authentication not available');
            return;
          }

          try {
            final bool didAuthenticate = await _auth.authenticate(
              localizedReason: 'Please authenticate to confirm the investment',
              options: const AuthenticationOptions(biometricOnly: false),
            );

            if (!didAuthenticate) {
              EasyLoading.showError('Authentication failed');
              return;
            }

            setState(() {
              _isAuthenticated = true;
            });
            EasyLoading.showSuccess('Authentication success');

            // Step 2: Show deputization confirmation dialog (only after auth)
            if (deputizationState == 'false') {
              print("it's ffffffffffkkkkkkask");
              final confirm = await showDialog<bool>(
                context: context,
                builder:
                    (context) => DeputizationDialog(
                      deputizationText: widget.deputizationText,
                      nationalIdController: _nationalIdController,
                    ),
              );

              if (confirm != true) {
                // user canceled
                return;
              }

              // Get the Bloc from context and add the event
              final deputizationsBloc = context.read<DeputizationsBloc>();
              deputizationsBloc.add(
                CreateDeputizationsEvent(
                  nationalId: _nationalIdController.text,
                  deputizationContent: widget.deputizationText,
                ),
              );
            } else {
              // If deputization is already true, proceed with payment directly
              widget.onPaymentInitiated();
            }
          } catch (e) {
            print(e);
            EasyLoading.showError('Authentication error');
          }
        },
      ),
    );
  }

  @override
  void dispose() {
    _nationalIdController.dispose();
    super.dispose();
  }
}

class DeputizationDialog extends StatefulWidget {
  final String deputizationText;
  final TextEditingController nationalIdController;

  const DeputizationDialog({
    Key? key,
    required this.deputizationText,
    required this.nationalIdController,
  }) : super(key: key);

  @override
  _DeputizationDialogState createState() => _DeputizationDialogState();
}

class _DeputizationDialogState extends State<DeputizationDialog> {
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DeputizationsBloc, DeputizationsState>(
      listener: (context, state) {
        if (state is CreateDeputizationsLoading) {
          setState(() {
            _isLoading = true;
          });
        } else if (state is CreateDeputizationsSuccess ||
            state is CreateDeputizationsFailure) {
          setState(() {
            _isLoading = false;
          });

          if (state is CreateDeputizationsSuccess) {
            Navigator.of(context).pop(true);
          }
        }
      },
      builder: (context, state) {
        return AlertDialog(
          title: const Text(
            "Confirm Investment",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          content: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.deputizationText),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: widget.nationalIdController,
                    decoration: const InputDecoration(
                      labelText: 'National ID',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your national ID';
                      }
                      // Add any additional validation for national ID format if needed
                      return null;
                    },
                  ),
                ],
              ),
            ),
          ),
          actions: [
            if (!_isLoading)
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: const Text("No"),
              ),
            ElevatedButton(
              onPressed:
                  _isLoading
                      ? null
                      : () {
                        if (_formKey.currentState!.validate()) {
                          // This will trigger the bloc listener which sets loading state
                          final deputizationsBloc =
                              context.read<DeputizationsBloc>();
                          deputizationsBloc.add(
                            CreateDeputizationsEvent(
                              nationalId: widget.nationalIdController.text,
                              deputizationContent: widget.deputizationText,
                            ),
                          );
                        }
                      },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                disabledBackgroundColor: Colors.green.withOpacity(0.5),
              ),
              child:
                  _isLoading
                      ? const SizedBox(
                        width: 16,
                        height: 16,
                        child: CircularProgressIndicator(
                          color: Colors.white,
                          strokeWidth: 2,
                        ),
                      )
                      : const Text("Yes"),
            ),
          ],
        );
      },
    );
  }
}
