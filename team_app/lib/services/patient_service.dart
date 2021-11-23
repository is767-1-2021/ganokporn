import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:team_app/models/patient_model.dart';

abstract class PatientsServices {
  //Future<List<Patient>> getPatients(String idHospitel);
  Future<List<Patient>> getPatients();
// Future<void> addPatients(Patient items);
  Future<void> addPatientUpadateItem(Patient items);
  Future<void> updateEndDateAdmit(int _idcard, String _checkindate,
      String _startdateadmit, String _endadmitdate);
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
  Future<void> updateEndDateAdmit(int _idcard, String _checkindate,
      String _startdateadmit, String _enddateadmit) async {
    //bool isActive = true;
    CollectionReference _ref =
        await FirebaseFirestore.instance.collection('icovid_booking_hospitel');
    FirebaseFirestore.instance
        .collection('icovid_booking_hospitel')
        .where('idcard', isEqualTo: _idcard.toString())
        .where('checkindate', isEqualTo: _checkindate)
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        _ref.doc(doc.id).update({'enddateadmit': _enddateadmit});
        _ref.doc(doc.id).update({'startdateadmit': _startdateadmit});
      });
    });
  }

  @override
  Future<void> addPatientUpadateItem(Patient items) {
    //print('items.fullName:${items.fullName}');
    return _ref.add({
      'startdateadmit': items.startdateadmit,
      'enddateadmit': items.enddateadmit,
      'status': items.status
    });

    // @override  //ของแตง
    // Future<void> updateResultPatient(int _idcard, String _checkindate) async {
    //   bool isActive = true;
    //   CollectionReference _ref = await FirebaseFirestore.instance.collection('icovid_booking_hospitel');
    //   FirebaseFirestore.instance
    //       .collection('icovid_booking_hospitel')
    //       .where('idcard', isEqualTo: _idcard.toString() )
    //       .where('checkindate', isEqualTo: _checkindate )
    //       .get()
    //       .then((QuerySnapshot querySnapshot) {
    //       querySnapshot.docs.forEach((doc) {
    //         _ref
    //             .doc(doc.id)
    //             .update({'result': "ติดเชื้อ"});
    //        });
    //   });
    // }
  }
}
