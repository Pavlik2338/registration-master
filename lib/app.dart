import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:registration/pages/add_transaction/add_lisiner.dart';
import 'package:registration/pages/add_transaction/add_transaction_page.dart';
import 'package:registration/pages/home_page.dart';
import 'package:registration/pages/login/login_page.dart';
import 'package:registration/pages/budget/plan_budget_page.dart';
import 'package:registration/resources/theme/custom_theme.dart';
import 'package:registration/widgets/navigation_bar.dart';
import 'resources/router.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 800),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
            theme: CustomTheme.lightTheme,
            home: LoginPage(), //TODO
            onGenerateRoute: generateRoute,
          );
        });
  }
}
