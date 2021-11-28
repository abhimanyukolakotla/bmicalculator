import 'package:flutter/material.dart';

import 'card_widget.dart';
import 'height_slider_widget.dart';
import 'icon_content_widget.dart';

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Expanded(
            child: Row(
              children: const [
                CardWidget(
                  child: IconContentWidget(icon: Icons.male, text: "Male"),
                ),
                CardWidget(
                  child: IconContentWidget(icon: Icons.female, text: "Female"),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                CardWidget(
                  child: Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "Height",
                          style: TextStyle(fontSize: 20.0),
                        ),
                      ),
                      SliderTheme(
                          data: SliderThemeData(
                            trackShape: CustomTrackShape(),
                            valueIndicatorTextStyle:
                                const TextStyle(fontSize: 40.0),
                          ),
                          child: HeightSliderWidget()),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: const [
                CardWidget(child: Text("weight")),
                CardWidget(child: Text("age")),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
