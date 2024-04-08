class Bmi {
  final num _cm;
  final num _kg;
  final num _bmi;
  final String _createdTime;

  Bmi({
    required num cm,
    required num kg,
    required num bmi,
    required String createdTime,
  })  : _cm = cm,
        _kg = kg,
        _bmi = bmi,
        _createdTime = createdTime;

  num get cm => _cm;

  num get kg => _kg;

  num get bmi => _bmi;


  String get createdTime => _createdTime;

  @override
  String toString() {
    return 'Bmi{_cm: $_cm, _kg: $_kg, _bmi: $_bmi, _createdTime: $_createdTime}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Bmi &&
          runtimeType == other.runtimeType &&
          _cm == other._cm &&
          _kg == other._kg &&
          _bmi == other._bmi &&
          _createdTime == other._createdTime;

  @override
  int get hashCode =>
      _cm.hashCode ^
      _kg.hashCode ^
      _bmi.hashCode ^
      _createdTime.hashCode;
}
