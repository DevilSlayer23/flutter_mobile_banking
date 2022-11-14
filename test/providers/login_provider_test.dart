import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sahakari/providers/login_provider.dart';

void main() async {
  group("Login Provider Test", () {
    late LoginProvider loginProvider;
    setUp(() async {
      WidgetsFlutterBinding.ensureInitialized();
      loginProvider = await LoginProvider();
    });
    test("Login Status should change as parameter provided.", () {
      loginProvider.changeLoginStatus(true);
      expect(loginProvider.isLogin, true);
    });
    test("Button Height should change as parameter provided.", () {
      loginProvider.changeButtonHeight(50);
      expect(loginProvider.buttonHeight, 50);
    });
    // test("Biometric Availability should change as parameter provided.", () {
    //   loginProvider.isBiometricAvailable();
    //   expect(loginProvider.ifBiometricAvailable, false);
    // });
    // test("Authentication should change as parameter provided.", () {
    //   loginProvider.authenticate();
    //   expect(loginProvider.isAuthenticated, false);
    // });
    tearDown(() {
      loginProvider.dispose();
    });
  });
}
