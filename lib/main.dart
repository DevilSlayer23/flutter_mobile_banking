import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';
import 'package:sahakari/common/routes/go_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:sahakari/providers/login_provider.dart';
import 'package:sahakari/providers/main_provider.dart';
import 'common/theme/app_theme.dart';

final RouteObserver<ModalRoute<void>> routeObserver =
    RouteObserver<ModalRoute<void>>();

void main() async {
  final log = Logger();
  await runZonedGuarded(() {
    WidgetsFlutterBinding.ensureInitialized();
    usePathUrlStrategy();
    FlutterError.onError = (FlutterErrorDetails errorDetails) {
      Zone.current
          .handleUncaughtError(errorDetails.exception, errorDetails.stack!);
      ErrorWidget(errorDetails.exception);
    };
    ErrorWidget.builder = (FlutterErrorDetails error) {
      Zone.current.handleUncaughtError(error.exception, error.stack!);
      return ErrorWidget(error.exception);
    };
    runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => MainScreenProvider()),
          ChangeNotifierProvider(create: (context) => LoginProvider()),
        ],
        child: MyApp(),
      ),
    );
  }, (error, stackTrace) {
    log.e('[ZONED EЯЯoЯ]', error, stackTrace);
  });
}

class MyApp extends StatelessWidget {
  bool isDarkMode = false;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        isDarkMode ? SystemUiOverlayStyle.dark : SystemUiOverlayStyle.light);
    return MaterialApp.router(

      debugShowCheckedModeBanner: false,
      title: 'Sahakari',
      theme: Themes.lightTheme.copyWith(textTheme: Themes.textTheme),
      darkTheme: Themes.darkTheme.copyWith(textTheme: Themes.textTheme),
      themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light,
       
      routerConfig: router,
    
      // home: LoadingScreen(),
    );
  }
}
