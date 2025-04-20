import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:salvest_app/business_logic/help%20bloc/help_bloc.dart';
import 'package:salvest_app/business_logic/sale%20property%20bloc/sale_property_bloc.dart';
import 'package:salvest_app/business_logic/send%20property%20bloc/send_property_bloc.dart';
import 'package:salvest_app/business_logic/user/bloc/user_bloc.dart';
import 'package:salvest_app/data/services/auth%20services/auth_repo_impl.dart';
import 'package:salvest_app/data/services/help%20services/help_repo_impl.dart';
import 'package:salvest_app/data/services/sale%20property%20service/sale_property_repo_impl.dart';
import 'package:salvest_app/utility/app_bloc_observer.dart';
import 'package:salvest_app/utility/app_colors.dart';
import 'package:salvest_app/utility/cash_helper.dart';
import 'package:salvest_app/utility/handle_cash.dart';

import 'package:salvest_app/utility/router.dart';
import 'package:salvest_app/utility/service_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  await getCache();
  setupServiceLocator();
  Bloc.observer = MyBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const SalvestApp());
  configLoading();
}

void configLoading() {
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 2000)
    ..indicatorType = EasyLoadingIndicatorType.cubeGrid
    ..animationStyle = EasyLoadingAnimationStyle.offset
    ..loadingStyle = EasyLoadingStyle.custom
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..progressColor = AppColors.lightPurple
    ..backgroundColor = Colors.white
    ..indicatorColor = AppColors.lightPurple
    ..textColor = AppColors.lightPurple
    ..maskColor = Colors.blue.withOpacity(0.5)
    ..userInteractions = true
    ..dismissOnTap = false;
}

class SalvestApp extends StatelessWidget {
  const SalvestApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => UserBloc(getIt.get<AuthRepoImpl>())),

        //HelpBloc
                BlocProvider(create: (context) => HelpBloc(getIt.get<HelpRepoImpl>())),
        BlocProvider(create: (context) => SalePropertyBloc()),
        BlocProvider(
          create:
              (context) => SendPropertyBloc(getIt.get<SalePropertyRepoImpl>()),
        ),
      ],
      child: MaterialApp.router(
        builder: EasyLoading.init(),
        debugShowCheckedModeBanner: false,
        routerConfig: AppRouter.router,
      ),
    );
  }
}
