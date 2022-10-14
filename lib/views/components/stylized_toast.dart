import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';

class StylizedToast extends StatefulWidget {
  final String message;
  const StylizedToast({Key? key, required this.message}) : super(key: key);

  @override
  State<StylizedToast> createState() => _StylizedToastState();
}

class _StylizedToastState extends State<StylizedToast> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: Colors.redAccent,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.close),
          SizedBox(
            width: 12.0,
          ),
          Text(widget.message),
        ],
      ),
    );
  }
}

CustomStyledToast(Widget body, BuildContext context) => showToastWidget(
      body,
      context: context,
      duration: Duration(seconds: 2),
      position: StyledToastPosition.bottom,
      animation: StyledToastAnimation.fadeScale,
      reverseAnimation: StyledToastAnimation.fadeScale,
      curve: Curves.fastOutSlowIn,
      reverseCurve: Curves.linear,
    );
