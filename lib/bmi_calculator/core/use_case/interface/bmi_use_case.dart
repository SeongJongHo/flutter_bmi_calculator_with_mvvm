import 'package:flutter_bmi_calculator/bmi_calculator/core/model/bmi.dart';

abstract class BmiUseCase {
  Future<List<Bmi>> findAll();

  Future<void> save(double cm, double kg);
}