import 'package:flutter/material.dart';

class ErrorScreen extends StatelessWidget {
  //create a constructor to pass the error
  final String error;
  const ErrorScreen({required this.error});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            "assets/img/Error.png",
            fit: BoxFit.cover,
          ),
          Positioned(
            bottom: MediaQuery.of(context).size.height * 0.1,
            left: MediaQuery.of(context).size.width * 0.3,
            right: MediaQuery.of(context).size.width * 0.3,
            child: Container(
              padding: EdgeInsets.all(20),
              // decoration: BoxDecoration(
              //   boxShadow: [
              //     BoxShadow(
              //       offset: Offset(0, 0),
              //       blurRadius: 50,
              //       color: Theme.of(context).primaryColor,
              //     ),
              //   ],
              // ),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    backgroundColor: Theme.of(context).primaryColor),
                onPressed: () {},
                child: Text(
                  error,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
              ),
          ),
        ],
      ),
    );
  }
}
