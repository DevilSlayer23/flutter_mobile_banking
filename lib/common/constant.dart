import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:sahakari/models/profile.dart';

// const Color primaryColor = Color(0xFF005CEE);

const Color primaryColor = Color(0xFF3494D8);
const Color darkBackgroundColor = Color(0xFF16161d),
    onPrimaryLight = Color(0xFF16161d);

const Color lightBackgroundColor = Color(0xFFFFFFF0),
    onPrimaryDark = Color(0xFFFFFFF0);

// const Color secondaryColor = Color(0xff0abab5);
const Color tertiaryColor = Color(0xFF318CE7);
const secondaryColor = Color(0xFF32CD32);

final loading = SpinKitThreeBounce(
  color: Colors.white,
  size: 30.0,
);

final blue_loading = SpinKitThreeBounce(
  color: primaryColor,
  size: 30.0,
);

final ripple_loading = SpinKitRipple(
  color: primaryColor,
  size: 30,
);

class Credentials {
  static String? token;
  static String? id;
  static String? name;
  static String? email;
  static String? mobile = '+9779800000000';
  static String? nid;
  static String? pin = '1337';
  static String? balance;
}

String countryCode = '+977';

Profile dummyProfile = Profile(
  id: 1337,
  firstName: "Smriti",
  lastName: "Sunam",
  mobile: "+9779800000000",
  email: "p1s44ch@hell.burn",
  accountNumber: "13372874629983",
  accountType: "Karmachari Bachat Khata",
  activeBalance: 50000.1765,
  interestRate: 5.0,
  accuredInterest: 1680.457,
);

List<Profile> profiles = [
  Profile(
    id: 1337,
    firstName: "Pisaach",
    lastName: "Pisaach",
    mobile: "+9779800000000",
    email: "",
    accountNumber: "13372874629983",
    accountType: "Savings",
    activeBalance: 50000.0,
    interestRate: 5.0,
    accuredInterest: 1680.457,
  ),
  Profile(
    id: 133,
    firstName: "Devil",
    lastName: "Slayer",
    mobile: "+9779800000000",
    email: "",
    accountNumber: "13389238759383",
    accountType: "Savings",
    activeBalance: 100000.0,
    interestRate: 5.0,
    accuredInterest: 10900.457,
  ),
];
