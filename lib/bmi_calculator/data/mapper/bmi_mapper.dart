import 'package:flutter_bmi_calculator/bmi_calculator/core/model/bmi.dart';
import 'package:flutter_bmi_calculator/bmi_calculator/data/dto/bmi_dto.dart';

extension BmiDtoToBmi on BmiDto {
  Bmi toBmi() {
    return Bmi(
        cm: cm ?? 0,
        kg: kg ?? 0,
        bmi: bmi ?? 0,
        createdTime: createdTime ??
            '${DateTime.now().year}-${DateTime.now().month}-${DateTime.now().day}-${DateTime.now().hour}-${DateTime.now().minute}}');
  }
}
