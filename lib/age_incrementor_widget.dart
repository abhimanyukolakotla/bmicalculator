import 'package:flutter/material.dart';

import 'number_adjust_widget.dart';

class AgeIncrementorWidget extends StatefulWidget {
  final Function? onChanged;
  const AgeIncrementorWidget({Key? key, final this.onChanged})
      : super(key: key);

  @override
  State<AgeIncrementorWidget> createState() => AgeIncrementorWidgetState();
}

class AgeIncrementorWidgetState extends State<AgeIncrementorWidget> {
  int _counter = 30;

  @override
  initState() {
    super.initState();
    if (widget.onChanged != null) widget.onChanged!(_counter);
  }

  increment() {
    setState(() {
      _counter += 1;
      widget.onChanged!(_counter);
    });
  }

  decrement() {
    setState(() {
      if (_counter > 0) _counter -= 1;
      widget.onChanged!(_counter);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Expanded(
          flex: 1,
          child: Center(
            child: Text(
              "Age",
              style: TextStyle(fontSize: 20.0),
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "$_counter",
                style: const TextStyle(
                  fontSize: 40.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
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
