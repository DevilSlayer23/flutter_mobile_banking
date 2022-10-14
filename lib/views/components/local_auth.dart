import 'package:flutter/services.dart';
import 'package:local_auth/error_codes.dart' as auth_error;
import 'package:local_auth/local_auth.dart';

class BiometricAuth {
  static final LocalAuthentication auth = LocalAuthentication();
  static List<BiometricType> availableBiometrics = [];

  static checkBiometricHardwareSupport() async {
    final bool canAuthenticate =
        await auth.canCheckBiometrics || await auth.isDeviceSupported();
    if (canAuthenticate) {
      print("biometric hardware is available");
      return true;
    } else {
      print("biometric hardware is not available");
      return false;
    }
  }

  static biometricAvailable() async {
    availableBiometrics = await auth.getAvailableBiometrics();
    print("available biometrics: $availableBiometrics");
    if (availableBiometrics.isNotEmpty) {
      if (availableBiometrics.contains(BiometricType.fingerprint) ||
          availableBiometrics.contains(BiometricType.strong) ||
          availableBiometrics.contains(BiometricType.weak)) {
        return true;
      } else {
        return false;
      }
    }
    return false;
  }

  static Future<bool> authenticate() async {
    try {
      final bool didAuthenticate = await auth.authenticate(
          localizedReason: 'Authenticate using biometrics',
          options: const AuthenticationOptions(
            useErrorDialogs: true,
            biometricOnly: true,
          ));
      return didAuthenticate;
    } on PlatformException catch (e) {
      if (e.code == auth_error.notEnrolled) {
        return false;
        // Add handling of no hardware here.
      } else if (e.code == auth_error.lockedOut ||
          e.code == auth_error.permanentlyLockedOut) {
        return false;
      } else {
        return false;
      }
    }
  }
}
