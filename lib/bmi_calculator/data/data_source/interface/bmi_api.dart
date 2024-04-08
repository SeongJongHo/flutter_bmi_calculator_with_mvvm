import 'package:flutter_bmi_calculator/bmi_calculator/data/dto/bmi_dto.dart';

abstract interface class BmiApi {
  Future<List<BmiDto>> getBmiResultList();

  Future<void> postBmiResult(BmiDto bmiDto);
}
