import 'package:flutter/cupertino.dart';

class PatientFormModel extends ChangeNotifier {
  String? _firstName;
  String? _lastName;
  int? id;
  String? _pid;
  String? _checkin;
  String? _checkout;
  String? _hName;
  String? _hAddress;
  String? _hTel;
  String? _hBed;

  get firstName => this._firstName;

  set firstName(value) {
    this._firstName = value;
    notifyListeners();
  }

  get lastName => this._lastName;

  set lastName(value) {
    this._lastName = value;
    notifyListeners();
  }

  get getAge => this.id;

  set setAge(id) {
    this.id = id;
    notifyListeners();
  }

  get checkin => this._checkin;

  set checkin(value) {
    this._checkin = value;
    notifyListeners();
  }

  get checkout => this._checkout;

  set checkout(value) {
    this._checkout = value;
    notifyListeners();
  }

  get pid => this._pid;

  set pid(value) {
    this._pid = value;
    notifyListeners();
  }

  get hName => this._hName;

  set hName(value) {
    this._hName = value;
    notifyListeners();
  }

  get hAddress => this._hAddress;

  set hAddress(value) {
    this._hAddress = value;
    notifyListeners();
  }

  get hTel => this._hTel;

  set hTel(value) {
    this._hTel = value;
    notifyListeners();
  }

  get hBed => this._hBed;

  set hBed(value) {
    this._hBed = value;
    notifyListeners();
  }
}
