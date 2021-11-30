// History list in firebase

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_app/models/history_provider.dart';

abstract class HistoryServices {
  Future<List<AnsHistorylist>> gethistory();
}

class FirebaseServiceAnsHistorylist extends HistoryServices {
  CollectionReference _ref =
      FirebaseFirestore.instance.collection('final_cal_history');

  @override
  Future<List<AnsHistorylist>> gethistory() async {
    QuerySnapshot snapshot =
        await FirebaseFirestore.instance.collection('final_cal_history').get();

    AllAnsHistorylist anshistorylist = AllAnsHistorylist.fromSnapshot(snapshot);
    return anshistorylist.anshistorylist;
  }
}
