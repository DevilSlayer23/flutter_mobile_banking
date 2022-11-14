import 'package:flutter/material.dart';
import 'package:logging/logging.dart';

class MyNavObserver extends NavigatorObserver {
  MyNavObserver() {
    Logger.root.onRecord.listen((event) {
      // debugPrint(event);
    });
  }
  final Logger _log = Logger('MyNavObserver');

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    return _log
        .info('didPush: ${route.str}, previousRoute= ${previousRoute?.str}');
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) =>
      _log.info('didPop: ${route.str}, previousRoute= ${previousRoute?.str}');

  @override
  void didRemove(Route<dynamic> route, Route<dynamic>? previousRoute) => _log
      .info('didRemove: ${route.str}, previousRoute= ${previousRoute?.str}');

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) =>
      _log.info('didReplace: new= ${newRoute?.str}, old= ${oldRoute?.str}');

  @override
  void didStartUserGesture(
    Route<dynamic> route,
    Route<dynamic>? previousRoute,
  ) =>
      _log.info('didStartUserGesture: ${route.str}, '
          'previousRoute= ${previousRoute?.str}');

  @override
  void didStopUserGesture() => _log.info('didStopUserGesture');
}

extension on Route<dynamic> {
  String get str => 'route(${settings.name}: ${settings.arguments})';
}
