import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:salvest_app/business_logic/auto%20investment%20settings%20bloc/auto_investment_settings_bloc.dart';
import 'package:salvest_app/constants.dart';
import 'package:salvest_app/presentation/sale%20estate/widgets/custom_button.dart';
import 'package:salvest_app/presentation/sale%20estate/widgets/drop_down_field.dart';
import 'package:salvest_app/presentation/sale%20estate/widgets/number_picker.dart';
import 'package:salvest_app/utility/cash_helper.dart';

class AutoInvestmentViewBody extends StatefulWidget {
  const AutoInvestmentViewBody({super.key});

  @override
  State<AutoInvestmentViewBody> createState() => _AutoInvestmentViewBodyState();
}

class _AutoInvestmentViewBodyState extends State<AutoInvestmentViewBody> {
  int investmentAmount = 1;
  String investmentMode = 'Balanced';
  int expectedProfitMin = 5;
  int expectedProfitMax = 15;
  int minChanceInvested = 1;
  int maxChanceInvested = 10;

  final List<String> investmentModes = [
    'Capiatl Growth',
    'Balanced',
    'High Incoming',
  ];
bool isActive = true;
  @override
  void initState() {
    super.initState();
    _loadSavedState();
  }

  Future<void> _loadSavedState() async {
    final savedState = await CacheHelper.getData(key: kAutoInvestmentActiveKey);
    if (savedState != null) {
      setState(() {
        isActive = savedState == 'true';
      });
    }
  }

  Future<void> _saveState(bool value) async {
    await CacheHelper.setData(key: kAutoInvestmentActiveKey, value: value.toString());
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 20.h,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 12.0, top: 12.0),
          child: Text(
            'Investment Preferences:',
            style: TextStyle(
              color: Colors.black,
              fontSize: 15,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w600,
            ),
          ),
        ),

        NumberPicker(
          label: 'Investment Amount:',
          value: investmentAmount,
          onChanged:
              (val) => context.read<AutoInvestmentSettingsBloc>().add(
                UpdateInvestmentAmountEvent(amount: val),
                //
              ),
          suffix: '\$',
        ),

        DropdownField(
          label: 'Investment Mode:',
          items: investmentModes,
          selectedValue: investmentMode,
          onChanged:
              (val) => context.read<AutoInvestmentSettingsBloc>().add(
                UpdateInvestmentModeEvent(mode: val),
              ),
        ),

        NumberPicker(
          label: 'Expected Profit Min:',
          value: expectedProfitMin,
          onChanged: (val) {
            if (val <= expectedProfitMax) {
              context.read<AutoInvestmentSettingsBloc>().add(
                UpdateExpectedProfitMinEvent(min: val)
              );
            }
          },
          suffix: '%',
        ),

        NumberPicker(
          label: 'Expected Profit Max:',
          value: expectedProfitMax,
          onChanged: (val) {
            if (val >= expectedProfitMin) {
             context.read<AutoInvestmentSettingsBloc>().add(
              UpdateExpectedProfitMinEvent(min: val)
             );
            }
          },
          suffix: '%',
        ),

        NumberPicker(
          label: 'Minimum Chances Invested:',
          value: minChanceInvested,
          onChanged: (val) {
            if (val <= maxChanceInvested) {
              context.read<AutoInvestmentSettingsBloc>().add(UpdateMaxChanceInvestedEvent(max: val));
            }
          },
        ),

        NumberPicker(
          label: 'Maximum Chances Invested:',
          value: maxChanceInvested,
          onChanged: (val) {
            if (val >= minChanceInvested) {
              context.read<AutoInvestmentSettingsBloc>().add(UpdateMinChanceInvestedEvent(min: val));
            }
          },
        ),
      ],
    );
  }
}
