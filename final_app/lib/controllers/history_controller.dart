import 'dart:async';
import 'package:final_app/services/history_service.dart';
import 'package:final_app/models/history_provider.dart';

class AnsHistorylistController {
  final HistoryServices service;
  List<AnsHistorylist> anshistorylist = List.empty();

  StreamController<bool> onSyncController = StreamController();
  Stream<bool> get onSync => onSyncController.stream;

  AnsHistorylistController(this.service);

  Future<List<AnsHistorylist>> fecthistorylist() async {
    onSyncController.add(true);
    anshistorylist = await service.gethistory();
    onSyncController.add(false);

    return anshistorylist;
  }
}



/* import 'dart:async';
import 'package:final_app/services/history_service.dart';
import 'package:final_app/models/history_provider.dart';

class AnsHistorylistController {
  final HistoryServices service;
  List<AnsHistorylist> anshistorylist = List.empty();

  bool _isDisposed = false;

  StreamController<bool> onSyncController = StreamController();
  Stream<bool> get onSync => onSyncController.stream;

  AnsHistorylistController(this.service);

  Future<List<AnsHistorylist>> fecthAnsHistoryList() async {
    /* if (_isDisposed) {
      onSyncController = StreamController<bool>.broadcast();
    }*/
    onSyncController.add(true);
    anshistorylist = await service.gethistory();
    onSyncController.add(false);
    // dispose();
    return anshistorylist;
  }

  // void dispose() {
  //   onSyncController.close();
  //   _isDisposed = true;
  // }
}*/