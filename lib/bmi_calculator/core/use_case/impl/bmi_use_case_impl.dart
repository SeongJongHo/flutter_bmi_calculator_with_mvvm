import 'package:flutter_bmi_calculator/bmi_calculator/core/model/bmi.dart';
import 'package:flutter_bmi_calculator/bmi_calculator/core/use_case/interface/bmi_use_case.dart';
import 'package:flutter_bmi_calculator/bmi_calculator/data/repository/interface/bmi_repository.dart';

class BmiUseCaseImpl implements BmiUseCase {
  final BmiRepository _bmiRepository;

  BmiUseCaseImpl({required BmiRepository bmiRepository})
      : _bmiRepository = bmiRepository;

  @override
  Future<List<Bmi>> findAll() async {
    return await _bmiRepository.findAll();
  }

  @override
  Future<void> save(double cm, double kg) async {
    await _bmiRepository.save(Bmi(
      cm: cm,
      kg: kg,
      bmi: calculatorBmi(cm, kg),
      createdTime: _getStringNowDate(),
    ));
  }

  String _getStringNowDate() {
    final now = DateTime.now();

    return '${now.year}-${now.month}-${now.day}-${now.hour}-${now.minute}';
  }

  double calculatorBmi(double cm, double kg) {
    return kg / ((cm / 100) * (cm / 100));
  }
}
