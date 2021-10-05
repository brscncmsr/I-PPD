import 'package:flutter/material.dart';

class Functions {
  double _result = 0;
  void calculateBMI(TextEditingController _heightController,
      TextEditingController _weightController) {
    double height = double.parse(_heightController.text) / 100;
    double weight = double.parse(_weightController.text);

    double heightSquare = height * height;
    double result = weight / heightSquare;

    _result = result;
    ;
    if (result != 0) {}
  }
}
