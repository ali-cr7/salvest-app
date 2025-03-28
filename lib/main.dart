import 'package:flutter/material.dart';
import 'package:salvest_app/presentation/home%20page/home_page_view.dart';
import 'package:salvest_app/utility/router.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const SalvestApp());
}

class SalvestApp extends StatelessWidget {
  const SalvestApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp.router(
      debugShowCheckedModeBanner: false,
          routerConfig: AppRouter.router,
    );
  }
}
