import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:salvest_app/business_logic/withdrawls%20request%20bloc/withdrawls_request_bloc.dart';
import 'package:salvest_app/presentation/withdrawal%20money/widgets/withdrawl_request_item.dart';
import 'package:salvest_app/presentation/withdrawal%20money/widgets/withdrawl_request_item_shimmer.dart';
import 'package:salvest_app/utility/app_colors.dart';
import 'package:salvest_app/utility/elevated_button_widget.dart';
import 'package:salvest_app/utility/somthing_wrong.dart';

class WithdrawlRequestsView extends StatelessWidget {
  const WithdrawlRequestsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => GoRouter.of(context).pop(),
        ),
        title: const Text(
          'Withdrawal Requests',
          style: TextStyle(color: Colors.black, fontSize: 18),
        ),
        backgroundColor: AppColors.green,
      ),
      body: BlocBuilder<WithdrawlsRequestBloc, WithdrawlsRequestState>(
        builder: (context, state) {
          if (state is WithdrawlsRequestLoading) {
            return ListView.builder(
              itemCount: 5,
              itemBuilder:
                  (context, index) => const WithdrawlRequestItemShimmer(),
            );
          }
          if (state is WithdrawlsRequestSuccess &&
              state.myWithdrawlsRequests.data!.isNotEmpty) {
            return RefreshIndicator(
              onRefresh: () async {
                context.read<WithdrawlsRequestBloc>().add(
                  GetWithdrawlsRequest(),
                );
              },
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(vertical: 12),
                itemCount: state.myWithdrawlsRequests.data!.length,
                itemBuilder: (context, index) {
                  final item = state.myWithdrawlsRequests.data![index];
                  return WithdrawRequestItem(
                    amount: item.amount!,
                    createdAt: item.createdAt.toString(),
                    method: item.method!,
                    methodDetails: item.methodDetails!,
                    status: item.status!,
                    trx: item.transactionReference ?? ' ',
                  );
                },
              ),
            );
          }
          if (state is WithdrawlsRequestSuccess &&
              state.myWithdrawlsRequests.data!.isEmpty) {
            return SomethingWrongWidget(
              title: "No Requests found!",
              svgPath: 'assets/images/search.svg',
              elevatedButtonWidget: ElevatedButtonWidget(
                title: "Refresh",
                onPressed:
                    () => context.read<WithdrawlsRequestBloc>().add(
                      GetWithdrawlsRequest(),
                    ),
              ),
            );
          }

          if (state is WithdrawlsRequestFailure) {
            return SomethingWrongWidget(
              elevatedButtonWidget: ElevatedButtonWidget(
                title: "Refresh",
                onPressed: () {
                  context.read<WithdrawlsRequestBloc>().add(
                    GetWithdrawlsRequest(),
                  );
                },
             
              ),
            );
          } else {
            return SomethingWrongWidget(
              elevatedButtonWidget: ElevatedButtonWidget(
                title: "Refresh",
                onPressed: () {
                  context.read<WithdrawlsRequestBloc>().add(
                    GetWithdrawlsRequest(),
                  );
                },
                // () => context.read<InvesetingHistoryBloc>().add(
                //   GetInvestingHistory(page: 1),
                // ),
              ),
            );
          }
        },
      ),
    );
  }
}
