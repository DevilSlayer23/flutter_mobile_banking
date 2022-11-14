import 'package:sahakari/views/components/animated_button.dart';
import 'package:sahakari/views/components/reuseable_widgets.dart';
import 'package:flutter/material.dart';

class CashOutScreen extends StatefulWidget {
  const CashOutScreen({Key? key}) : super(key: key);

  @override
  _CashOutScreenState createState() => _CashOutScreenState();
}

class _CashOutScreenState extends State<CashOutScreen> {
  String agent = "";
  String pin = "";
  double amount = 0.0;

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
            padding: const EdgeInsets.all(25),
            child: Text(
              "Cash Out",
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
              onChanged: (val) {
                agent = val;
              },
              decoration: InputDecoration(
                hintText: "017xxxxxxxx",
                labelText: "Enter Agent Number",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50.0),
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
              onChanged: (val) {
                amount = double.parse(val);
              },
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
          Padding(
            padding: const EdgeInsets.only(left: 25, right: 25, bottom: 15),
            child: TextFormField(
              keyboardType: TextInputType.number,
              onChanged: (val) {
                pin = val;
              },
              obscureText: true,
              decoration: InputDecoration(
                hintText: "******",
                labelText: "Enter Pin",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                prefixIcon: Icon(Icons.lock),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Center(
            child: AnimatedElevatedButton(onPressed: () {}, text: 'Cash Out'),
          )
        ],
      ),
    );
  }
}
