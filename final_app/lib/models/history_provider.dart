import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AnsHistorylist {
  final String AnsHistory;
  final String Answer;
  AnsHistorylist(this.AnsHistory, this.Answer);

  factory AnsHistorylist.formJson(
    Map<String, dynamic> json,
  ) {
    return AnsHistorylist(
      json['AnsHistory'] as String,
      json['Answer'] as String,
    );
  }
}

class AllAnsHistorylist {
  final List<AnsHistorylist> anshistorylist;
  AllAnsHistorylist(this.anshistorylist);

  /*factory AllAnsHistorylist.formJson(List<dynamic> json) {
    List<AnsHistorylist> anshistorylist;

    anshistorylist =
        json.map((index) => AnsHistorylist.formJson(index)).toList();
    return AllAnsHistorylist(anshistorylist);
  }*/

  factory AllAnsHistorylist.fromSnapshot(QuerySnapshot s) {
    List<AnsHistorylist> anshistorylist = s.docs.map((DocumentSnapshot ds) {
      return AnsHistorylist.formJson(ds.data() as Map<String, dynamic>);
    }).toList();
    return AllAnsHistorylist(anshistorylist);
  }
}

class AnsHistorylistModel extends ChangeNotifier {
  String? _AnsHistory;
  String? _Answer;

  get AnsHistory => this._AnsHistory;

  set AnsHistory(value) {
    this._AnsHistory = value;
    notifyListeners();
  }

  get Answer => this._Answer;

  set Answer(value) {
    this._Answer = value;
    notifyListeners();
  }
}
