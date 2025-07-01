// import 'package:fl_chart/fl_chart.dart';

// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
// import 'package:salvest_app/presentation/portfolio/widgets/double_line_chart.dart'
//     show DoubleLineChartCard;
// import 'package:salvest_app/presentation/portfolio/widgets/investments_of_wallets.dart';
// import 'package:salvest_app/presentation/portfolio/widgets/protfolio_button.dart';
// import 'package:salvest_app/utility/app_assests.dart';
// import 'package:salvest_app/utility/app_colors.dart';

// class PortfolioView extends StatelessWidget {
//   const PortfolioView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.white,
//       appBar: AppBar(
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back_ios),
//           onPressed: () {
//             GoRouter.of(context).pop();
//           },
//         ),
//         title: const Text(
//           'Portfolio',
//           style: TextStyle(color: Colors.black, fontSize: 18),
//         ),
//         centerTitle: true,
//         backgroundColor: Colors.white,
//         elevation: 0,
//       ),
//       body: Column(
//         children: [
//           InvestmentsOfWallet(),
//           SizedBox(height: 20),
//           DoubleLineChartCard(),
//           SizedBox(height: 20),
//           Center(
//             child: Container(
//               width: 365,
//               height: 4,
//               color: Color(0xFF9A8AEC).withAlpha(140),
//             ),
//           ),
//           SizedBox(height: 20),
//           Padding(
//             padding: const EdgeInsets.only(left: 26.0),
//             child: ProtfolioButtons(),
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:salvest_app/business_logic/investments%20by%20month%20bloc/investments_by_month_bloc.dart';
import 'package:salvest_app/business_logic/investments%20by%20month%20bloc/investments_by_month_event.dart';
import 'package:salvest_app/business_logic/investments%20by%20month%20bloc/investments_by_month_state.dart';

import 'package:salvest_app/presentation/portfolio/widgets/double_line_chart.dart'
    show DoubleLineChartCard;
import 'package:salvest_app/presentation/portfolio/widgets/investments_of_wallets.dart';
import 'package:salvest_app/presentation/portfolio/widgets/protfolio_button.dart';
import 'package:salvest_app/utility/app_colors.dart';

class PortfolioView extends StatefulWidget {
  const PortfolioView({super.key});

  @override
  State<PortfolioView> createState() => _PortfolioViewState();
}

class _PortfolioViewState extends State<PortfolioView> {
  final List<String> _months = const [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December',
  ];
  String _selectedMonth = 'June';

  @override
  void initState() {
    super.initState();
    // جلب بيانات الشهر الافتراضي (June = رقم 6)
    _fetchForMonth(2025, 6);
  }

  void _fetchForMonth(int year, int month) {
    context.read<InvestmentsByMonthBloc>().add(
      FetchInvestmentsByMonthEvent(year: year, month: month),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => GoRouter.of(context).pop(),
        ),
        title: const Text(
          'Portfolio',
          style: TextStyle(color: Colors.black, fontSize: 18),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Dropdown لاختيار الشهر
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 10,
              ),
              child: DropdownButton<String>(
                value: _selectedMonth,
                isExpanded: true,
                underline: const SizedBox(),
                icon: const Icon(
                  Icons.expand_circle_down_sharp,
                  color: Color(0xFF574E86),
                ),
                onChanged: (value) {
                  if (value != null) {
                    setState(() => _selectedMonth = value);
                    final monthIndex = _months.indexOf(value) + 1;
                    _fetchForMonth(2025, monthIndex);
                  }
                },
                items:
                    _months.map((m) {
                      return DropdownMenuItem(
                        value: m,
                        child: Text(
                          m,
                          style: const TextStyle(color: Color(0xFF574E86)),
                        ),
                      );
                    }).toList(),
              ),
            ),

            // بناء InvestmentsOfWallet بحسب حالة البلوك
            BlocBuilder<InvestmentsByMonthBloc, InvestmentsByMonthState>(
              builder: (context, state) {
                if (state is InvestmentsByMonthLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is InvestmentsByMonthLoaded) {
                  return InvestmentsOfWallet(
                    totalOpportunities: state.data.totalOpportunities ?? 0,
                    totalAmount: state.data.totalAmount ?? 0,
                  );
                } else if (state is InvestmentsByMonthError) {
                  return Center(child: Text(state.message));
                } else {
                  // InvestmentsByMonthInitial
                  return const SizedBox.shrink();
                }
              },
            ),

            const SizedBox(height: 20),
            //اضافة للتذكير
            const DoubleLineChartCard(year: 2025),
            const SizedBox(height: 20),
            Center(
              child: Container(
                width: 365,
                height: 4,
                color: Color(0xFF9A8AEC).withAlpha(140),
              ),
            ),
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.only(left: 26.0),
              child: ProtfolioButtons(),
            ),
          ],
        ),
      ),
    );
  }
}
