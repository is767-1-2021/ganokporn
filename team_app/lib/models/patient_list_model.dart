import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:team_app/models/patient_model.dart';
import 'package:team_app/pages/patient_list_page.dart';

// Provider

class PatientsListModel extends ChangeNotifier {
  String? _full_name;
  String? _check_date;
  String? _hospitel;
  String? _start_date;
  String? _end_date_;
  List<Patient>? _patientList;

  String? get full_name => this._full_name;

  //List<PatientsItem>? _patientsList;

  set full_name(String? value) {
    this._full_name = value;
    notifyListeners();
  }

  get check_date => this._check_date;

  set check_date(value) {
    this._check_date = value;
    notifyListeners();
  }

  get hospitel => this._hospitel;

  set hospitel(value) {
    this._hospitel = value;
    notifyListeners();
  }

  get start_date => this._start_date;

  set start_date(value) {
    this._start_date = value;
    notifyListeners();
  }

  get end_date => this._end_date_;

  set end_date_(value) {
    this._end_date_ = value;
    notifyListeners();
  }

  /* get patientsList => this._patientsList;

  set patientsList(value) {
    this._patientsList = value;
    notifyListeners();
  }
  */

  /* final List<PatientsItem> _item = [];

  UnmodifiableListView<PatientsItem> get items => UnmodifiableListView(_item);

  List<PatientsItem> getPatientList() {
    return _item;
  }

  void AddBookingList(PatientsItem item) {
    _item.add(item);
    notifyListeners();
  }
  */
  get patientList => this._patientList;

  set patientList(value) {
    this._patientList = value;
    notifyListeners();
  }

  final List<Patient> _item = [];

  UnmodifiableListView<Patient> get items => UnmodifiableListView(_item);

  List<Patient> getPatientList() {
    return _item;
  }

  void AddPatientList(Patient item) {
    _item.add(item);
    notifyListeners();
  }
}
