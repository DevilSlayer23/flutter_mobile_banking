import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:sahakari/providers/login_provider.dart';
import 'package:sahakari/services/screen_size.dart';
import 'package:sahakari/views/components/custom_scaffold.dart';
import 'package:sahakari/views/components/custom_shape.dart';

import 'package:flutter/material.dart';
import 'package:sahakari/services/validators.dart';

class LoginScreenNew extends StatefulWidget {
  const LoginScreenNew({Key? key}) : super(key: key);

  @override
  _LoginScreenNewState createState() => _LoginScreenNewState();
}

class _LoginScreenNewState extends State<LoginScreenNew>
    with TickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  late AnimationController _animationController;
  late Animation<Color?> _animation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    )..addListener(() {
        setState(() {});
      });
    _animation = ColorTween(
      begin: Colors.black87,
      end: Colors.lightGreen,
    ).animate(_animationController);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<LoginProvider>(context, listen: false).isBiometricAvailable();
      // Provider.of<LoginProvider>(context, listen: false).loadDeviceDimensions();
    });
  }

  @override
  void dispose() {
    Provider.of<LoginProvider>(context, listen: false).disposeControllers();
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    loginProvider({bool listen = true}) =>
        Provider.of<LoginProvider>(context, listen: listen);
    return CustomScaffoldNew(
      leadingWidget: [
        IconButton(
          icon: const Icon(Icons.login),
          onPressed: () {},
        ),
        SizedBox(
          width: 10,
        ),
        Text(
          'Login',
          style: Theme.of(context).textTheme.titleSmall,
        ),
      ],
      body: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(10),
              ),
              width: Responsive.getWidth(context) * 0.8,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black54.withOpacity(0.5),
                                  spreadRadius: 0.5,
                                  blurRadius: 3,
                                  offset:
                                      Offset.zero, // changes position of shadow
                                ),
                              ]),
                          child: TextFormField(
                            // initialValue: "+977 980000000",
                            keyboardType: TextInputType.phone,
                            controller:
                                loginProvider(listen: false).phoneController,
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge
                                ?.copyWith(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  color:
                                      Theme.of(context).colorScheme.onPrimary,
                                ),
                            // initialValue: countryCode,
                            // validator: (value) =>
                            //     Validator.validatePhone(value!),
                            // autovalidateMode:
                            //     AutovalidateMode.onUserInteraction,
                            decoration: InputDecoration(
                              hintText: "+977 9812345678",
                              prefixIcon: Icon(
                                Icons.phone,
                                color: Theme.of(context).colorScheme.onPrimary,
                              ),
                            ),
                          ),
                        ),
                        // SizedBox(
                        //   height: 20,
                        // ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black54.withOpacity(0.5),
                                  spreadRadius: 0.5,
                                  blurRadius: 3,
                                  offset:
                                      Offset.zero, // changes position of shadow
                                ),
                              ]),
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            controller: Provider.of<LoginProvider>(context,
                                    listen: false)
                                .pinController,
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge
                                ?.copyWith(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    color: Theme.of(context).primaryColorDark),
                            // validator: ((value) =>
                            //     Validator.validatePin(value!)),
                            // autovalidateMode:
                            //     AutovalidateMode.onUserInteraction,
                            obscureText:
                                loginProvider().showPassword ? false : true,
                            decoration: InputDecoration(
                                hintText: "Enter Pin",
                                prefixIcon: Icon(
                                  Icons.password,
                                  color:
                                      Theme.of(context).colorScheme.onPrimary,
                                ),
                                suffixIcon: IconButton(
                                    icon: loginProvider(listen: false)
                                            .showPassword
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
                                    onPressed: () => Provider.of<LoginProvider>(
                                            context,
                                            listen: false)
                                        .changeShowPasswordStatus())),
                            // onChanged: ((value) => debugPrint(value)),
                          ),
                        ),
                        //add a biometric fingeprint login using local auth
                        SizedBox(
                          height: Responsive.getHeight(context) * 0.05,
                        ),
                        SizedBox(
                          width: Responsive.getWidth(context) * 0.9,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Checkbox(
                                onChanged: (bool? value) {},
                                value: false,
                              ),
                              Text("Remember me"),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: Responsive.getHeight(context) * 0.05,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            InkWell(
                              onTap: () {
                                FocusManager.instance.primaryFocus?.unfocus();
                                loginProvider(listen: false).onLogin(context);
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
                                width: loginProvider(listen: false).isClicked
                                    ? 50
                                    : Responsive.getWidth(context) * 0.9,
                                height: 50,
                                decoration: BoxDecoration(
                                  color: Theme.of(context).primaryColor,
                                  borderRadius:
                                      loginProvider(listen: false).isClicked
                                          ? BorderRadius.circular(50)
                                          : BorderRadius.circular(10),
                                ),
                                child: Center(
                                  child: loginProvider(listen: false).isClicked
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
                                        ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Center(
                          child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  //add icon for fingerprint
                                  InkWell(
                                      child: Icon(
                                        Icons.fingerprint,
                                        size: 40,
                                        color: _animation.value,
                                      ),
                                      onTap: () {
                                        if (_animationController.value == 1) {
                                          _animationController.reverse();
                                        } else {
                                          _animationController.forward();
                                        }

                                        loginProvider(listen: false)
                                            .onFingerPrintTap(context);
                                        Future.delayed(Duration(seconds: 2),
                                            () {
                                          _animationController.reverse();
                                        });
                                      }),
                                ],
                              )),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}


// Widget CustomAnimatedContainer(){}
