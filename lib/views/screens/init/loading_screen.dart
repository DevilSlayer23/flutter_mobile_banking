import 'package:sahakari/common/routes/routes.dart';
import 'package:sahakari/common/constant.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  bool isLoggedIn = false;
  bool _isFirstRun = false;

  @override
  void initState() {
    debugPrint('[loading screen] init state');
    super.initState();
    // isLoggedIn = true;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      navigate();
    });
  }

  Future<void> navigate() async {
    debugPrint("[navigate invoked]");
    if (_isFirstRun) {
      Future.delayed(Duration.zero, () {
        context.go('/welcome');
        // Navigator.pushNamed(context, Routes.login);
      });
    } else {
      Future.delayed(Duration.zero, () {
        context.go('/login');
        // Navigator.pushNamed(context, Routes.home);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: CircularProgressIndicator(
      color: primaryColor,
    )));
  }
}
