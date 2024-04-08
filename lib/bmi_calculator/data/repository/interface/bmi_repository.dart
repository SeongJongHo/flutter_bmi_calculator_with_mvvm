import 'package:flutter_bmi_calculator/bmi_calculator/core/model/bmi.dart';

abstract interface class BmiRepository {
  Future<List<Bmi>> findAll();

  Future<void> save(Bmi bmiDto);
}
