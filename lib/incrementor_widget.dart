import 'package:flutter/material.dart';

import 'number_adjust_widget.dart';

class IncrementorWidget extends StatefulWidget {
  final Function? onChanged;
  final String label;
  final String units;
  const IncrementorWidget(
      {Key? key, required this.label, required this.units, this.onChanged})
      : super(key: key);

  @override
  State<IncrementorWidget> createState() => IncrementorWidgetState();
}

class IncrementorWidgetState extends State<IncrementorWidget> {
  int _counter = 30;

  @override
  initState() {
    super.initState();
    if (widget.onChanged != null) widget.onChanged!(_counter);
  }

  increment() {
    setState(() {
      _counter += 1;
      updateWidget();
    });
  }

  decrement() {
    setState(() {
      if (_counter > 0) _counter -= 1;
      updateWidget();
    });
  }

  updateWidget() {
    if (widget.onChanged != null) {
      widget.onChanged!(_counter);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          flex: 1,
          child: Center(
            child: Text(
              widget.label,
              style: const TextStyle(fontSize: 20.0),
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(
                "$_counter",
                style: const TextStyle(
                  fontSize: 40.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 4.0, bottom: 6.0),
                child: Text(
                  widget.units,
                  style: const TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            ],
          ),
        ),
        Expanded(
          flex: 2,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              NumberAdjustWidget(
                icon: Icons.add,
                onPressed: increment,
              ),
              const SizedBox(width: 10.0),
              NumberAdjustWidget(
                icon: Icons.remove,
                onPressed: decrement,
              ),
            ],
          ),
        )
      ],
    );
  }
}
