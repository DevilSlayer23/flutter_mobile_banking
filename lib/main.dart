import 'package:sahakari/services/routes/go_router.dart';
import 'package:flutter/material.dart';

import 'services/theme/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await BiometricAuth.biometricAvailable();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  bool isDarkMode = false;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Sahakari',
      theme: Themes.lightTheme,
      darkTheme: Themes.darkTheme,
      themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light,
      // initialRoute: '/',
      // routes: {
      //   Routes.root: (context) => LoadingScreen(),
      //   Routes.login: (context) => LoginScreen(),
      //   Routes.home: (context) => DashboardMain(),
      //   Routes.offer: (context) => OfferScreen(),
      //   Routes.transactionHistory: (context) => TransactionHistory(),
      //   Routes.profile: (context) => ProfileScreen(),
      // },
      routerConfig: router,
      // routerDelegate: router.routerDelegate,
      // routeInformationParser: router.routeInformationParser,

      // home: LoadingScreen(),
    );
  }
}
