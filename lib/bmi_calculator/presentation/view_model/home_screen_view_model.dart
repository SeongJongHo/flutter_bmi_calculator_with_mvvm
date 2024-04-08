import 'package:flutter/material.dart';
import 'package:flutter_bmi_calculator/bmi_calculator/core/model/bmi.dart';
import 'package:flutter_bmi_calculator/bmi_calculator/core/use_case/interface/bmi_use_case.dart';

class HomeScreenViewModel extends ChangeNotifier {
  List<Bmi> _bmiList = [];
  final BmiUseCase _bmiUseCase;

  HomeScreenViewModel({required BmiUseCase bmiUseCase})
      : _bmiUseCase = bmiUseCase;

  List<Bmi> get bmiList => _bmiList;

  Future<void> findAll() async {
    _bmiUseCase
        .findAll()
        .then((value) => _bmiList = value.reversed.toList())
        .then((_) => notifyListeners());
  }

  Future<void> save(double cm, double kg) async {
    await _bmiUseCase.save(cm, kg);
    findAll();
  }
}
