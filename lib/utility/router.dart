import 'package:go_router/go_router.dart';
import 'package:salvest_app/presentation/auth/forgot_password_view.dart';
import 'package:salvest_app/presentation/auth/login_view.dart';
import 'package:salvest_app/presentation/auth/reset_password_view.dart';
import 'package:salvest_app/presentation/auth/signup_view.dart';
import 'package:salvest_app/presentation/auto%20investment/auto_investment_view.dart';
import 'package:salvest_app/presentation/help/help_view.dart';
import 'package:salvest_app/presentation/home%20page/home_page_view.dart';
import 'package:salvest_app/presentation/notifications/negotiation_notification_view.dart';
import 'package:salvest_app/presentation/notifications/noftifications_view.dart';
import 'package:salvest_app/presentation/portfolio/capital_growth_view.dart';
import 'package:salvest_app/presentation/portfolio/portfolio_view.dart';
import 'package:salvest_app/presentation/profile/profile_view.dart';
import 'package:salvest_app/presentation/property%20details/property_details_view.dart';
import 'package:salvest_app/presentation/sale%20estate/sale_estate_view.dart';
import 'package:salvest_app/presentation/wallet/profits_wallet_view.dart';
import 'package:salvest_app/presentation/wallet/wallet_view.dart';

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

  static final router = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (context, state) => const HomePageView()),
      GoRoute(
        path: kHomePageView,
        builder: (context, state) => const HomePageView(),
      ),
      GoRoute(
        path: kPropertyDetailsView,
        builder: (context, state) => const PropertyDetailsView(),
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
      GoRoute(
        path: kWalitView,
        builder: (context, state) => const WalletView(),
      ),
      GoRoute(
        path: kProfitWalletView,
        builder: (context, state) => const ProfitWalletView(),
      ),
      GoRoute(
        path: kAutoInvestmentView,
        builder: (context, state) => const AutoInvestmentView(),
      ),
      GoRoute(path: kHelpView, builder: (context, state) => const HelpView()),
      GoRoute(
        path: kSaleEstateView,
        builder: (context, state) => const SaleEstateView(),
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
