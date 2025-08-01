import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:salvest_app/business_logic/send%20api%20withdraw%20bloc/send_api_withdraw_money_bloc_bloc.dart';
import 'package:salvest_app/business_logic/withdraw%20money%20bloc/withdraw_money_bloc.dart';
import 'package:salvest_app/utility/app_colors.dart';
import 'package:salvest_app/utility/enums.dart';

class WithdrawalMoneyView extends StatefulWidget {
  const WithdrawalMoneyView({super.key});

  @override
  State<WithdrawalMoneyView> createState() => _WithdrawlMoneyViewState();
}

class _WithdrawlMoneyViewState extends State<WithdrawalMoneyView> {
  final _formKey = GlobalKey<FormState>();
  String _method = 'bank';
  final _amountController = TextEditingController();
  final _cardNumberController = TextEditingController();
  final _fullNameController = TextEditingController();
  final _stateController = TextEditingController();
  final _cryptoWalletController = TextEditingController();

  @override
  void dispose() {
    _amountController.dispose();
    _cardNumberController.dispose();
    _fullNameController.dispose();
    _stateController.dispose();
    _cryptoWalletController.dispose();
    super.dispose();
  }

  Widget _buildMethodDetails() {
    switch (_method) {
      case 'bank':
        return Column(
          children: [
            _buildTextField(
              controller: _cardNumberController,
              label: 'Card Number',
              icon: Icons.credit_card,
            ),
            _buildTextField(
              controller: _fullNameController,
              label: 'Account Holder Name',
              icon: Icons.person,
            ),
          ],
        );
      case 'harem':
      case 'western_union':
        return Column(
          children: [
            _buildTextField(
              controller: _fullNameController,
              label: 'Full Name',
              icon: Icons.person,
            ),
            _buildTextField(
              controller: _cardNumberController,
              label: 'Phone or ID Number',
              icon: Icons.confirmation_number,
            ),
            _buildTextField(
              controller: _stateController,
              label: 'State',
              icon: Icons.location_on,
            ),
          ],
        );
      case 'crypto':
        return _buildTextField(
          controller: _cryptoWalletController,
          label: 'Crypto Wallet Address',
          icon: Icons.account_balance_wallet,
        );
      default:
        return const SizedBox.shrink();
    }
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextFormField(
        controller: controller,
        validator: (value) {
          if (value == null || value.trim().isEmpty) return 'Required';
          return null;
        },
        decoration: InputDecoration(
          prefixIcon: Icon(icon, color: AppColors.green),
          labelText: label,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.green),
          ),
        ),
      ),
    );
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      final bloc = context.read<WithdrawMoneyBloc>();
      bloc.add(UpdateWithdrawAmountEvent(double.parse(_amountController.text)));
      bloc.add(UpdateWithdrawMethodEvent(_method));
      switch (_method) {
        case 'bank':
          bloc.add(UpdateCardNumberEvent(_cardNumberController.text));
          bloc.add(UpdateAccountHolderNameEvent(_fullNameController.text));
          break;
        case 'harem':
        case 'western_union':
          bloc.add(UpdateFullNameEvent(_fullNameController.text));
          bloc.add(UpdatePhoneEvent(_cardNumberController.text));
          bloc.add(UpdateStateEvent(_stateController.text));
          break;
        case 'crypto':
          bloc.add(UpdateWalletAddressEvent(_cryptoWalletController.text));
          break;
      }
      debugPrint('Submitting form...');
      debugPrint('Form Submitted: ${bloc.state.toMap()}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<
      SendApiWithdrawMoneyBlocBloc,
      SendApiWithdrawMoneyBlocState
    >(
      listener: (context, state) {
        if (state is SendApiWithdrawMoneyStatus) {
          final message = state.helperResponse.fullBody!["message"] ?? '';
          final success =
              state.helperResponse.servicesResponse ==
                      ServicesResponseStatues.success
                  ? true
                  : false;
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                success
                    ? 'Success: $message'
                    : 'Failed: ${state.helperResponse.fullBody!["error"]}',
              ),
            ),
          );
        }
      },
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () => GoRouter.of(context).pop(),
          ),
          title: const Text(
            'Withdraw Money',
            style: TextStyle(color: Colors.black, fontSize: 18),
          ),
          backgroundColor: AppColors.green,
        ),

        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                _buildTextField(
                  controller: _amountController,
                  label: 'Amount (SYP)',
                  icon: Icons.attach_money,
                ),
                const SizedBox(height: 12),
                DropdownButtonFormField<String>(
                  value: _method,
                  items: const [
                    DropdownMenuItem(value: 'bank', child: Text('Bank')),
                    DropdownMenuItem(value: 'harem', child: Text('Harem')),
                    DropdownMenuItem(
                      value: 'western_union',
                      child: Text('Western Union'),
                    ),
                    DropdownMenuItem(value: 'crypto', child: Text('Crypto')),
                  ],
                  onChanged: (value) {
                    setState(() {
                      _method = value!;
                    });
                  },
                  decoration: InputDecoration(
                    labelText: 'Withdrawal Method',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    prefixIcon: Icon(Icons.payment, color: AppColors.green),
                  ),
                ),
                const SizedBox(height: 12),
                _buildMethodDetails(),
                const SizedBox(height: 20),
                BlocBuilder<WithdrawMoneyBloc, WithdrawMoneyState>(
                  builder: (context, state) {
                    return ElevatedButton.icon(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          final bloc = context.read<WithdrawMoneyBloc>();
                          bloc.add(
                            UpdateWithdrawAmountEvent(
                              double.parse(_amountController.text),
                            ),
                          );
                          bloc.add(UpdateWithdrawMethodEvent(_method));
                          switch (_method) {
                            case 'bank':
                              bloc.add(
                                UpdateCardNumberEvent(
                                  _cardNumberController.text,
                                ),
                              );
                              bloc.add(
                                UpdateAccountHolderNameEvent(
                                  _fullNameController.text,
                                ),
                              );
                              break;
                            case 'harem':
                            case 'western_union':
                              bloc.add(
                                UpdateFullNameEvent(_fullNameController.text),
                              );
                              bloc.add(
                                UpdatePhoneEvent(_cardNumberController.text),
                              );
                              bloc.add(UpdateStateEvent(_stateController.text));
                              break;
                            case 'crypto':
                              bloc.add(
                                UpdateWalletAddressEvent(
                                  _cryptoWalletController.text,
                                ),
                              );
                              break;
                          }
                          debugPrint('Submitting form...');
                          debugPrint('Form Submitted: ${bloc.state.toMap()}');
                          context.read<SendApiWithdrawMoneyBlocBloc>().add(
                            WithdrawMoneyApiEvent(withdrawMoneyState: state),
                          );
                        }
                      },
                      icon: const Icon(Icons.send, color: AppColors.background),
                      label: const Text(
                        'Submit',
                        style: TextStyle(color: AppColors.background),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.green15,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 12,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
