import 'dart:math';

import 'package:flutter/cupertino.dart';

enum Gender { male, female }

class BMICalculator {
  final int height;
  final int weight;
  final int age;
  final Gender gender;
  double _bmi;

  BMICalculator(
      {@required this.height, @required this.weight, this.age, this.gender});

  String getBMI() {
    _bmi = weight / pow((height / 100), 2);
    return _bmi.toStringAsFixed(1);
  }

  String getLabel() {
    if (_bmi >= 25) {
      return 'Overweight';
    } else if (_bmi > 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  String getMessage() {
    if (_bmi >= 25) {
      return 'You have a higher BMI rate, than the normal one! Try to exercise more 💪🏻🤸🏻‍♂️';
    } else if (_bmi > 18.5) {
      return 'You have a normal BMI rate. Great job ✌🏻';
    } else {
      return 'You have a lower BMI rate, than the normal one! Eat more 😋';
    }
  }
}
