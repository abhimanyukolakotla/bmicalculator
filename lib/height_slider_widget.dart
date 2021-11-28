import 'package:flutter/material.dart';

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
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                "${_currentSliderValue.toInt()}",
                style: const TextStyle(
                  fontSize: 40.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 4.0, bottom: 6.0),
                child: const Text(
                  "cms",
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          Slider(
            value: _currentSliderValue,
            min: 100,
            max: 300,
            divisions: 200,
            activeColor: Colors.white,
            inactiveColor: Colors.white,
            thumbColor: Colors.red,
            label: _currentSliderValue.round().toString(),
            onChanged: (double value) {
              setState(() {
                _currentSliderValue = value;
              });
            },
          ),
        ],
      ),
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
        offset.dy; //+ (parentBox.size.height - trackHeight!);
    final double trackWidth = parentBox.size.width - 40;
    return Rect.fromLTWH(trackLeft, trackTop, trackWidth, trackHeight!);
  }
}
