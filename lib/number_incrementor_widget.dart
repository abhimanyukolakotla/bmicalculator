import 'package:flutter/material.dart';

import 'number_adjust_widget.dart';

class NumberIncrementorWidget extends StatefulWidget {
  const NumberIncrementorWidget({Key? key}) : super(key: key);

  @override
  State<NumberIncrementorWidget> createState() =>
      NumberIncrementorWidgetState();
}

class NumberIncrementorWidgetState extends State<NumberIncrementorWidget> {
  int _counter = 0;

  increment() {
    setState(() {
      _counter += 1;
    });
  }

  decrement() {
    setState(() {
      if (_counter > 0) _counter -= 1;
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
