import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

// Class
class Patient {
  String idHospitel;
  String checkdate;
  String fullname;
  String hospitel;
  String startdateadmit;
  String enddateadmit;

  Patient(this.idHospitel, this.checkdate, this.fullname, this.hospitel,
      this.startdateadmit, this.enddateadmit);

  factory Patient.fromDs(
    Map<String, Object?> json,
  ) {
    return Patient(
      json['idHospitel'] as String,
      json['checkdate'] as String,
      json['fullname'] as String,
      json['hospitel'] as String,
      json['startdateadmit'] as String,
      json['enddateadmit'] as String,
    );
  }
}

class AllPatients {
  final List<Patient> patients;
  AllPatients(this.patients);

  factory AllPatients.fromSnapshot(QuerySnapshot s) {
    List<Patient> patients = s.docs.map((DocumentSnapshot ds) {
      return Patient.fromDs(ds.data() as Map<String, dynamic>);
    }).toList();
    return AllPatients(patients);
  }
}

class PatientModel extends ChangeNotifier {
  int? _id_card;
  String? _id_Hospitel;
  String? _full_name;
  String? _hospitel_name;
  String? _check_date;
  String? _start_date;
  String? _end_date_;

  int? get id_card => this._id_card;

  set id_card(int? value) {
    this._id_card = value;
    notifyListeners();
  }

  get full_name => this._full_name;

  set full_name(value) {
    this._full_name = value;
    notifyListeners();
  }

  get hospitel_name => this._hospitel_name;

  set hospitel_name(value) {
    this._hospitel_name = value;
    notifyListeners();
  }

  get check_date => this._check_date;

  set check_date(value) {
    this._check_date = value;
    notifyListeners();
  }

  get start_date => this._start_date;

  set start_date(value) {
    this._start_date = value;
    notifyListeners();
  }

  get end_date_ => this._end_date_;

  set end_date_(value) {
    this._end_date_ = value;
    notifyListeners();
  }

  get id_Hospitel => this._id_Hospitel;

  set id_Hospitel(value) {
    this._id_Hospitel = value;
    notifyListeners();
  }
}
