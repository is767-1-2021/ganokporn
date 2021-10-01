import 'package:flutter/cupertino.dart';

class PatientFormModel extends ChangeNotifier {
  String? _firstName;
  String? _lastName;
  int? id;
  String? _pid;
  String? _checkin;
  String? _checkout;

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
}
