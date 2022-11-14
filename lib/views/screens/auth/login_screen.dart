import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:sahakari/services/local_auth.dart';
import 'package:sahakari/views/components/persistem_bottom_nav.dart.dart';
import 'package:sahakari/common/constant.dart';
import 'package:sahakari/views/components/stylized_toast.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sahakari/services/validators.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isClicked = false;
  late bool isLoading, isInit = false;
  bool isisBiometricAvailable = false;
  bool isAuthenticated = false, showPassword = false;
  var _deviceSizeData =
      MediaQueryData.fromWindow(WidgetsBinding.instance.window);
  double _deviceHeight = 0.0;
  double _deviceWidth = 0.0;
  // double _deviceWidth = _deviceSizeData.size.width;
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _pinController = TextEditingController();
  late double _buttonHeight, _buttonWidth;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();

    load();
    debugPrint("[Screen Width ] $_deviceWidth");
    isBiometricAvailable();
  }

  @override
  void dispose() {
    _phoneController.dispose();
    _pinController.dispose();
    super.dispose();
  }

  Future<void> load() async {
    _deviceHeight = _deviceSizeData.size.longestSide;
    _deviceWidth = _deviceSizeData.size.shortestSide;
    _buttonHeight = 50;
    _buttonWidth = _deviceWidth * 0.8;
    setState(() {
      isLoading = false;
      isInit = true;
    });
  }

  Future<void> navigateToHome() async {
    debugPrint('[navigate to home invoked]');
    await Future.delayed(Duration(seconds: 2), () {
      context.go('/home');
      // Navigator.pushNamed(context, '/home');
    });
  }

  isBiometricAvailable() async {
    bool isBiometricAvailable = await BiometricAuth.isBiometricAvailable();
    if (mounted) {
      setState(() {
        isisBiometricAvailable = isBiometricAvailable;
      });
      debugPrint("$isisBiometricAvailable");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
                height: _deviceHeight,
                width: _deviceWidth,
                child: Image.asset("assets/img/bck_r.png")),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                // Container(
                //   alignment: Alignment.topRight,
                //   width: double.infinity,
                //   height: 300,
                //   child: Stack(
                //     children: [
                //       Image.asset("assets/img/vector_1_r.png"),
                //       Image.asset("assets/img/vector_2_r.png"),
                //     ],
                //   ),
                // )
              ],
            ),
            isInit
                ? Container(
                    color: Colors.transparent,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 150,
                        ),
                        Container(
                            padding: EdgeInsets.all(12),
                            height: 150,
                            child: Image.asset("assets/img/logo_2.png")),
                        Container(
                          color: Theme.of(context).primaryColor,
                          child: Form(
                            key: _formKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Text(
                                    "Log In",
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleLarge!
                                        .copyWith(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onPrimary,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 35,
                                        ),
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Phone Number",
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodySmall!
                                                .copyWith(
                                                  color: Theme.of(context)
                                                      .primaryColorDark,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 18,
                                                ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      TextFormField(
                                        // initialValue: "+977 980000000",
                                        keyboardType: TextInputType.phone,
                                        controller: _phoneController,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge
                                            ?.copyWith(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w500,
                                              color: Theme.of(context)
                                                  .primaryColorDark,
                                            ),
                                        // initialValue: countryCode,
                                        validator: (value) =>
                                            Validator.validatePhone(value!),
                                        autovalidateMode:
                                            AutovalidateMode.onUserInteraction,
                                        decoration: InputDecoration(
                                          hintText: "Mobile Number",
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                // SizedBox(
                                //   height: 20,
                                // ),
                                Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Enter Pin",
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodySmall!
                                                .copyWith(
                                                  color: Theme.of(context)
                                                      .primaryColorDark,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 18,
                                                ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      TextFormField(
                                        keyboardType: TextInputType.number,
                                        controller: _pinController,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge
                                            ?.copyWith(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w500,
                                                color: Theme.of(context)
                                                    .primaryColorDark),
                                        validator: ((value) =>
                                            Validator.validatePin(value!)),
                                        autovalidateMode:
                                            AutovalidateMode.onUserInteraction,
                                        obscureText:
                                            showPassword ? false : true,
                                        decoration: InputDecoration(
                                            hintText: "Password",
                                            prefixIcon: Icon(Icons.password),
                                            suffixIcon: IconButton(
                                                icon: showPassword
                                                    ? Icon(
                                                        Icons.visibility_off,
                                                        color: Theme.of(context)
                                                            .colorScheme
                                                            .onPrimary,
                                                      )
                                                    : Icon(
                                                        Icons.visibility,
                                                        color: Theme.of(context)
                                                            .colorScheme
                                                            .onPrimary,
                                                      ),
                                                onPressed: (() => setState(() {
                                                      showPassword =
                                                          !showPassword;
                                                    })))

                                            // onChanged: ((value) => debugPrint(value)),
                                            ),
                                      )
                                    ],
                                  ),
                                ),
                                //add a biometric fingeprint login using local auth
                                Center(
                                  child: Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        //add icon for fingerprint
                                        !isLoading
                                            ? Icon(Icons.fingerprint, size: 20)
                                            : Container(),
                                        TextButton(
                                          onPressed: () {
                                            setState(() {
                                              isLoading = true;
                                            });
                                            //add fingerprint login
                                            if (isisBiometricAvailable) {
                                              try {
                                                Future.delayed(
                                                    Duration(
                                                        milliseconds: 1500),
                                                    () async {
                                                  setState(() {
                                                    isLoading = false;
                                                  });
                                                  if (await BiometricAuth
                                                      .authenticate()) {
                                                    GoRouter.of(context).go(
                                                      '/home',
                                                    );
                                                  }
                                                });
                                              } catch (e) {
                                                CustomStyledToast(
                                                    StylizedToast(
                                                      message: e.toString(),
                                                      image: AssetImage(
                                                          "assets/img/cancel.png"),
                                                    ),
                                                    context);
                                                setState(() {
                                                  isLoading = false;
                                                });
                                              }
                                            } else {
                                              Future.delayed(
                                                  Duration(milliseconds: 1000),
                                                  () {
                                                CustomStyledToast(
                                                    StylizedToast(
                                                      message:
                                                          "Fingerprint sensor not available on device",
                                                      image: AssetImage(
                                                          "assets/img/cancel.png"),
                                                    ),
                                                    context);
                                                setState(() {
                                                  isLoading = false;
                                                });
                                              });
                                            }
                                          },
                                          child: !isLoading
                                              ? Text(
                                                  "Login with Fingerprint",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyMedium!
                                                      .copyWith(
                                                          color:
                                                              Theme.of(context)
                                                                  .primaryColor,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 18),
                                                )
                                              : SpinKitThreeInOut(
                                                  color: Theme.of(context)
                                                      .primaryColor,
                                                  size: 30,
                                                ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 50,
                                ),

                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        FocusManager.instance.primaryFocus
                                            ?.unfocus();
                                        setState(() {
                                          _buttonWidth = _buttonHeight;
                                          isClicked = true;
                                        });
                                        // if (_formKey.currentState!.validate()) {

                                        if (_phoneController.text.isNotEmpty &&
                                            _pinController.text.isNotEmpty) {
                                          if (_phoneController.text.trim() ==
                                                  Credentials.mobile
                                                      .toString() &&
                                              _pinController.text.trim() ==
                                                  Credentials.pin.toString()) {
                                            navigateToHome();
                                          } else {
                                            Future.delayed(Duration(seconds: 1),
                                                () {
                                              CustomStyledToast(
                                                  StylizedToast(
                                                    message:
                                                        "Invalid Credentials",
                                                    image: AssetImage(
                                                        "assets/img/cancel.png"),
                                                  ),
                                                  context);

                                              setState(() {
                                                isClicked = false;
                                                _buttonWidth =
                                                    _deviceWidth * 0.8;
                                                // _screenHeight = h * 0.1;
                                              });
                                            });
                                          }
                                        } else {
                                          Future.delayed(
                                              Duration(milliseconds: 1000), () {
                                            CustomStyledToast(
                                                StylizedToast(
                                                  message:
                                                      "Please fill all the fields",
                                                  image: AssetImage(
                                                      "assets/img/cancel.png"),
                                                ),
                                                context);

                                            setState(() {
                                              isClicked = false;
                                              _buttonWidth = _deviceWidth * 0.8;
                                              // _screenHeight = h * 0.1;
                                            });
                                          });
                                        }
                                      },
                                      // }
                                      // child: AnimatedContainer(
                                      //   width: _deviceWidth,
                                      //   height: _screenHeight,
                                      //   duration: Duration(milliseconds: 500),
                                      //   curve: Curves.easeInOut,
                                      //   decoration: BoxDecoration(
                                      //     color: Theme.of(context)
                                      //         .colorScheme
                                      //         .onPrimary,
                                      //     // borderRadius:
                                      //     //     BorderRadius.circular(50),
                                      //   ),
                                      //   child: Image.asset(
                                      //       "assets/img/login_btn.png"),
                                      // ),
                                      child: AnimatedContainer(
                                        duration: Duration(milliseconds: 600),
                                        curve: Curves.easeInOutSine,
                                        width: _buttonWidth,
                                        height: _buttonHeight,
                                        decoration: BoxDecoration(
                                            color:
                                                Theme.of(context).primaryColor,
                                            borderRadius:
                                                BorderRadius.circular(50)),
                                        child: Center(
                                            child: isClicked
                                                ? SpinKitCircle(
                                                    color: Theme.of(context)
                                                        .colorScheme
                                                        .primary,
                                                    size: 50.0,
                                                  )
                                                : Text(
                                                    "Login",
                                                    style: TextStyle(
                                                      color: Theme.of(context)
                                                          .colorScheme
                                                          .primary,
                                                    ),
                                                  )),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                : Center(child: CircularProgressIndicator())
          ],
        ),
      ),
    );
  }
}

// Widget CustomAnimatedContainer(){}
