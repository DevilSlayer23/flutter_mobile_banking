import 'package:flutter/material.dart';

class AnimatedElevatedButton extends StatefulWidget {
  final Color? color;

  final double? borderRadius;
  final VoidCallback? onPressed;
  final String? text;
  const AnimatedElevatedButton({
    Key? key,
    this.color,
    this.borderRadius,
    required this.onPressed,
    required this.text,
  }) : super(key: key);

  @override
  State<AnimatedElevatedButton> createState() => _AnimatedElevatedButtonState();
}

class _AnimatedElevatedButtonState extends State<AnimatedElevatedButton> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    double _height = 50;
    double _width = MediaQuery.of(context).size.width * 0.8;
//-------Animated Elevated Button--------
    return AnimatedContainer(
      width: _width,
      height: _height,
      duration: const Duration(milliseconds: 500),
      child: ElevatedButton(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
            widget.text ?? "Submit",
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
        style: Theme.of(context).elevatedButtonTheme.style,
        onPressed: () {
          setState(() {
            _width = _height;
            _isPressed = true;
          });
          widget.onPressed!();
          Future.delayed(Duration(seconds: 1), () {
            setState(() {
              _width = MediaQuery.of(context).size.width * 0.8;
              _isPressed = false;
            });
          });
        },
      ),
    );
  }
}
