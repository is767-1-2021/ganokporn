import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:team_app/models/patient_model.dart';

abstract class PatientsServices {
  //Future<List<Patient>> getPatients(String idHospitel);
  //Future<List<Patient>> getPatients();
  // Future<void> addPatients(Patient items);
  //Future<void> addPatientUpadateItem(Patient items);
  //Future<void> updateEndDateAdmit(int _idcard, String _checkindate,
  // String _startdateadmit, String _endadmitdate);
  Future<List<Patient>> getPatients();
  Future<void> updateAdmit(
      int _idcard, String _checkindate, String _enddateadmit);
}

class FirebaseServices extends PatientsServices {
  CollectionReference _ref =
      FirebaseFirestore.instance.collection('icovid_booking_hospitel');

  @override
  Future<List<Patient>> getPatients() async {
    QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection('icovid_booking_hospitel')
        //.where('idHospitel', isEqualTo: idHospitel)
        .get();

    AllPatients patients = AllPatients.fromSnapshot(snapshot);
    return patients.patients;
  }

  @override
  Future<void> updateAdmit(
      int _idcard, String _checkindate, String _enddateadmit) async {
    print(_idcard);
    print(_checkindate);
    print(_enddateadmit);

    CollectionReference _ref =
        await FirebaseFirestore.instance.collection('icovid_booking_hospitel');
    FirebaseFirestore.instance
        .collection('icovid_booking_hospitel')
        .where('idcard', isEqualTo: _idcard)
        .where('checkindate', isEqualTo: _checkindate)
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        _ref.doc(doc.id).update({'enddateadmit': _enddateadmit});
      });
    });
  }
}
/*

  @override
  Future<void> addPatientUpadateItem(Patient items) {
    //print('items.fullName:${items.fullName}');
    return _ref.add({
      'startdateadmit': items.startdateadmit,
      'enddateadmit': items.enddateadmit,
      'status': items.status
    });
  } 
}*/


