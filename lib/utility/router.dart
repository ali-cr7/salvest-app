import 'package:go_router/go_router.dart';
import 'package:salvest_app/presentation/auth/forgot_password_view.dart';
import 'package:salvest_app/presentation/auth/login_view.dart';
import 'package:salvest_app/presentation/auth/reset_password_view.dart';
import 'package:salvest_app/presentation/auth/signup_view.dart';
import 'package:salvest_app/presentation/home%20page/home_page_view.dart';

abstract class AppRouter {
  static const kHomePageView = '/homePageView';
  static const kProfileView = 'profileView';
  static const kHelpView = '/helpView';
  static const kNotificationView = '/notificationView';
  static const kChildrensView = '/childrensView';
  static const kAppointmentsView = '/appointmentsView';
  static const kSignupView = '/signupView';
  static const kResetPasswordView = '/resetPasswordView';
  static const kForgotPasswordView = '/forgotPasswordView';
  static final router = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (context, state) => const LoginView()),
      GoRoute(
        path: kHomePageView,
        builder: (context, state) => const HomePageView(),
      ),
        GoRoute(
        path: kForgotPasswordView,
        builder: (context, state) => const ForgetPasswordView(),
      ),
        GoRoute(
        path: kResetPasswordView,
        builder: (context, state) => const ResetPasswordView(),
      ),
        GoRoute(
        path: kSignupView,
        builder: (context, state) => const SignUpView(),
      ),
    ],
  );
}
