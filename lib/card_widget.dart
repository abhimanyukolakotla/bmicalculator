import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  final Widget child;
  const CardWidget({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: const Color(0xFF0A0E21),
        margin: const EdgeInsets.all(10.0),
        child: child,
      ),
    );
  }
}
