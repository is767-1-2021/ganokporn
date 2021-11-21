import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:team_app/models/patient_form_model.dart';
import 'package:team_app/pages/patient_list_page.dart';

class HospitelInfoPage extends StatefulWidget {
  HospitelInfoPage({Key? key}) : super(key: key);

  @override
  _HospitelInfoPageState createState() => _HospitelInfoPageState();
}

class _HospitelInfoPageState extends State<HospitelInfoPage> {
  // final String bg = "assets/onboarding-free.png";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/onboarding-free.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SafeArea(
            child: Container(
              padding: EdgeInsets.only(
                  left: 16.0,
                  right: 16.0,
                  top: MediaQuery.of(context).size.height * 0.20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Image.asset(
                        "assets/now-logo.png",
                        scale: 3.5,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width / 2,
                        child: FittedBox(
                          fit: BoxFit.contain,
                          child: Column(
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width / 5,
                                child: FittedBox(
                                  fit: BoxFit.contain,
                                  child: Text(
                                    "HOSPITEL",
                                    style: TextStyle(
                                      color: Colors.lightBlue.shade200,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width / 3,
                                child: FittedBox(
                                  fit: BoxFit.contain,
                                  child: Text(
                                    "QUARANTINE PATIENT STATUS",
                                    style: TextStyle(
                                      color: Colors.lightBlue.shade200,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 70, vertical: 20),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          child: Consumer<PatientFormModel>(
                            builder: (context, form, child) {
                              return Text(
                                '${form.firstName}\n ID: ${form.pid}\n Check-in: ${form.checkin}\n Check-out: ${form.checkout}',
                                style: TextStyle(
                                    color: Colors.lightBlue,
                                    fontWeight: FontWeight.normal,
                                    fontSize: 15),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Data has been SAVE",
                            //"Wellcome Administrator",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 0.3,
                            ),
                          ),
                          SizedBox(
                            width: 5.0,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 8.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Let's manage next patient",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 0.3),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 16.0),
                        child: SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => PatientList(),
                                ),
                              );
                            },
                            child: Padding(
                              padding: EdgeInsets.only(
                                left: 16.0,
                                right: 16.0,
                                top: 16.0,
                                bottom: 16.0,
                              ),
                              child: Text("LET'S START"),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
