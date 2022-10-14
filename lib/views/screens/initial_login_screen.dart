import 'package:sahakari/services/API/api_helper.dart';
import 'package:sahakari/views/components/local_auth.dart';
import 'package:sahakari/views/components/bottom_nav.dart';
import 'package:sahakari/views/components/reuseable_widgets.dart';
import 'package:sahakari/views/components/stylized_toast.dart';
import 'package:sahakari/views/screens/dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';

import 'otp_screen.dart';

class InitialLogin extends StatefulWidget {
  const InitialLogin({Key? key}) : super(key: key);

  @override
  _InitialLoginState createState() => _InitialLoginState();
}

class _InitialLoginState extends State<InitialLogin> {
  late String phone_number;
  bool isBiometricAvailable = false;

  biometricAvailable() async {
    isBiometricAvailable = await BiometricAuth.biometricAvailable();
    // isBiometricAvailable = true;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    biometricAvailable();
  }

  //create a function to login using fingerprint
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      isRoot: true,
      body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 150),
            Container(
                padding: EdgeInsets.all(12),
                height: 200,
                alignment: Alignment.bottomLeft,
                width: double.infinity,
                child: Image.asset(
                  "assets/img/logo_2.png",
                  isAntiAlias: true,
                  fit: BoxFit.contain,
                )),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    "Register / Login",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(12, 0, 0, 10),
                  child: Text(
                    "Into Your Wallet",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 5, 30, 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextField(
                        onChanged: (val) {
                          setState(() {
                            phone_number = val;
                          });
                        },
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          hintText: "+8801774000000",
                          labelText: "Phone Number",
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      //add icon for fingerprint
                      Icon(
                        Icons.fingerprint,
                        color: Colors.blueAccent,
                      ),
                      TextButton(
                          onPressed: () async {
                            //check if fingerprint is available
                            if (isBiometricAvailable) {
                              await BiometricAuth.authenticate()
                                  .then((value) =>
                                      //navigate to da
                                      Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  DashboardMain())))
                                  .onError((error, stackTrace) => print(error));

                              // setState(() {
                              //   if (loginSuccess) {
                              //     //navigate to home screen
                              //     Navigator.pushReplacement(
                              //         context,
                              //         MaterialPageRoute(
                              //             builder: (context) => Dashboard()));
                              //   }
                              // });
                            } else {}
                          },
                          child: Text(
                            "Login with Fingerprint",
                            style: TextStyle(color: Colors.blue.shade900),
                          ))
                    ],
                  ),
                ),
                SizedBox(
                  height: 60,
                ),
                CustomPrimaryButton(
                    btnText: "Continue",
                    onTap: () {
                      // APIService api = APIService();
                      // bool ch = await api.login(phone_number);
                      bool ch = true;
                      if (ch) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => OTPScreen(
                                      phone_number: phone_number,
                                    )));
                      }
                    })
              ],
            ),
          ]),
    );
  }
}
