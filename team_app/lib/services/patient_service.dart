import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:team_app/models/patient_model.dart';

abstract class PatientsServices {
  Future<List<Patient>> getPatients(String idHospitel);
  Future<void> addPatients(Patient items);
}

class FirebaseServices extends PatientsServices {
  CollectionReference _ref =
      FirebaseFirestore.instance.collection('icovid_booking_hospitel');

  @override
  Future<List<Patient>> getPatients(String idHospitel) async {
    QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection('icovid_booking_hospitel')
        .where('idHospitel', isEqualTo: idHospitel)
        .get();

    AllPatients patients = AllPatients.fromSnapshot(snapshot);
    return patients.patients;
  }

  @override
  Future<void> addPatients(Patient items) {
    print('items.fullName:${items.fullname}');
    return _ref.add({
      'checkdate': items.checkdate,
      'fullname': items.fullname,
      'hospitel': items.hospitel,
      'startdateadmit': items.startdateadmit,
      'enddateadmit': items.enddateadmit,
      'idHospitel': items.idHospitel,
    });
  }
}
