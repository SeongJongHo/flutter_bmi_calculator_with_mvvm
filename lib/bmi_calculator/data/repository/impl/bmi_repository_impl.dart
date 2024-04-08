import 'package:flutter_bmi_calculator/bmi_calculator/core/model/bmi.dart';
import 'package:flutter_bmi_calculator/bmi_calculator/data/data_source/interface/bmi_api.dart';
import 'package:flutter_bmi_calculator/bmi_calculator/data/dto/bmi_dto.dart';
import 'package:flutter_bmi_calculator/bmi_calculator/data/mapper/bmi_mapper.dart';
import 'package:flutter_bmi_calculator/bmi_calculator/data/repository/interface/bmi_repository.dart';

class BmiRepositoryImpl implements BmiRepository {
  final BmiApi _bmiApi;

  BmiRepositoryImpl({required BmiApi bmiApi}) : _bmiApi = bmiApi;

  @override
  Future<List<Bmi>> findAll() async {
    final bmiDtoList = await _bmiApi.getBmiResultList();

    return bmiDtoList.map((bmi) => bmi.toBmi()).toList();
  }

  @override
  Future<void> save(Bmi bmi) async {
    return await _bmiApi.postBmiResult(BmiDto(
      cm: bmi.cm,
      kg: bmi.kg,
      bmi: bmi.bmi,
      createdTime: bmi.createdTime,
    ));
  }
}
