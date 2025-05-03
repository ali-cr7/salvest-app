import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:salvest_app/business_logic/help%20bloc/help_bloc.dart';
import 'package:salvest_app/business_logic/offered%20properties%20bloc/offered_properties_bloc.dart';
import 'package:salvest_app/business_logic/property%20for%20investment%20bloc/properties_for_investment_bloc.dart';
import 'package:salvest_app/business_logic/sale%20property%20bloc/sale_property_bloc.dart';
import 'package:salvest_app/business_logic/wallet%20bloc/wallet_bloc.dart';
import 'package:salvest_app/constants.dart';
import 'package:salvest_app/data/models/get_proprties_for_investment_response/get_proprties_for_investment_response.dart';
import 'package:salvest_app/data/models/get_proprties_for_investment_response/property.dart';
import 'package:salvest_app/data/services/help%20services/help_repo_impl.dart';
import 'package:salvest_app/data/services/property%20service/sale_property_repo_impl.dart';
import 'package:salvest_app/data/services/wallet%20services/wallet_services_repo_impl.dart';
import 'package:salvest_app/presentation/auth/forgot_password_view.dart';
import 'package:salvest_app/presentation/auth/login_view.dart';
import 'package:salvest_app/presentation/auth/reset_password_view.dart';
import 'package:salvest_app/presentation/auth/signup_view.dart';
import 'package:salvest_app/presentation/auth/widgets/stripe.dart';
import 'package:salvest_app/presentation/auto%20investment/auto_investment_view.dart';
import 'package:salvest_app/presentation/certification/certifications_view.dart';
import 'package:salvest_app/presentation/certification/widgets/investing_certification__details_view.dart';
import 'package:salvest_app/presentation/certification/widgets/investing_certification_view.dart';
import 'package:salvest_app/presentation/help/common_question_view.dart';
import 'package:salvest_app/presentation/help/help_view.dart';
import 'package:salvest_app/presentation/home%20page/home_page_view.dart';
import 'package:salvest_app/presentation/negotition/negotition_chat_view.dart';
import 'package:salvest_app/presentation/notifications/negotiation_notification_view.dart';
import 'package:salvest_app/presentation/notifications/noftifications_view.dart';
import 'package:salvest_app/presentation/portfolio/capital_growth_view.dart';
import 'package:salvest_app/presentation/portfolio/portfolio_view.dart';
import 'package:salvest_app/presentation/profile/profile_view.dart';
import 'package:salvest_app/presentation/property%20details/property_details_view.dart';
import 'package:salvest_app/presentation/sale%20estate/sale_estate_view.dart';
import 'package:salvest_app/presentation/sale%20estate/sale_state_request_view.dart';
import 'package:salvest_app/presentation/wallet/profits_wallet_view.dart';
import 'package:salvest_app/presentation/wallet/wallet_view.dart';
import 'package:salvest_app/presentation/wallet/widgets/stripe_payment.dart';
import 'package:salvest_app/utility/service_locator.dart';

abstract class AppRouter {
  static const kHomePageView = '/homePageView';
  static const kProfileView = '/profileView';
  static const kHelpView = '/helpView';
  static const kNegotiationNotificationView = '/NegotiationNotificationView';
  static const kNotificationView = '/notificationView';
  static const kChildrensView = '/childrensView';
  static const kAppointmentsView = '/appointmentsView';
  static const kSignupView = '/signupView';
  static const kResetPasswordView = '/resetPasswordView';
  static const kForgotPasswordView = '/forgotPasswordView';
  static const kSaleEstateView = '/SaleEstateView';
  static const kWalitView = '/walitView';
  static const kProfitWalletView = '/kProfitWalletView';
  static const kPropertyDetailsView = '/propertyDetailsView';
  static const kPortfolioView = '/PortfolioView';
  static const kAutoInvestmentView = '/AutoInvestmentView';
  static const kCapitalGrowthView = '/CapitalGrowthView';
  static const kCertificationsView = '/CertificationsView';
  static const kCommonQuestionView = '/CommonQuestionView';
  static const kInvestingCertificationView = '/InvestingCertificationView';
  static const kInvestingCertificationDetailsView =
      '/InvestingCertificationDetailsView';
  static const kSaleStateRequestView = '/SaleStateRequestView';
  static const kStripeTokenTestScreen = '/StripeTokenTestScreen';
  static const kNegotitionChatView = '/NegotitionChatView';

