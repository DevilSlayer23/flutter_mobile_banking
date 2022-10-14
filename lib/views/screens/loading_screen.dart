import 'package:sahakari/services/routes/routes.dart';
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

  @override
  void initState() {
    print('[loading screen] init state');
    super.initState();
    // isLoggedIn = true;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      navigate();
    });
  }

  Future<void> navigate() async {
    
    print("[navigate invoked]");
    Future.delayed(Duration.zero, () {
      context.go('/login');
      // Navigator.pushNamed(context, Routes.login);
    });
    
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
