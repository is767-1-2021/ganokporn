import 'dart:async';

import 'package:team_app/models/hospitel_info_class.dart';
import 'package:team_app/services/hospitel_info_service.dart';
import 'package:team_app/pages/hospitel_info_screen.dart';

//import 'package:team_app/models/patient_model.dart';
//import 'package:team_app/services/patient_service.dart';

class HospitelInfoController {
  final HospitelInfoServices services;

  // StreamController<bool> onSyncAddHosController = StreamController<bool>.broadcast();
  // Stream<bool> get onSyncAddHosBooking => onSyncAddHosController.stream;

  HospitelInfoController(this.services);

  void addhospitelInfo(BHospitel items) async {
    services.addhospitelInfo(items);
  }
}
