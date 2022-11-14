import 'package:sahakari/models/profile.dart';
import 'package:sahakari/common/routes/navigator-observers.dart';
import 'package:sahakari/common/routes/routes.dart';
import 'package:sahakari/views/screens/auth/login_screen_new.dart';
import 'package:sahakari/views/screens/main_view.dart';
import 'package:sahakari/views/screens/qr_scanner/qr_scanner_latest.dart';
import 'package:sahakari/views/components/persistem_bottom_nav.dart.dart';
import 'package:sahakari/views/screens/auth/initial_login_screen.dart';
import 'package:sahakari/views/screens/auth/login_screen.dart';
import 'package:sahakari/views/screens/auth/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sahakari/views/screens/error/error_screen.dart';
import 'package:sahakari/views/screens/init/loading_screen.dart';
import 'package:sahakari/views/screens/init/welcome_screen.dart';
import 'package:sahakari/views/screens/transaction/cash_out_screen.dart';
import 'package:sahakari/views/screens/transaction/mobile_recharge_screen.dart';
import 'package:sahakari/views/screens/transaction/send_money_confirmation.dart';
import 'package:sahakari/views/screens/transaction/send_money_screen.dart';
import 'package:sahakari/views/screens/utils/utility_screen.dart';

import '../constant.dart';

final navigatorKey = GlobalKey<NavigatorState>();

Profile _profileFrom(int id) {
  Profile profile = profiles.where((element) => element.id == id).first;
  debugPrint('[PROFILE ] $profile');
  return profile;
}

