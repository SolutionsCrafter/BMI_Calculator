import "package:bmi_cal/constanse.dart";
import "package:flutter/material.dart";

class ContainerContent extends StatelessWidget {
  final IconData? genderIcon;
  final String label;

  const ContainerContent({super.key, this.genderIcon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          genderIcon,
          size: 80.0,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          label,
          style: kLabelText,
        )
      ],
    );
  }
}
