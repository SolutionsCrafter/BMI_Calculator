import 'dart:math';

class CalculatorBrain {
  CalculatorBrain({required this.height, required this.weight});

  final int height;
  final int weight;

  late final double _bmi = weight / pow(height / 100, 2);

  String calculateBMI() {
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 25) {
      return 'Overweight';
    } else if (_bmi > 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  String getInterpretation() {
    if (_bmi >= 25) {
      return 'Try to exercise more.\nConsider a balanced diet.';
    } else if (_bmi > 18.5) {
      return 'Great job!\nYour BMI is in the normal range.';
    } else {
      return 'You should eat more.\nConsider seeing a doctor.';
    }
  }
}
