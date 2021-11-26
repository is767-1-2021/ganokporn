import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:team_app/models/patient_model.dart';
import 'package:team_app/models/patient_list_model.dart';
import 'package:team_app/models/patient_form_model.dart';
import 'package:team_app/models/hospitel_info_class.dart';
import 'package:team_app/models/HospitalFormModel.dart';
import 'package:team_app/models/hospital_model.dart';
import 'package:team_app/models/hospital_clas.dart';

import 'package:team_app/controllers/patient_controller.dart';
import 'package:team_app/controllers/hospitel_info_controller.dart';

import 'package:team_app/pages/bottom_nav_page.dart';
import 'package:team_app/pages/home_page.dart';
import 'package:team_app/pages/hospitel_detail_page.dart';
import 'package:team_app/pages/hospitel_info_screen.dart';
import 'package:team_app/pages/hospitel_update_page.dart';
import 'package:team_app/pages/hostpitel_info_page.dart';
import 'package:team_app/pages/patient_list_page.dart';
import 'package:team_app/pages/patient_status_page.dart';
import 'package:team_app/pages/patient_updateform_page.dart';

import 'package:firebase_core/firebase_core.dart';

import 'package:team_app/services/patient_service.dart';
import 'package:team_app/services/hospital_service.dart';
import 'package:team_app/services/hospitel_info_service.dart';

//import 'pages/patient_list_page.dart';
//import 'pages/patient_status_page.dart';
//import 'pages/hostpitel_info_page.dart';
//import 'pages/hospitel_detail_page.dart';
//import 'package:team_app/pages/hospitel_info_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  var services = FirebaseServices();
  var controller = PatientController(services);

  // runApp(TeamApp(controller: controller));
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => PatientsListModel(),
        ),
      ],
      child: MyApp(),
    ),
  );
}

/*class TeamApp extends StatelessWidget {
  final PatientController controller;
  TeamApp({required this.controller});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PatientList(
        controller: controller,
      ),
    );
  }
}
*/
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Team App',
      theme: ThemeData(fontFamily: 'Raleway'),

      /*theme: ThemeData(
        primarySwatch: Colors.blue,
      
      ),
      */

      home: PatientList(),
    );
  }
}
