import 'dart:async';

import 'package:go_router/go_router.dart';
import 'package:logger/logger.dart';
import 'package:sahakari/models/profile.dart';
import 'package:sahakari/common/constant.dart';
import 'package:sahakari/common/routes/routes.dart';
import 'package:sahakari/views/components/animated_button.dart';
import 'package:sahakari/views/components/reuseable_widgets.dart';
import 'package:sahakari/views/components/stylized_toast.dart';
import 'package:sahakari/views/components/toast.dart';
import 'package:flutter/material.dart';

class SendMoneyScreen extends StatefulWidget {
  // final Profile profile;
  final int id;
  const SendMoneyScreen({Key? key, required this.id}) : super(key: key);

  @override
  _SendMoneyScreenState createState() => _SendMoneyScreenState();
}

class _SendMoneyScreenState extends State<SendMoneyScreen> {
  final _log = Logger(
    printer: PrettyPrinter(
      methodCount: 3,
      errorMethodCount: 8,
      lineLength: 120,
      colors: true,
      printEmojis: true,
      printTime: true,
    ),
  );

  final _formKey = GlobalKey<FormState>();
  late Profile _profile;
  TextEditingController _amountController = TextEditingController();
  TextEditingController _mobileController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _profile = getProfile(widget.id);
    print('[PROFILE ] ${_profile.firstName}');
  }

  void SendMoney(String reciever, String amount) async {
    await runZonedGuarded(() {
      //regex for mobile number
      RegExp regex =
          RegExp(r"^\+?(977)[\s]?([0-9]{2})[\s]?([0-9]{3})[\s]?([0-9]{5})$");
      if (amount.isNotEmpty && reciever.isNotEmpty) {
        if (double.parse(amount) > _profile.activeBalance) {
          CustomStyledToast(
              StylizedToast(message: "Insufficient Balance"), context);
        } else if (!regex.hasMatch(reciever)) {
          _log.i('[Invalid Mobile Number Regex]');
          CustomStyledToast(
              StylizedToast(message: "Enter a Valid Phone Number"), context);
        } else {
          print('[Send Money] $reciever $amount');
          context.goNamed(Routes.sendMoneyConfirmation, params: {
            'amount': amount,
            'reciever': reciever,
          });
        }
      } else {
        print("Empty fields");
        CustomStyledToast(
            StylizedToast(message: "Fields Can't be Empty"), context);
      }
    }, (error, stackTrace) {
      _log.e("[Send Money Screen]:", error, stackTrace);
    },
        zoneSpecification: ZoneSpecification(
          handleUncaughtError: ((self, parent, zone, error, stackTrace) {
            _log.v("[ZONE]: $zone && [Parent]: $parent", error, stackTrace);
          }),
          print: (self, parent, zone, line) {
            parent.print(zone, "[Send Money Screen]: $line");
          },
        ),
        zoneValues: {
          "name": "Send Money Screen",
        });
  }

  Profile getProfile(int id) {
    return profiles.where((element) => element.id == id).first;
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return CustomScaffold(
      body: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25, right: 25, bottom: 15),
              child: Text(
                "Send Money",
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      color: Theme.of(context).colorScheme.onPrimary,
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25, right: 25, bottom: 15),
              child: TextFormField(
                keyboardType: TextInputType.phone,
                controller: _mobileController,
                decoration: InputDecoration(
                  hintText: "88017xxxxxxxx",
                  labelText: "Enter Receiver Number",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  prefixIcon: Icon(Icons.phone_android),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 25,
                right: 25,
                bottom: 10,
              ),
              child: TextFormField(
                keyboardType: TextInputType.number,
                controller: _amountController,
                decoration: InputDecoration(
                  hintText: "1000",
                  labelText: "Enter Amount",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  prefixIcon: Icon(Icons.attach_money),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(25),
              child: Text(
                "Available Balance: ${_profile.activeBalance.toStringAsFixed(2)}",
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: Theme.of(context).colorScheme.onPrimary,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Center(
              child: AnimatedElevatedButton(
                onPressed: () async {
                  print("[Mobile Controller]  ${_mobileController.text}");
                  // print(_amountController.text.runtimeType);
                  print(_amountController.text);

                  SendMoney(_mobileController.text.trim(),
                      _amountController.text.trim());
                },
                text: "Send Money",
              ),
            )
          ],
        ),
      ),
    );
  }
}
