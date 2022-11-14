import 'package:sahakari/services/API/api_helper.dart';
import 'package:sahakari/common/constant.dart';
import 'package:sahakari/views/components/reuseable_widgets.dart';
import 'package:sahakari/views/components/toast.dart';
import 'package:sahakari/views/screens/transaction/transaction_successfull.dart';
import 'package:flutter/material.dart';

class SendMoneyConfirmation extends StatefulWidget {
  final String receiver;
  final String amount;
  const SendMoneyConfirmation(
      {Key? key, required this.receiver, required this.amount})
      : super(key: key);

  @override
  _SendMoneyConfirmationState createState() => _SendMoneyConfirmationState();
}

class _SendMoneyConfirmationState extends State<SendMoneyConfirmation> {
  double charge = 5;
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return CustomScaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Text(
            "Send Money",
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: Theme.of(context).colorScheme.onPrimary,
                  fontWeight: FontWeight.bold,
                  // fontSize: 30,
                ),
          ),
        ),
        Center(
          child: Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Container(
              width: 300,
              height: 60,
              decoration: BoxDecoration(
                // border: Border.all(
                //   color: Colors.black,
                //   width: 1,
                // ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                  child: Text("Receiver : ${widget.receiver}",
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: Theme.of(context).colorScheme.onPrimary,
                            fontWeight: FontWeight.bold,
                            // fontSize: 30,
                          ))),
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Center(
          child: Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Container(
              width: 300,
              height: 60,
              decoration: BoxDecoration(
                // border: Border.all(
                //   color: Colors.black,
                //   width: 1,
                // ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                  child: Text(
                      "Amount: ${double.parse(widget.amount).toStringAsFixed(2)}    Charge:+${charge.toStringAsFixed(2)}     Total: ${(double.parse(widget.amount) + charge).toStringAsFixed(2)}",
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: Theme.of(context).colorScheme.onPrimary,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ))),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(50, 15, 50, 5),
          child: TextField(
            obscureText: true,
            decoration: InputDecoration(
              hintText: "******",
              labelText: "Enter Pin",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              prefixIcon: Icon(Icons.lock),
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Center(
          child: ElevatedButton(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(40, 15, 40, 15),
              child: Text('CONFIRM'),
            ),
            style: ElevatedButton.styleFrom(
              elevation: 10,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              primary: primaryColor,
            ),
            onPressed: () async {
              await sendmoney();
              // Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //         builder: (context) => TransactionSuccessful()));
            },
          ),
        )
      ],
    ));
  }

  Future<void> sendmoney() async {
    APIService api = APIService();
    bool ch = await api.SendMoney(
        widget.receiver, double.parse(widget.amount) + charge);
    if (ch) {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => TransactionSuccessful(
                    receiver: widget.receiver,
                    amount: double.parse(widget.amount) + charge,
                  )));
    } else {
      error_toast("Transaction Failed");
    }
  }
}