  static final router = GoRouter(
    routes: [
      if (token != null)
        GoRoute(
          path: '/',
          builder:
              (context, state) => BlocProvider(
                create:
                    (context) => PropertiesForInvestmentBloc(
                      getIt.get<SalePropertyRepoImpl>(),
                    )..add(
                      GetPropertiesForInvestmentsEvent(propertyType: 'vila'),
                    ),
                child: const HomePageView(),
              ),
        ),
      if (token == null)
        GoRoute(path: '/', builder: (context, state) => const LoginView()),
      GoRoute(
        path: kHomePageView,
        builder:
            (context, state) => BlocProvider(
              create:
                  (context) => PropertiesForInvestmentBloc(
                    getIt.get<SalePropertyRepoImpl>(),
                  )..add(
                    GetPropertiesForInvestmentsEvent(propertyType: 'vila'),
                  ),
              child: const HomePageView(),
            ),
      ),
      GoRoute(
        path: kStripeTokenTestScreen,
        builder: (context, state) => StripePaymentScreen(),
      ),
      GoRoute(
        path: kNegotitionChatView,
        builder: (context, state) => NegotitionChatView(),
      ),
      GoRoute(
        path: kInvestingCertificationDetailsView,
        builder: (context, state) => const InvestingCertificationDetailsView(),
      ),
      GoRoute(
        path: kPropertyDetailsView,
        builder: (context, state) {
          final args = state.extra as Property; // or Map<String, dynamic>
          return PropertyDetailsView(
            bathRoomNum: args.numberOfRooms.toString(),
            bedRoomNum: args.numberOfRooms.toString(),
            category: args.propertyType.toString(),
            categoryColor: Colors.green,
            chanceNum: args.numberOfChances!,
            chancePrice: double.tryParse(args.chancePrice!)?.toInt() ?? 0,
            deadline: args.investmentTime!,
            iconData: CupertinoIcons.money_dollar_circle_fill,
            imageUrls: args.propertyImages!,
            propertyId: args.propertyForInvestmentId.toString(),
            valuation: args.expectedPrice!,
            yearlyProfit: args.profitPercent.toString(),
            yearlyReturn: args.profitPercent.toString(),
          );
        },
      ),
      GoRoute(
        path: kInvestingCertificationView,
        builder: (context, state) => const InvestingCertificationView(),
      ),
      GoRoute(
        path: kCertificationsView,
        builder: (context, state) => const CertificationsView(),
      ),

      GoRoute(
        path: kSaleStateRequestView,
        builder:
            (context, state) => BlocProvider(
              create:
                  (context) =>
                      OfferedPropertiesBloc(getIt.get<SalePropertyRepoImpl>())
                        ..add(GetOfferedPropertiesEvent()),
              child: const SaleStateRequestView(),
            ),
      ),
      GoRoute(
        path: kCommonQuestionView,
        builder:
            (context, state) => BlocProvider(
              create:
                  (context) =>
                      HelpBloc(getIt.get<HelpRepoImpl>())..add(GetFqmEvent()),
              child: const CommonQuestionView(),
            ),
      ),
      GoRoute(
        path: kCapitalGrowthView,
        builder: (context, state) => const CapitalGrowthView(),
      ),
      GoRoute(
        path: kPortfolioView,
        builder: (context, state) => const PortfolioView(),
      ),
      GoRoute(
        path: kForgotPasswordView,
        builder: (context, state) => const ForgetPasswordView(),
      ),

      // case AppRoutes.welcomeToPromote:
      //         return BlocProvider(
      //           create: (context) =>
      //               AgencyPromotionStatusBloc()..add(GetPromotionStatusEvent()),
      //           child: const WelcomeToPromote(),
      //         );
      GoRoute(
        path: kWalitView,
        builder:
            (context, state) => BlocProvider(
              create:
                  (context) =>
                      WalletBloc(getIt.get<WalletServicesRepoImpl>())
                        ..add(GetWalletBalanceEvent()),
              child: const WalletView(),
            ),
      ),
      GoRoute(
        path: kProfitWalletView,
        builder:
            (context, state) => BlocProvider(
              create:
                  (context) =>
                      WalletBloc(getIt.get<WalletServicesRepoImpl>())
                        ..add(GetProfitsWalletBalanceEvent()),
              child: const ProfitWalletView(),
            ),
      ),
      GoRoute(
        path: kAutoInvestmentView,
        builder: (context, state) => const AutoInvestmentView(),
      ),
      GoRoute(path: kHelpView, builder: (context, state) => const HelpView()),

      GoRoute(
        path: kSaleEstateView,
        builder: (context, state) {
          // Get the state from route extra or parameters
          // salePropertyState args = settings.arguments as AddPropertyState;
          final salePropertyState =
              state.extra as SalePropertyState? ??
              SalePropertyState(propertyType: 'default_type');

          return BlocProvider(
            create: (context) => SalePropertyBloc(),
            child: SaleEstateView(salePropertyState: salePropertyState),
          );
        },
      ),
      GoRoute(
        path: kProfileView,
        builder: (context, state) => const ProfileView(),
      ),
      GoRoute(
        path: kNegotiationNotificationView,
        builder: (context, state) => const NegotiationNotificationView(),
      ),
      GoRoute(
        path: kResetPasswordView,
        builder: (context, state) => const ResetPasswordView(),
      ),
      GoRoute(
        path: kSignupView,
        builder: (context, state) => const SignUpView(),
      ),
      GoRoute(
        path: kNotificationView,
        builder: (context, state) => const NotificationsView(),
      ),
    ],
  );
}
