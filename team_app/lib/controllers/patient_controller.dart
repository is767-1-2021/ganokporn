import 'dart:async';
import 'package:team_app/models/patient_model.dart';
import 'package:team_app/services/patient_service.dart';

class PatientController {
  final PatientsServices services;
  List<Patient> patients = List.empty();

  StreamController<bool> onSyncController = StreamController();
  Stream<bool> get onSync => onSyncController.stream;
  bool _isDisposed = false;

  PatientController(this.services);

  Future<List<Patient>> fecthpatients() async {
    if (_isDisposed) {
      onSyncController = StreamController<bool>.broadcast();
    }
    onSyncController.add(true);
    //patients = await services.getPatients(idHospitel);
    patients = await services.getPatients();
    onSyncController.add(false);
    dispose();
    return patients;
  }

  /*void addPatientUpadateItem(Patient items) async {
    services.addPatientUpadateItem(items);
  }*/

  /*void updateEndDateAdmit(int _idcard, String _checkindate,
      String _startdateadmit, String _endadmitdate) {
    services.updateEndDateAdmit(
        _idcard, _checkindate, _startdateadmit, _endadmitdate);
  }*/

  Future<void> updateAdmit(
      int idcard, String checkindate, String enddateadmit) async {
    await services.updateAdmit(idcard, checkindate, enddateadmit);
  }

  void dispose() {
    onSyncController.close();
    _isDisposed = true;
  }
}
