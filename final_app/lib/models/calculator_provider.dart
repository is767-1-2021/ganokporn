// เก็บการคำนวณใส่ provider

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CalculatorProvider extends ChangeNotifier {
  late String answer = "";
  late String answerTemp = "";
  late String inputFull = "";
  late String operator = "";
  CollectionReference final_cal_history =
      FirebaseFirestore.instance.collection('final_cal_history');

  get result => this.answer;

  set result(value) {
    this.answer = value;
    final_cal_history.add(
        {'Answer': answer, 'AnsHistory': inputFull + operator + answerTemp});
    notifyListeners();
  }

  get inputfull => this.inputFull;

  set inputfull(value) {
    this.inputFull = value;
    notifyListeners();
  }

  get anstemp => this.answerTemp;

  set anstemp(value) {
    this.answerTemp = value;
    notifyListeners();
  }

  get symbol => this.operator;

  set symbol(value) {
    this.operator = value;
    notifyListeners();
  }
}
