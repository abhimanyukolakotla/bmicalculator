import 'package:bmicalculator/age_incrementor_widget.dart';
import 'package:bmicalculator/gender_enum.dart';
import 'package:flutter/material.dart';

import 'card_widget.dart';
import 'constants.dart';
import 'height_slider_widget.dart';
import 'icon_content_widget.dart';
import 'weight_incrementor_widget.dart';

//0xFF1D1E33
class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender? selected;
  int height = 0;
  int weight = 0;
  int age = 0;

  onWeightChange(int value) {
    weight = value;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Expanded(
            flex: 3,
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selected = Gender.male;
                      });
                    },
                    child: CardWidget(
                      color: selected == Gender.male
                          ? kActiveCardColor
                          : kInactiveCardColor,
                      child: const IconContentWidget(
                          icon: Icons.male, text: "MALE"),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selected = Gender.female;
                      });
                    },
                    child: CardWidget(
                      color: selected == Gender.female
                          ? kActiveCardColor
                          : kInactiveCardColor,
                      child: const IconContentWidget(
                          icon: Icons.female, text: "FEMALE"),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 3,
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
                            overlayColor: kOverlayColor,
                            overlayShape: const RoundSliderOverlayShape(
                                overlayRadius: 30.0),
                            valueIndicatorTextStyle:
                                const TextStyle(fontSize: 40.0),
                          ),
                          child: HeightSliderWidget(onChanged: (value) {
                            height = value;
                          }),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 3,
            child: Row(
              children: [
                Expanded(
                    child: CardWidget(
                        child: WeightIncrementorWidget(
                            onChanged: onWeightChange))),
                Expanded(
                  child: CardWidget(child: AgeIncrementorWidget()),
                )
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(kSecondaryColor),
                    ),
                    onPressed: () => showDialog<String>(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                        backgroundColor: kInactiveCardColor,
                        title: const Text(
                          'BMI Calculator',
                        ),
                        content: Text(
                          'Your BMI is ${((weight / (height * height)) * 10000).toStringAsFixed(2)}',
                          style: const TextStyle(fontSize: 30.0),
                        ),
                        actions: <Widget>[
                          ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(kSecondaryColor),
                            ),
                            onPressed: () => Navigator.pop(context, 'OK'),
                            child: const Text(
                              'OK',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                    child: const Center(
                      child: Text(
                        "CALCULATE",
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
