import 'package:bmicalculator/sex_code.dart';
import 'package:flutter/material.dart';

import 'card_widget.dart';
import 'height_slider_widget.dart';
import 'icon_content_widget.dart';
import 'number_incrementor_widget.dart';

const Color activeCardColor = Color(0xFF595B6C);
const Color inactiveCardColor = Color(0XFF111328);

//0xFF1D1E33
class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleCardColor = inactiveCardColor;
  Color femaleCardColor = inactiveCardColor;

  updateCardColor(SexCode gender) {
    if (gender == SexCode.male) {
      maleCardColor = activeCardColor;
      femaleCardColor = inactiveCardColor;
    } else {
      maleCardColor = inactiveCardColor;
      femaleCardColor = activeCardColor;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        updateCardColor(SexCode.male);
                      });
                    },
                    child: CardWidget(
                      color: maleCardColor,
                      child: const IconContentWidget(
                          icon: Icons.male, text: "Male"),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        updateCardColor(SexCode.female);
                      });
                    },
                    child: CardWidget(
                      color: femaleCardColor,
                      child: const IconContentWidget(
                          icon: Icons.female, text: "Female"),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: CardWidget(
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
                            child: const HeightSliderWidget()),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: const [
                Expanded(child: CardWidget(child: NumberIncrementorWidget())),
                Expanded(child: CardWidget(child: Text("age"))),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
