import 'package:bmi_cal/constanse.dart';
import 'package:bmi_cal/widgets/bottom_button.dart';
import 'package:bmi_cal/widgets/reUsable_container.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  const ResultPage(
      {super.key,
      required this.bmi,
      required this.bmiResult,
      required this.interpretation});

  final String bmi;
  final String bmiResult;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('BMI CALCULATOR'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Container(
                alignment: Alignment.bottomCenter,
                child: Text(
                  'Your Result',
                  style: kBMIResultText,
                ),
              ),
            ),
            Expanded(
                flex: 5,
                child: ReUsableContainer(
                  color: kInactiveCardColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        bmiResult,
                        style: kResultTextStyle,
                      ),
                      Text(bmi, style: kBMITextStyle),
                      Text(
                        interpretation,
                        textAlign: TextAlign.center,
                        style: kBodyTextStyle,
                      )
                    ],
                  ),
                )),
            Expanded(
                child: BottomButton(
                    onTap: () => Navigator.pop(context),
                    buttonTitle: 'RE-CALCULATE'))
          ],
        ));
  }
}
