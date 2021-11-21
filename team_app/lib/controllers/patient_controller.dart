import 'dart:async';
import 'package:team_app/models/patient_model.dart';
import 'package:team_app/services/patient_service.dart';

class PatientController {
  final PatientsServices services;
  List<Patient> patients = List.empty();

  StreamController<bool> onSyncController = StreamController<bool>.broadcast();
  Stream<bool> get onSync => onSyncController.stream;
  bool _isDisposed = false;

  PatientController(this.services);

  Future<List<Patient>?> fecthPatients(String idHospitel) async {
    if (_isDisposed) {
      onSyncController = StreamController<bool>.broadcast();
    }
    onSyncController.sink.add(true);
    patients = await services.getPatients(idHospitel);
    onSyncController.sink.add(false);
    dispose();
    return patients;
  }

  void addPatients(Patient items) async {
    services.addPatients(items);
  }

  void dispose() {
    onSyncController.close();
    _isDisposed = true;
  }
}
