import 'package:flutter/material.dart';

enum WeightCategory {
  underWeight(
    value: [
      Icon(Icons.warning, color: Colors.purpleAccent, size: 48),
      Text('저체중입니다.'),
    ],
  ),
  normal(value: [
    Icon(Icons.check, color: Colors.green, size: 48),
    Text('정상입니다.'),
  ]),
  overWeight(value: [
    Icon(Icons.warning, color: Colors.yellow, size: 48),
    Text('과체중입니다.'),
  ]),
  obese(value: [
    Icon(Icons.warning, color: Colors.deepOrangeAccent, size: 48),
    Text('비만입니다.'),
  ]),
  severelyObese(value: [
    Icon(Icons.warning, color: Colors.red, size: 48),
    Text('고도비만입니다.'),
  ]),
  unknown(value: [
    Icon(Icons.warning, color: Colors.black, size: 48),
    Text('존재하지 않습니다..'),
  ]);

  final List<Widget> _value;

  const WeightCategory({required List<Widget> value}) : _value = value;

  List<Widget> getWidget() {
    return _value;
  }

  static WeightCategory getCategory(double bmi) {
    if (bmi < 0) {
      return WeightCategory.unknown;
    } else if (bmi < 18.5) {
      return WeightCategory.underWeight;
    } else if (bmi < 23) {
      return WeightCategory.normal;
    } else if (bmi < 25) {
      return WeightCategory.overWeight;
    } else if (bmi < 30) {
      return WeightCategory.obese;
    } else {
      return WeightCategory.severelyObese;
    }
  }
}
