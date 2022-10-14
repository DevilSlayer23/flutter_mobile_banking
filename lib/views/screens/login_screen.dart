import 'package:sahakari/views/components/local_auth.dart';
import 'package:sahakari/views/components/bottom_nav.dart';
import 'package:sahakari/common/constant.dart';
import 'package:sahakari/views/components/stylized_toast.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  BuildContext get _context => this.context;
  // late String pin, phoneNumber;
  bool isClicked = false;
  late bool isLoading, isInit = false;
  bool isBiometricAvailable = false;
  bool isAuthenticated = false, showPassword = false;
  late double _height, _width;
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _pinController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _phoneController.text = '+977';
    get();
    biometricAvailable();
    _height =
        MediaQueryData.fromWindow(WidgetsBinding.instance.window).size.height *
            0.4;
    _width =
        MediaQueryData.fromWindow(WidgetsBinding.instance.window).size.width *
            0.8;
  }

  @override
  void dispose() {
    _phoneController.dispose();
    _pinController.dispose();
    super.dispose();
  }

  Future<void> get() async {
    setState(() {
      isLoading = false;
      isInit = true;
    });
  }

  Future<void> navigateToHome() async {
    print('[navigate to home invoked]');
    await Future.delayed(Duration(seconds: 2), () {
      context.go('/home');
      // Navigator.pushNamed(context, '/home');
    });
  }

  biometricAvailable() async {
    bool biometricAvailable = await BiometricAuth.biometricAvailable();
    if (mounted) {
      setState(() {
        isBiometricAvailable = biometricAvailable;
      });
      print(isBiometricAvailable);
    }
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
                height: h,
                width: w,
                child: Image.asset("assets/img/bck_r.png")),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  alignment: Alignment.topRight,
                  width: double.infinity,
                  height: 300,
                  child: Stack(
                    children: [
                      Image.asset("assets/img/vector_1_r.png"),
                      Image.asset("assets/img/vector_2_r.png"),
                    ],
                  ),
                )
              ],
            ),
            isInit
                ? Container(
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
                          color: Colors.white,
                          child: Form(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Text(
                                    "Log In",
                                    style: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(30, 5, 30, 20),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Phone Number",
                                        style: TextStyle(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .onPrimary,
                                            fontSize: 18),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      TextFormField(
                                        // initialValue: "+977 980000000",
                                        keyboardType: TextInputType.phone,
                                        controller: _phoneController,
                                        decoration: InputDecoration(
                                          hintText: "+977 9812345678",
                                          border: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Colors.black87,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(50),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Colors.black87,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(50),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                // SizedBox(
                                //   height: 20,
                                // ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(30, 5, 30, 5),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Enter Pin",
                                        style: TextStyle(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .onPrimary,
                                            fontSize: 18),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      TextFormField(
                                        keyboardType: TextInputType.number,
                                        controller: _pinController,
                                        obscureText:
                                            showPassword ? false : true,
                                        decoration:
                                            InputDecoration(
                                            border: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Colors.black87,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(50),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Colors.black87,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(50)),
                                            hintText: "******",
                                            suffixIcon: IconButton(
                                                icon: showPassword
                                                    ? Icon(Icons.visibility_off)
                                                    : Icon(Icons.visibility),
                                                onPressed: (() => setState(() {
                                                      showPassword =
                                                          !showPassword;
                                                    })))

                                            // onChanged: ((value) => print(value)),
                                            ),
                                      )
                                    ],
                                  
                      
                                  ),
                                ),
                                //add a biometric fingeprint login using local auth
                                Center(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        //add icon for fingerprint
                                        Icon(Icons.fingerprint),
                                        TextButton(
                                          onPressed: () {
                                            //add fingerprint login
                                            if (isBiometricAvailable) {
                                              try {
                                                Future.delayed(
                                                    Duration(
                                                        milliseconds: 3000),
                                                    () async {
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
                                                        message: e.toString()),
                                                    context);
                                              }
                                            } else {
                                              CustomStyledToast(
                                                  StylizedToast(
                                                      message:
                                                          "Biometric not available"),
                                                  context);
                                            }
                                          },
                                          child: Text(
                                            "Login with Fingerprint",
                                            style: TextStyle(
                                                color: Colors.blue.shade900),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
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
                                          _width = w * 0.6;
                                          _height = h * 0.4;
                                        });
                                        
                                        if (_phoneController.text.isNotEmpty ||
                                            _pinController.text.isNotEmpty) {
                                          if (_phoneController.text.trim() ==
                                                  Credentials.mobile
                                                      .toString() &&
                                              _pinController.text.trim() ==
                                                  Credentials.pin.toString()) {
                                            navigateToHome();
                                          } else {
                                            CustomStyledToast(
                                                StylizedToast(
                                                    message:
                                                        "Invalid Credentials"),
                                                context);
                                            Future.delayed(Duration(seconds: 1),
                                                () {
                                              setState(() {
                                                _width = w * 0.8;
                                                _height = h * 0.4;
                                              });
                                            });
                                          }
                                        } else {
                                          CustomStyledToast(
                                              StylizedToast(
                                                  message:
                                                      "Please fill all the fields"),
                                              context);
                                          Future.delayed(Duration(seconds: 1),
                                              () {
                                            setState(() {
                                              _width = w * 0.8;
                                              _height = h * 0.4;
                                            });
                                          });
                                        }
                                      },
                                      child: AnimatedContainer(
                                        width: _width,
                                        height: _height,
                                        decoration: BoxDecoration(
                                            borderRadius: isClicked
                                                ? BorderRadius.circular(50)
                                                : BorderRadius.circular(25)),
                                        // duration: Duration(seconds: 1),
                                        duration: Duration(milliseconds: 500),
                                        child: Image.asset(
                                            "assets/img/login_btn.png"),
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