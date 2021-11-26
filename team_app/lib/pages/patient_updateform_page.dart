//import 'dart:html';

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
  @override
  _PatientUpdateFormState createState() => _PatientUpdateFormState();
}

class _PatientUpdateFormState extends State<PatientUpdateForm> {
  // เผื่อประกาศตัวแปร
  final formkey = GlobalKey<FormState>();

  String? startdateadmit;
  String? enddateadmit;
  var service = FirebaseServices();
  var controller;
  _PatientUpdateFormState() {
    controller = PatientController(service);
  }

  /*void getDropDownItem() {
    setState(() {
      hopitelid = hopitel;
      // myleave.leaveid = leaveid;
    });
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'อัพเดท',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            //color: iWhiteColor),
          ),
          //backgroundColor: iBlueColor),
        ),
      ),
      body: Consumer<PatientsListModel>(
        builder: (context, form, child) {
          return Padding(
            padding: const EdgeInsets.all(2.0),
            child: Card(
              child: Form(
                key: formkey,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Column(
                                children: <Widget>[
                                  Text('ชื่อ-สกุล ผู้เข้าพัก :: ',
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w700)),
                                ],
                              ),
                              Column(
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      Consumer<PatientsListModel>(
                                        builder: (context, form, child) {
                                          return Text(
                                            '${form.full_name}',
                                            style: TextStyle(
                                                fontSize: 18,
                                                color: Colors.black),
                                          );
                                        },
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        child: Padding(
                          padding:
                              const EdgeInsets.only(top: 12.0, bottom: 12.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Column(
                                children: <Widget>[
                                  TextFormField(
                                    decoration: InputDecoration(
                                      border: UnderlineInputBorder(),
                                      labelText: 'วันที่เข้าพัก',
                                      labelStyle: TextStyle(
                                          // color: iBlackColor,
                                          fontWeight: FontWeight.w700,
                                          fontSize: 16),
                                      focusedBorder: UnderlineInputBorder(
                                          //borderSide: BorderSide(color: iBlueColor),

                                          ),
                                    ),
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'กรุณาระบุวันที่เข้าพัก';
                                      }
                                      return null;
                                    },
                                    onSaved: (value) {
                                      startdateadmit = value;
                                    },
                                    initialValue: context
                                        .read<PatientsListModel>()
                                        .start_date,
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: 60,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        if (formkey.currentState!.validate()) {
                                          formkey.currentState!.save();
                                          if (context
                                                  .read<PatientsListModel>()
                                                  .start_date !=
                                              null) {
                                            print('/////////////////');
                                            context
                                                .read<PatientsListModel>()
                                                .start_date;
                                          }
                                          controller.PatientController(
                                              form.idCard,
                                              '${form.check_date}',
                                              startdateadmit);
                                        }
                                        _showDialog(context);
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    PatientList()));
                                        const SnackBar(
                                            content: Text('บันทึกผลเรียบร้อย'));
                                      },
                                      style: ElevatedButton.styleFrom(
                                        // primary: iBlueColor,
                                        shape: new RoundedRectangleBorder(
                                          borderRadius:
                                              new BorderRadius.circular(30.0),
                                        ),
                                      ),
                                      child: Text(
                                        'SAVE',
                                        style: TextStyle(
                                            fontSize: 20, color: Colors.amber),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 20.0,
                                    height: 30.0,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

void _showDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('สำเร็จ'),
        content: Text('บันทึกผลเรียบร้อย'),
        actions: [
          ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => PatientList()));
              },
              child: Text('ตกลง'))
        ],
      );
    },
  );
}
