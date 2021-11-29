import 'package:flutter/material.dart';

import 'number_adjust_widget.dart';

class WeightIncrementorWidget extends StatefulWidget {
  final Function? onChanged;
  const WeightIncrementorWidget({Key? key, this.onChanged}) : super(key: key);

  @override
  State<WeightIncrementorWidget> createState() =>
      WeightIncrementorWidgetState();
}

class WeightIncrementorWidgetState extends State<WeightIncrementorWidget> {
  int _counter = 50;

  @override
  initState() {
    super.initState();
    widget.onChanged!(_counter);
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
              "Weight",
              style: TextStyle(fontSize: 20.0),
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
                child: const Text(
                  "kgs",
                  style: TextStyle(
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
