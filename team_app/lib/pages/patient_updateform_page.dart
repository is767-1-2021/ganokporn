import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:team_app/models/patient_form_model.dart';
import 'package:provider/provider.dart';
import 'package:team_app/models/patient_list_model.dart';
import 'package:team_app/pages/hostpitel_info_page.dart';
import 'package:team_app/pages/patient_list_page.dart';
import 'package:team_app/services/patient_service.dart';
import 'package:team_app/controllers/patient_controller.dart';
import 'package:team_app/models/patient_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class PatientUpdateForm extends StatefulWidget {
  var service = PatientsServices();
  var controller;
  PatientUpdateForm() {
    controller = PatientController(service);
  }
  @override
  _PatientUpdateFormState createState() => _PatientUpdateFormState();
}

class _PatientUpdateFormState extends State<PatientUpdateForm> {
  List<Patient> _patientList = [];
  bool isLoading = false;
  String id_hospitel_test = "1234567";

  @override
  void initState() {
    super.initState();
    widget.controller.onSync
        .listen((bool syncState) => setState(() => isLoading = syncState));
  }

  void _updateEndDateAdmit(
      int _idcard,
      String _checkindate,
      String _startdateadmit,
      String _endadmitdate,
      BuildContext context) async {
    await widget.controller.updateEndDateAdmit(
        _idcard, _checkindate, _startdateadmit, _endadmitdate);
    var patientsList = await widget.controller.fecthpatients();
    setState(() {
      _patientList = patientsList;
    });
  }
  // Widget get body => isLoading
  // ? CircularProgressIndicator()

  @override
  Widget build(BuildContext context) {
    _updateEndDateAdmit(context);
    if (context.read<PatientsListModel>().patientList != null) {
      _patientList = context.read<PatientsListModel>().patientList;
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'อัพเดท',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            //color: iWhiteColor),
          ),
        ),
      backgroundColor: Color(0xFF473F97),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            iconSize: 28.0,
            onPressed: () {},
          ),
        ],
      ),
      body: Center(
        child: body,
      )
    );
  }
}



หน้านี้กำลังจะลอกใหม่ 