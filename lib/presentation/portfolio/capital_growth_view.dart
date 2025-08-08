// lib/presentation/portfolio/capital_growth_view.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:salvest_app/business_logic/investment%20mode%20bloc/investment_mode_bloc.dart';
import 'package:salvest_app/business_logic/investment%20mode%20bloc/investment_mode_event.dart';
import 'package:salvest_app/business_logic/investment%20mode%20bloc/investment_mode_state.dart';
import 'package:salvest_app/presentation/portfolio/widgets/capital_growth_list_view_item.dart';
import 'package:salvest_app/utility/app_colors.dart';

class CapitalGrowthView extends StatelessWidget {
  final String modeName;
  const CapitalGrowthView({
    super.key,
    required this.modeName, // ← نمرّر هنا اسم الـ mode
  });

  @override
  Widget build(BuildContext context) {
    // عند بداية البناء، نُرسل حدث الجلب تلقائيًا
    context.read<InvestmentModeBloc>().add(FetchInvestmentModeEvent(modeName));

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => GoRouter.of(context).pop(),
        ),
        // نستخدم modeName لعنوان الـ AppBar
        title: Text(
          modeName,
          style: const TextStyle(color: Colors.black, fontSize: 18),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: BlocBuilder<InvestmentModeBloc, InvestmentModeState>(
        builder: (context, state) {
          if (state is InvestmentModeLoading ||
              state is InvestmentModeInitial) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is InvestmentModeError) {
            return Center(child: Text(state.message));
          }
          if (state is InvestmentModeLoaded) {
            return ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: state.modes.length,
              itemBuilder: (ctx, i) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CapitalGrowthListViewItem(mode: state.modes[i]),
                );
              },
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
