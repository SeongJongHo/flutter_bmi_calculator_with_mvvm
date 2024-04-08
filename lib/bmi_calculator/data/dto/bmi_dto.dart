class BmiDto {
  final num? _cm;
  final num? _kg;
  final num? _bmi;
  final String? _createdTime;

  BmiDto({
    num? cm,
    num? kg,
    num? bmi,
    String? createdTime,
  })  : _cm = cm,
        _kg = kg,
        _bmi = bmi,
        _createdTime = createdTime;

  factory BmiDto.fromJson(Map<String, dynamic> json) {
    return BmiDto(
      cm: json['cm'] as num,
      kg: json['kg'] as num,
      bmi: json['bmi'] as num,
      createdTime: json['created_time'] as String,
    );
  }

  BmiDto copyWith({
    num? cm,
    num? kg,
    num? bmi,
    String? createdTime,
  }) =>
      BmiDto(
        cm: cm ?? _cm,
        kg: kg ?? _kg,
        bmi: bmi ?? _bmi,
        createdTime: createdTime ?? _createdTime,
      );

  num? get cm => _cm;

  num? get kg => _kg;

  num? get bmi => _bmi;

  String? get createdTime => _createdTime;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['cm'] = _cm;
    map['kg'] = _kg;
    map['bmi'] = _bmi;
    map['created_time'] = _createdTime;
    return map;
  }
}
