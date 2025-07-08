import 'package:bmi_cal/calculator_brain.dart';
import 'package:bmi_cal/constanse.dart';
import 'package:bmi_cal/screens/result_pagr.dart';
import 'package:bmi_cal/widgets/bottom_button.dart';
import 'package:bmi_cal/widgets/container_content.dart';
import 'package:bmi_cal/widgets/reUsable_container.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum GenderType { male, female }

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  GenderType? selectedGender;
  int height = 187;
  int weight = 75;
  int age = 25;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'BMI CALCULATOR',
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                    child: ReUsableContainer(
                  color: selectedGender == GenderType.male
                      ? kActiveCardColor
                      : kInactiveCardColor,
                  cardChild: ContainerContent(
                      genderIcon: FontAwesomeIcons.mars, label: "MALE"),
                  onPress: () {
                    setState(() {
                      selectedGender = GenderType.male;
                    });
                  },
                )),
                Expanded(
                    child: ReUsableContainer(
                  color: selectedGender == GenderType.female
                      ? kActiveCardColor
                      : kInactiveCardColor,
                  cardChild: ContainerContent(
                      genderIcon: FontAwesomeIcons.venus, label: "FEMALE"),
                  onPress: () {
                    setState(() {
                      selectedGender = GenderType.female;
                    });
                  },
                )),
              ],
            ),
          ),
          Expanded(
            child: Expanded(
                child: ReUsableContainer(
              color: kInactiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'HEIGHT',
                    style: kLabelText,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        height.toString(),
                        style: kHeightText,
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      Text(
                        'cm',
                        style: kLabelText,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: kGWhiteColor,
                      inactiveTrackColor: kGrayColor,
                      thumbShape:
                          RoundSliderThumbShape(enabledThumbRadius: 14.0),
                      overlayShape:
                          RoundSliderOverlayShape(overlayRadius: 24.0),
                      thumbColor: kButtonColor,
                      overlayColor: kButtonColor.withValues(alpha: 0.2),
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      onChanged: (double selectedHeight) {
                        setState(() {
                          height = selectedHeight.round();
                        });
                      },
                      min: 120.0,
                      max: 220.0,
                    ),
                  ),
                ],
              ),
            )),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                    child: ReUsableContainer(
                  color: kInactiveCardColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "WEIGHT",
                        style: kLabelText,
                      ),
                      Text(
                        weight.toString(),
                        style: kHeightText,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundIconButton(
                            icon: FontAwesomeIcons.minus,
                            onPress: () {
                              setState(() {
                                weight--;
                              });
                            },
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          RoundIconButton(
                            icon: FontAwesomeIcons.plus,
                            onPress: () {
                              setState(() {
                                weight++;
                              });
                            },
                          )
                        ],
                      )
                    ],
                  ),
                )),
                Expanded(
                    child: ReUsableContainer(
                  color: kInactiveCardColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "AGE",
                        style: kLabelText,
                      ),
                      Text(
                        age.toString(),
                        style: kHeightText,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundIconButton(
                            icon: FontAwesomeIcons.minus,
                            onPress: () {
                              setState(() {
                                age--;
                              });
                            },
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          RoundIconButton(
                            icon: FontAwesomeIcons.plus,
                            onPress: () {
                              setState(() {
                                age++;
                              });
                            },
                          )
                        ],
                      )
                    ],
                  ),
                )),
              ],
            ),
          ),
          BottomButton(
            onTap: () {
              CalculatorBrain calbrain =
                  CalculatorBrain(height: height, weight: weight);

              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ResultPage(
                            bmi: calbrain.calculateBMI(),
                            bmiResult: calbrain.getResult(),
                            interpretation: calbrain.getInterpretation(),
                          )));
            },
            buttonTitle: 'CALCULATE',
          )
        ],
      ),
    );
  }
}

// Coustom Icon Widget
class RoundIconButton extends StatelessWidget {
  const RoundIconButton({super.key, required this.icon, required this.onPress});

  final IconData icon;
  final VoidCallback? onPress;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
        constraints: BoxConstraints.tightFor(width: 56, height: 56),
        shape: CircleBorder(),
        fillColor: Color(0xFF4C4F5E),
        elevation: 0.0,
        onPressed: onPress,
        child: Icon(icon));
  }
}
