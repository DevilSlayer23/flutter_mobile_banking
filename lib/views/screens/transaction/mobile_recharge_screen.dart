import 'package:sahakari/common/constant.dart';
import 'package:sahakari/views/components/animated_button.dart';
import 'package:sahakari/views/components/reuseable_widgets.dart';
import 'package:flutter/material.dart';

import 'mobile_recharge_confirmation.dart';

class MobileRechargeScreen extends StatefulWidget {
  const MobileRechargeScreen({Key? key}) : super(key: key);

  @override
  _MobileRechargeScreenState createState() => _MobileRechargeScreenState();
}

class _MobileRechargeScreenState extends State<MobileRechargeScreen> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 150,
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              "Mobile Recharge",
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    color: Theme.of(context).colorScheme.onPrimary,
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25, right: 25, bottom: 15),
            child: TextFormField(
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                hintText: "017xxxxxxxx",
                labelText: "Enter Mobile Number",
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
            child: TextField(
              keyboardType: TextInputType.number,
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
          SizedBox(
            height: 10,
          ),
          // Padding(
          //   padding: const EdgeInsets.only(left: 25, right: 25, bottom: 15),
          //   child: TextField(
          //     obscureText: true,
          //     decoration: InputDecoration(
          //       hintText: "******",
          //       labelText: "Pin",
          //     ),
          //   ),
          // ),
          SizedBox(
            height: 20,
          ),
          Center(
              child: AnimatedElevatedButton(
            onPressed: () {},
            text: 'Recharge',
          ))
        ],
      ),
    );
  }
}