// ------- Loading Routes & subroutes --------
final GoRouter router = GoRouter(
  initialLocation: '/',
  // navigatorKey: navigatorKey,
  // observers: [MyNavObserver()],

  routes: <GoRoute>[
    GoRoute(
        name: Routes.root,
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return LoadingScreen();
        }),
    GoRoute(
        name: Routes.welcome,
        path: '/welcome',
        pageBuilder: (BuildContext context, GoRouterState state) {
          return CustomTransitionPage(
            key: state.pageKey,
            child: WelcomeScreen(),
            transitionsBuilder: (BuildContext context,
                Animation<double> animation,
                Animation<double> secondaryAnimation,
                Widget child) {
              return SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(0.0, 1.0),
                  end: Offset.zero,
                ).animate(animation),
                child: child,
              );
            },
          );
        },
        routes: [
          GoRoute(
            name: Routes.initialLogin,
            path: Routes.initialLogin,
            pageBuilder: (BuildContext context, GoRouterState state) {
              return CustomTransitionPage(
                key: state.pageKey,
                child: InitialLogin(),
                transitionsBuilder: (BuildContext context,
                    Animation<double> animation,
                    Animation<double> secondaryAnimation,
                    Widget child) {
                  return SlideTransition(
                    position: Tween<Offset>(
                      begin: const Offset(0.0, 1.0),
                      end: Offset.zero,
                    ).animate(animation),
                    child: child,
                  );
                },
              );
            },
          ),
        ]),

    // ---------- Home Routes and Subroutes ----------
    GoRoute(
        name: Routes.home,
        path: '/home',
        pageBuilder: (BuildContext context, GoRouterState state) {
          return CustomTransitionPage(
            key: state.pageKey,
            child: MainView(),
            transitionsBuilder: (BuildContext context,
                Animation<double> animation,
                Animation<double> secondaryAnimation,
                Widget child) {
              // return SlideTransition(
              //   position: Tween<Offset>(
              //     begin: const Offset(0.0, 1.0),
              //     end: Offset.zero,
              //   ).animate(animation),
              //   child: child,
              // );
              return FadeTransition(
                opacity: animation,
                child: child,
              );
            },
          );
        },
        routes: [
          GoRoute(
              name: Routes.sendMoney,
              path: 'send-money/:id',
              pageBuilder: (BuildContext context, GoRouterState state) {
                final profile_id = int.parse(state.params['id']!);
                return CustomTransitionPage(
                  key: state.pageKey,
                  child: SendMoneyScreen(
                    // profile: _profileFrom(profile!),
                    id: _profileFrom(profile_id).id,
                  ),
                  transitionsBuilder: (BuildContext context,
                      Animation<double> animation,
                      Animation<double> secondaryAnimation,
                      Widget child) {
                    return FadeTransition(opacity: animation, child: child);
                  },
                );
              },
              routes: [
                GoRoute(
                  name: Routes.sendMoneyConfirmation,
                  path: "send-money-confirmation/:id",
                  pageBuilder: (BuildContext context, GoRouterState state) {
                    final _reciever = state.params['reciever'];
                    final _amount = state.params['amount'];
                    return CustomTransitionPage(
                      key: state.pageKey,
                      child: SendMoneyConfirmation(
                        receiver: _reciever.toString(),
                        amount: _amount.toString(),
                      ),
                      transitionsBuilder: (BuildContext context,
                          Animation<double> animation,
                          Animation<double> secondaryAnimation,
                          Widget child) {
                        return FadeTransition(opacity: animation, child: child);
                      },
                    );
                  },
                )
              ]),
          GoRoute(
            name: Routes.cashOut,
            path: 'cash-out',
            pageBuilder: (BuildContext context, GoRouterState state) {
              // final profile = state.params['profile'];
              return CustomTransitionPage(
                key: state.pageKey,
                child: CashOutScreen(),
                transitionsBuilder: (BuildContext context,
                    Animation<double> animation,
                    Animation<double> secondaryAnimation,
                    Widget child) {
                  return FadeTransition(opacity: animation, child: child);
                },
              );
            },
          ),
          GoRoute(
            name: Routes.recharge,
            path: 'recharge',
            pageBuilder: (BuildContext context, GoRouterState state) {
              return CustomTransitionPage(
                key: state.pageKey,
                child: MobileRechargeScreen(),
                transitionsBuilder: (BuildContext context,
                    Animation<double> animation,
                    Animation<double> secondaryAnimation,
                    Widget child) {
                  return FadeTransition(opacity: animation, child: child);
                },
              );
            },
          ),
          GoRoute(
            name: Routes.utility,
            path: Routes.utility,
            pageBuilder: (BuildContext context, GoRouterState state) {
              return CustomTransitionPage(
                key: state.pageKey,
                child: UtilityScreen(),
                transitionsBuilder: (BuildContext context,
                    Animation<double> animation,
                    Animation<double> secondaryAnimation,
                    Widget child) {
                  return FadeTransition(opacity: animation, child: child);
                },
              );
            },
          ),
        ]),
    GoRoute(
      name: Routes.login,
      path: '/login',
      pageBuilder: (BuildContext context, GoRouterState state) {
        return CustomTransitionPage(
          key: state.pageKey,
          child: LoginScreenNew(),
          transitionsBuilder: (BuildContext context,
              Animation<double> animation,
              Animation<double> secondaryAnimation,
              Widget child) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(0.0, 1.0),
                end: Offset.zero,
              ).animate(animation),
              child: child,
            );
          },
        );
      },
    ),
    GoRoute(
      name: Routes.register,
      path: '/register',
      pageBuilder: (BuildContext context, GoRouterState state) {
        return CustomTransitionPage(
          key: state.pageKey,
          child: RegistrationScreen(),
          transitionsBuilder: (BuildContext context,
              Animation<double> animation,
              Animation<double> secondaryAnimation,
              Widget child) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(0.0, 1.0),
                end: Offset.zero,
              ).animate(animation),
              child: child,
            );
          },
        );
      },
    ),
    GoRoute(
      name: Routes.QrScanner,
      path: '/scan',
      pageBuilder: (BuildContext context, GoRouterState state) {
        return CustomTransitionPage(
          key: state.pageKey,
          child: QrScannerLatest(),
          transitionsBuilder: (BuildContext context,
              Animation<double> animation,
              Animation<double> secondaryAnimation,
              Widget child) {
            return SlideTransition(
              position: animation.drive(
                Tween<Offset>(
                  begin: const Offset(0.0, 1.0),
                  end: Offset.zero,
                ),
              ),
              child: child,
            );
          },
        );
      },
    ),
  ],
  // redirect: (context, state) {
  //   if (isLoggedIn) {
  //     return state.location;
  //   }
  //   return '/login';
  // },
  errorPageBuilder: (context, state) => CustomTransitionPage(
    key: state.pageKey,
    child: ErrorScreen(
      error: state.error.toString(),
    ),
    transitionsBuilder: (BuildContext context, Animation<double> animation,
        Animation<double> secondaryAnimation, Widget child) {
      return FadeTransition(
        opacity: animation,
        child: child,
      );
    },
  ),
);
