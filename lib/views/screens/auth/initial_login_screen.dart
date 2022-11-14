import 'package:go_router/go_router.dart';
import 'package:sahakari/common/constant.dart';
import 'package:sahakari/services/local_auth.dart';
import 'package:sahakari/views/components/persistem_bottom_nav.dart.dart';
import 'package:sahakari/views/components/reuseable_widgets.dart';
import 'package:sahakari/views/components/stylized_toast.dart';
import 'package:flutter/material.dart';

class InitialLogin extends StatefulWidget {
  const InitialLogin({Key? key}) : super(key: key);

  @override
  _InitialLoginState createState() => _InitialLoginState();
}

class _InitialLoginState extends State<InitialLogin> {
  late String phone_number;
  bool isisBiometricAvailable = false;
  TextEditingController _phoneController = TextEditingController();

  isBiometricAvailable() async {
    isisBiometricAvailable = await BiometricAuth.isBiometricAvailable();
    // isisBiometricAvailable = true;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    isBiometricAvailable();
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
                        controller: _phoneController,
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          hintText: "+977 xxxxxxxxxx",
                          labelText: "Phone Number",
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 100,
                ),
                CustomPrimaryButton(
                    btnText: "Continue",
                    onTap: () {
                      if (_phoneController.text.isNotEmpty) {
                        if (_phoneController.text == Credentials.mobile) {
                          context.goNamed('home');
                        } else {
                          CustomStyledToast(
                              StylizedToast(
                                message: "Invalid Credentials",
                                image: AssetImage("assets/img/cancel.png"),
                              ),
                              context);
                        }
                      } else {
                        CustomStyledToast(
                            StylizedToast(
                              message: "Enter Phone Numvber",
                              image: AssetImage("assets/img/cancel.png"),
                            ),
                            context);
                      }
                    })
              ],
            ),
          ]),
    );
  }
}
