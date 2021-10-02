import 'package:flutter/material.dart';
import 'package:team_app/models/patient_form_model.dart';
import 'package:team_app/pages/hospitel_update_page.dart';
import 'pages/patient_list_page.dart';
import 'pages/patient_status_page.dart';
import 'pages/hostpitel_info_page.dart';
import 'package:provider/provider.dart';
import 'pages/hospitel_detail_page.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => PatientFormModel(),
        ),
      ],
      child: MyApp(),
    ),
  );
}

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

      home: PatientListPage(),
    );
  }
}
