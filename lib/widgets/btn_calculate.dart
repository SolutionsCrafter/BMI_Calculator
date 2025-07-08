import 'package:bmi_cal/constanse.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class btnCalculate extends StatelessWidget {
  const btnCalculate(
      {super.key, required this.onTap, required this.buttonTitle});

  final VoidCallback onTap;
  final String buttonTitle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: kButtonColor,
        height: kBottomNavigationBarHeight,
        width: double.infinity,
        margin: EdgeInsets.fromLTRB(0, 10, 0, 20),
        alignment: Alignment.center,
        child: Text(
          buttonTitle,
          style: kButtonText,
        ),
      ),
    );
  }
}
