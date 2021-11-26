import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:team_app/models/hospitel_info_class.dart';
import 'package:team_app/models/patient_model.dart';
import 'package:team_app/pages/hospitel_info_screen.dart';

abstract class AHospitelService {
  Future<void> addhospitelInfo(BHospitel _hospital);
}

class HospitelInfoServices extends AHospitelService {
  CollectionReference _ref =
      FirebaseFirestore.instance.collection('icovid_hospitel');

  @override
  Future<void> addhospitelInfo(BHospitel items) {
    return _ref.add({
      'hospitel_number': items.hospitel_number,
      'hospitel_name': items.hospitel_name,
      'address': items.address,
      'no_patient': items.no_patient,
      'no_staff': items.no_staff,
      'phone': items.phone,
    });
  }
}
