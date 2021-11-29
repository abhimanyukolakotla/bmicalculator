import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  final Widget child;
  final Color? color;
  const CardWidget({Key? key, this.color, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        color: color ?? const Color(0xFF0A0E21),
      ),
      child: child,
    );
  }
}
