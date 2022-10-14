import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

const Color primaryColor = Color(0xff3457D5);
const Color secondaryColor = Color(0xff7FFFD4);

final loading = SpinKitThreeBounce(
  color: Colors.white,
  size: 30.0,
);

final blue_loading = SpinKitThreeBounce(
  color: primaryColor,
  size: 30.0,
);

class Credentials {
  static String? token;
  static String? id;
  static String? name;
  static String? email;
  static String? mobile = '+9779812345678';
  static String? nid;
  static String? pin = '1920';
  static String? balance;
}
