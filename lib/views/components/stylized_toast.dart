import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';

class StylizedToast extends StatefulWidget {
  final String message;
  ImageProvider? image;
  Color? color;
  StylizedToast({Key? key, required this.message, this.image, this.color})
      : super(key: key);

  @override
  State<StylizedToast> createState() => _StylizedToastState();
}

class _StylizedToastState extends State<StylizedToast> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        // backgroundBlendMode: BlendMode.softLight,
        color: widget.color ?? Colors.red.withOpacity(0.7),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 24,
            padding: const EdgeInsets.all(8.0),
            height: 24,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: widget.image ?? AssetImage("assets/img/cancel.png"),
                fit: BoxFit.contain,
              ),
            ),
          ),
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
