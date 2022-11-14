import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sahakari/common/constant.dart';
import 'package:sahakari/common/routes/routes.dart';
import 'package:sahakari/services/screen_size.dart';
import 'package:sahakari/views/components/stylized_toast.dart';

import '../services/local_auth.dart';

class LoginProvider extends ChangeNotifier {
  bool _isLogin = false;
  bool _isClicked = false;
  bool _isLoading = false;
  bool _ifBiometricAvailable = false;
  bool _isAuthenticated = false, _showPassword = false;
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _pinController = TextEditingController();
  double _buttonHeight = 50;
  double _buttonWidth = 0.0;
  var _deviceSizeData =
      MediaQueryData.fromWindow(WidgetsBinding.instance.window);
  double _deviceHeight = 0.0;
  double _deviceWidth = 0.0;
  Color? _IconColor;

  bool get isLogin => _isLogin;
  bool get isClicked => _isClicked;
  bool get isLoading => _isLoading;
  bool get ifBiometricAvailable => _ifBiometricAvailable;
  bool get isAuthenticated => _isAuthenticated;
  bool get showPassword => _showPassword;
  TextEditingController get phoneController => _phoneController;
  TextEditingController get pinController => _pinController;
  double get buttonHeight => _buttonHeight;
  double get buttonWidth => _buttonWidth;
  double get deviceHeight => _deviceHeight;
  double get deviceWidth => _deviceWidth;

  void changeLoginStatus(bool status) {
    _isLogin = status;
    notifyListeners();
  }

  loadDeviceDimensions() {
    _deviceHeight = _deviceSizeData.size.longestSide;
    _deviceWidth = _deviceSizeData.size.shortestSide;
    _buttonHeight = 50;
    _buttonWidth = _deviceWidth * 0.9;
  }

  isBiometricAvailable() async {
    _ifBiometricAvailable = await BiometricAuth.isBiometricAvailable() ?? false;
    return _ifBiometricAvailable;
  }

  void authenticate() async {
    _isAuthenticated = await BiometricAuth.authenticate();
    notifyListeners();
  }

  void changeClickedStatus(bool status) {
    _isClicked = status;
    notifyListeners();
  }

  void changeLoadingStatus(bool status) {
    _isLoading = status;
    notifyListeners();
  }

  void changeShowPasswordStatus() {
    _showPassword = !_showPassword;
    notifyListeners();
  }

  void changeButtonHeight(double height) {
    _buttonHeight = height;
  }

  void changeButtonWidth(double width) {
    _buttonWidth = width;
  }

  void clearControllers() {
    _phoneController.clear();
    _pinController.clear();
    notifyListeners();
  }

  void disposeControllers() {
    _phoneController.dispose();
    _pinController.dispose();
    notifyListeners();
  }

  void onFingerPrintTap(BuildContext context) async {
    changeLoadingStatus(true);
    if (_ifBiometricAvailable) {
      try {
        Future.delayed(Duration(milliseconds: 1500), () async {
          changeLoadingStatus(false);

          if (await BiometricAuth.authenticate()) {
            GoRouter.of(context).go(
              '/home',
            );
          }
        });
      } catch (e) {
        CustomStyledToast(
            StylizedToast(
              message: e.toString(),
              image: AssetImage("assets/img/cancel.png"),
            ),
            context);

        changeLoadingStatus(false);
      }
    } else {
      Future.delayed(Duration(milliseconds: 1000), () {
        CustomStyledToast(
            StylizedToast(
              message: "Fingerprint sensor not available on device",
              image: AssetImage("assets/img/cancel.png"),
            ),
            context);

        changeLoadingStatus(false);
      });
    }
  }

  void onLogin(BuildContext context) async {
    double _width = Responsive.getWidth(context);
    changeClickedStatus(true);
    if (_phoneController.text.isNotEmpty && _pinController.text.isNotEmpty) {
      if (_phoneController.text.trim() == Credentials.mobile.toString() &&
          _pinController.text.trim() == Credentials.pin.toString()) {
        Future.delayed(Duration(milliseconds: 1000), () {
          context.goNamed(Routes.home);
        });
      } else {
        Future.delayed(Duration(seconds: 1), () {
          CustomStyledToast(
              StylizedToast(
                message: "Invalid Credentials",
                image: AssetImage("assets/img/cancel.png"),
              ),
              context);
          changeButtonWidth(_width * 0.9);
          changeClickedStatus(false);

          // _screenHeight = h * 0.1;
        });
      }
    } else {
      Future.delayed(Duration(milliseconds: 1000), () {
        CustomStyledToast(
            StylizedToast(
              message: "Please fill all the fields",
              image: AssetImage("assets/img/cancel.png"),
            ),
            context);

        changeClickedStatus(false);
        changeButtonWidth(_width * 0.9);
        // _screenHeight = h * 0.1;
      });
    }
  }
}
