import 'package:flutter/material.dart';

class IconContentWidget extends StatelessWidget {
  final IconData icon;
  final String text;
  const IconContentWidget({Key? key, required this.icon, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          // Icons.female,
          icon,
          size: 100.0,
        ),
        Text(text),
      ],
    );
  }
}
