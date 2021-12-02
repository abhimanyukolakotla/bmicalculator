import 'package:flutter/material.dart';

class NumberAdjustWidgetStateful extends StatefulWidget {
  final IconData icon;
  final Function? onPressed;
  const NumberAdjustWidgetStateful(
      {Key? key, required this.icon, this.onPressed})
      : super(key: key);

  @override
  _NumberAdjustWidgetStatefulState createState() =>
      _NumberAdjustWidgetStatefulState();
}

class _NumberAdjustWidgetStatefulState
    extends State<NumberAdjustWidgetStateful> {
  bool? isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        width: 56.0,
        height: 56.0,
        clipBehavior:
            Clip.hardEdge, // to restrict ripple to be inside the container
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(56),
          ),
        ),
        child: Material(
          child: InkWell(
            child: Icon(
              widget.icon,
            ),
          ),
        ),
      ),
      onLongPressStart: (_) async {
        isPressed = true;
        do {
          widget.onPressed?.call();
          await Future.delayed(const Duration(milliseconds: 100));
        } while (isPressed == true);
      },
      onLongPressEnd: (_) => setState(() => isPressed = false),
      onTap: () {
        widget.onPressed?.call();
      },
    );
  }
}
