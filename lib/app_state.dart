import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _drug = prefs.getStringList('ff_drug') ?? _drug;
    });
    _safeInit(() {
      _concentration =
          prefs.getStringList('ff_concentration') ?? _concentration;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  double _weight = 75;
  double get weight => _weight;
  set weight(double _value) {
    _weight = _value;
  }

  String _DosageResult = 'X mL';
  String get DosageResult => _DosageResult;
  set DosageResult(String _value) {
    _DosageResult = _value;
  }

  List<String> _drug = ['Bupivacaine', 'Lidocaine'];
  List<String> get drug => _drug;
  set drug(List<String> _value) {
    _drug = _value;
    prefs.setStringList('ff_drug', _value);
  }

  void addToDrug(String _value) {
    _drug.add(_value);
    prefs.setStringList('ff_drug', _drug);
  }

  void removeFromDrug(String _value) {
    _drug.remove(_value);
    prefs.setStringList('ff_drug', _drug);
  }

  void removeAtIndexFromDrug(int _index) {
    _drug.removeAt(_index);
    prefs.setStringList('ff_drug', _drug);
  }

  void updateDrugAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _drug[_index] = updateFn(_drug[_index]);
    prefs.setStringList('ff_drug', _drug);
  }

  void insertAtIndexInDrug(int _index, String _value) {
    _drug.insert(_index, _value);
    prefs.setStringList('ff_drug', _drug);
  }

  List<String> _concentration = ['0.25%', '0.5%', '1%'];
  List<String> get concentration => _concentration;
  set concentration(List<String> _value) {
    _concentration = _value;
    prefs.setStringList('ff_concentration', _value);
  }

  void addToConcentration(String _value) {
    _concentration.add(_value);
    prefs.setStringList('ff_concentration', _concentration);
  }

  void removeFromConcentration(String _value) {
    _concentration.remove(_value);
    prefs.setStringList('ff_concentration', _concentration);
  }

  void removeAtIndexFromConcentration(int _index) {
    _concentration.removeAt(_index);
    prefs.setStringList('ff_concentration', _concentration);
  }

  void updateConcentrationAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _concentration[_index] = updateFn(_concentration[_index]);
    prefs.setStringList('ff_concentration', _concentration);
  }

  void insertAtIndexInConcentration(int _index, String _value) {
    _concentration.insert(_index, _value);
    prefs.setStringList('ff_concentration', _concentration);
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
