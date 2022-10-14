import 'package:sahakari/services/routes/routes.dart';
import 'package:sahakari/views/components/qr_scanner_latest.dart';
import 'package:sahakari/views/components/bottom_nav.dart';
import 'package:sahakari/views/screens/error_screen.dart';
import 'package:sahakari/views/screens/initial_login_screen.dart';
import 'package:sahakari/views/screens/loading_screen.dart';
import 'package:sahakari/views/screens/login_screen.dart';
import 'package:sahakari/views/screens/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  initialLocation: '/loading',
  routes: <GoRoute>[
    GoRoute(
      name: Routes.loading,
      path: '/loading',
      builder: (BuildContext context, GoRouterState state) {
        return LoadingScreen();
      },
    ),
    GoRoute(
      name: Routes.home,
      path: '/home',
      builder: (BuildContext context, GoRouterState state) {
        return DashboardMain();
      },
    ),
    GoRoute(
      name: Routes.login,
      path: '/login',
      builder: (BuildContext context, GoRouterState state) {
        return LoginScreen();
      },
    ),
    GoRoute(
      name: Routes.initialLogin,
      path: '/initial-login',
      builder: (BuildContext context, GoRouterState state) {
        return InitialLogin();
      },
    ),
    GoRoute(
      name: Routes.register,
      path: '/register',
      builder: (BuildContext context, GoRouterState state) {
        return RegistrationScreen();
      },
    ),
    GoRoute(
      name: Routes.QrScanner,
      path: '/scan',
      builder: (BuildContext context, GoRouterState state) {
        return QrScannerLatest();
      },
    ),
  ],
  // redirect: (context, state) {
  //   if (isLoggedIn) {
  //     return state.location;
  //   }
  //   return '/login';
  // },
  errorBuilder: (context, state) => ErrorScreen(
    error: state.error.toString(),
  ),
);
