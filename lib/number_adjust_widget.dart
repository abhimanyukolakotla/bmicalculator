import 'package:flutter/material.dart';

class NumberAdjustWidget extends StatelessWidget {
  final IconData icon;
  final Function? onPressed;
  const NumberAdjustWidget({Key? key, required this.icon, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: FloatingActionButton(
          // backgroundColor: Color(0xFF232324),
          // backgroundColor: const Color.fromRGBO(66, 66, 66, 1),
          foregroundColor: Colors.white,
          onPressed: () {
            onPressed?.call();
          },
          child: Icon(icon),
        ),
      ),
    );
  }
}
