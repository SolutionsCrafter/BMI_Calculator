import 'package:bmi_cal/widgets/btn_calculate.dart';
import 'package:flutter/material.dart';

class BottomButton extends StatelessWidget {
  const BottomButton(
      {super.key, required this.onTap, required this.buttonTitle});

  final VoidCallback onTap;
  final String buttonTitle;

  @override
  Widget build(BuildContext context) {
    return btnCalculate(
      onTap: onTap,
      buttonTitle: buttonTitle,
    );
  }
}
