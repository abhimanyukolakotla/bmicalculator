import 'package:flutter/material.dart';

import 'card_widget.dart';
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
                  child: SliderTheme(
                      data: SliderThemeData(
                          trackShape: CustomTrackShape(),
                          valueIndicatorTextStyle:
                              const TextStyle(fontSize: 40.0)),
                      child: const HeightSliderWidget()),
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

/// This is the stateful widget that the main application instantiates.
class HeightSliderWidget extends StatefulWidget {
  const HeightSliderWidget({Key? key}) : super(key: key);

  @override
  State<HeightSliderWidget> createState() => HeightSliderWidgetState();
}

/// This is the private State class that goes with MyStatefulWidget.
class HeightSliderWidgetState extends State<HeightSliderWidget> {
  double _currentSliderValue = 150;

  @override
  Widget build(BuildContext context) {
    return Slider(
      value: _currentSliderValue,
      min: 100,
      max: 300,
      divisions: 10,
      activeColor: Colors.white,
      inactiveColor: Colors.white,
      thumbColor: Colors.red,
      label: _currentSliderValue.round().toString(),
      onChanged: (double value) {
        setState(() {
          _currentSliderValue = value;
        });
      },
    );
  }
}

class CustomTrackShape extends RoundedRectSliderTrackShape {
  @override
  Rect getPreferredRect({
    required RenderBox parentBox,
    Offset offset = Offset.zero,
    required SliderThemeData sliderTheme,
    bool isEnabled = false,
    bool isDiscrete = false,
  }) {
    final double? trackHeight = sliderTheme.trackHeight! / 3;
    final double trackLeft = offset.dx + 20;
    final double trackTop =
        offset.dy + (parentBox.size.height - trackHeight!) / 2;
    final double trackWidth = parentBox.size.width - 40;
    return Rect.fromLTWH(trackLeft, trackTop, trackWidth, trackHeight);
  }
}
