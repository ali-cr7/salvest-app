// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:salvest_app/business_logic/wallet%20bloc/wallet_bloc.dart';
// import 'package:salvest_app/utility/app_assests.dart';

// class InvestmentsOfWallet extends StatelessWidget {
//   const InvestmentsOfWallet({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 345,
//       height: 200,
//       decoration: ShapeDecoration(
//         image: const DecorationImage(
//           image: AssetImage(AppAssets.walletBackg),
//           fit: BoxFit.fill,
//         ),
//         color: const Color(0xFF9A8AEC),
//         shape: RoundedRectangleBorder(
//           side: BorderSide(width: 2, color: const Color(0x7F9A8AEC)),
//           borderRadius: BorderRadius.circular(20),
//         ),
//       ),
//       child: Row(
//         children: [
//           Padding(
//             padding: const EdgeInsets.only(left: 12.0, right: 8.0),
//             child: Stack(
//               alignment: Alignment.center,
//               children: [
//                 SizedBox(
//                   height: 140,
//                   width: 140,
//                   child: CircularProgressIndicator(
//                     value: 0.87,
//                     backgroundColor: Colors.white.withOpacity(0.3),
//                     valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
//                     strokeWidth: 10,
//                   ),
//                 ),
//                 BlocBuilder<WalletBloc, WalletState>(
//                   builder: (context, state) {
//                     if (state is GetWalletBalanceLoading) {
//                       return CupertinoActivityIndicator(radius: 12);
//                     } else if (state is GetWalletPerecentageSuccess) {
//                       return Text(
//                         "${state.response.data!.percentage!}%",
//                         style: TextStyle(
//                           fontSize: 20,
//                           color: Colors.white,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       );
//                     }
//                     else {
//                         return Text(
//                         "failed to download",
//                         style: TextStyle(
//                           fontSize: 20,
//                           color: Colors.white,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       );
//                     }
//                   },
//                 ),
//               ],
//             ),
//           ),
//           // Expanded(child: SizedBox()),
//           Expanded(
//             child: Text(
//               'investments of your wallet\n',
//               textAlign: TextAlign.center,
//               style: TextStyle(
//                 color: Colors.white,
//                 fontSize: 16,
//                 fontFamily: 'Inter',
//                 fontWeight: FontWeight.w600,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
// lib/presentation/portfolio/widgets/investments_of_wallets.dart
import 'package:flutter/material.dart';
import 'package:salvest_app/utility/app_assests.dart';

class InvestmentsOfWallet extends StatelessWidget {
  final int totalOpportunities;
  final int totalAmount;

  const InvestmentsOfWallet({
    super.key,
    required this.totalOpportunities,
    required this.totalAmount,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 345,
      height: 200,
      decoration: ShapeDecoration(
        image: const DecorationImage(
          image: AssetImage(AppAssets.walletBackg),
          fit: BoxFit.fill,
        ),
        color: const Color(0xFF9A8AEC),
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 2, color: Color(0x7F9A8AEC)),
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Opportunities: $totalOpportunities',
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Total Amount: \$${totalAmount}',
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
