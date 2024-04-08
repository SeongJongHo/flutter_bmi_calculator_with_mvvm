import 'dart:convert';

import 'package:flutter_bmi_calculator/bmi_calculator/data/data_source/interface/bmi_api.dart';
import 'package:flutter_bmi_calculator/bmi_calculator/data/dto/bmi_dto.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BmiApiImpl implements BmiApi {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  @override
  Future<List<BmiDto>> getBmiResultList() async {
    final SharedPreferences prefs = await _prefs;

    return (prefs.getStringList('bmi_list') ?? [])
        .map((e) => jsonDecode(e) as Map<String, dynamic>)
        .map((e) => BmiDto.fromJson(e))
        .toList();
  }

  @override
  Future<void> postBmiResult(BmiDto bmiDto) async {
    final SharedPreferences prefs = await _prefs;
    final bmiList = (prefs.getStringList('bmi_list') ?? [])
      ..add(jsonEncode(bmiDto.toJson()));
    await prefs.setStringList('bmi_list', bmiList);
  }
}
