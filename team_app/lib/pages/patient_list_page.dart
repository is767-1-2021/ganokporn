import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:team_app/pages/hospitel_detail_page.dart';
import 'package:team_app/pages/hospitel_info_screen.dart';
import 'package:team_app/pages/hospitel_update_page.dart';
import 'package:team_app/pages/hostpitel_info_page.dart';
import 'package:team_app/pages/patient_status_page.dart';
import 'package:provider/provider.dart';

import 'package:team_app/pages/bottom_nav_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:team_app/models/patient_model.dart';
import 'package:team_app/models/patient_list_model.dart';
import 'package:team_app/services/patient_service.dart';
import 'package:team_app/controllers/patient_controller.dart';
import 'patient_updateform_page.dart';

class PatientList extends StatefulWidget {
  var service = FirebaseServices();
  var controller;
  PatientList() {
    controller = PatientController(service);
  }

  @override
  _PatientListState createState() => _PatientListState();
}

class _PatientListState extends State<PatientList> {
  List<Patient> _patientList = List.empty();
  bool isLoading = false;
  // String id_hospitel_test = "1234567";

  @override
  void initState() {
    super.initState();
    setState(() {});
    widget.controller.onSync
        .listen((bool syncState) => setState(() => isLoading = syncState));
    _getPatients();
  }

  void _getPatients() async {
    var patientsList = await widget.controller.fecthpatients();
    setState(() {
      _patientList = patientsList;
      //context.read<PatientsListModel>().patientList = patientsList;
    });
  }

  Widget get body => isLoading
      ? CircularProgressIndicator()
      : ListView.builder(
          itemCount: _patientList.isEmpty ? 1 : _patientList.length,
          itemBuilder: (context, index) {
            if (_patientList.isEmpty) {
              return Center(
                child: Container(
                  margin: EdgeInsets.only(top: 300),
                  child: Text('ไม่พบการจองเข้าพักรักษา'),
                ),
              );
            }
            return Card(
              child: ListTile(
                leading: CircleAvatar(
                  radius: 30,
                  child: FittedBox(
                    child: Text(
                      '${index + 1}',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                ),
                title: Text('${_patientList[index].fullname}'),
                subtitle: Text('${_patientList[index].startdateadmit}'),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            PatientDetail(items: _patientList[index]),
                      ));
                },
              ),
            );
          });

  @override
  Widget build(BuildContext context) {
    /*_getPatients(context);
    List<PatientsItem> _patientsList = [];
    if (context.read<PatientsListModel>().patientList != null) {
      _patientList = context.read<PatientsListModel>().patientList;
    }*/
    return Scaffold(
      appBar: AppBar(
        //backgroundColor: iBlueColor,
        title: Text(
          'รายชื่อผู้จองห้องพัก',
          //automaticallyImplyLeading: false,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            //color: iWhiteColor
          ),
        ),
        backgroundColor: Color(0xFF473F97),
        actions: [
          IconButton(
            icon: Icon(Icons.home_outlined),
            iconSize: 28.0,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => BottomNavScreen()),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.add_business),
            iconSize: 28.0,
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => HospitelDetailPage()));
            },
          ),
          IconButton(
            icon: Icon(Icons.settings),
            iconSize: 28.0,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HostpitelInfoScreen()),
              );
            },
          )
        ],
      ),
      body: Center(
        child: body,
      ),
    );
  }
}

class PatientDetail extends StatelessWidget {
  final Patient items;

  const PatientDetail({
    Key? key,
    required this.items,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final TextEditingController _enddateadmitController =
        new TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'รายละเอียดการจอง',
            style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.w700,
              //color: iWhiteColor,
            ),
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    border: UnderlineInputBorder(),
                    enabled: false,
                    labelText: 'ชื่อ-สกุลผู้เข้าพัก',
                    labelStyle: TextStyle(
                        // color: iBlackColor,
                        fontWeight: FontWeight.w700,
                        fontSize: 16),
                    focusedBorder: UnderlineInputBorder(
                        //borderSide: BorderSide(color: iBlueColor),

                        ),
                  ),
                  initialValue: '${items.fullname}',
                ),
                TextFormField(
                  decoration: InputDecoration(
                    border: UnderlineInputBorder(),
                    enabled: false,
                    labelText: 'ชื่อโรงพยาบาลสนาม',
                    labelStyle: TextStyle(
                        // color: iBlackColor,
                        fontWeight: FontWeight.w700,
                        fontSize: 16),
                    focusedBorder: UnderlineInputBorder(
                        //borderSide: BorderSide(color: iBlueColor),

                        ),
                  ),
                  initialValue: '${items.hospitel}',
                ),
                TextFormField(
                  decoration: InputDecoration(
                    border: UnderlineInputBorder(),
                    enabled: false,
                    labelText: 'วันที่ตรวจหาเชื้อ COVID-19',
                    labelStyle: TextStyle(
                        // color: iBlackColor,
                        fontWeight: FontWeight.w700,
                        fontSize: 16),
                    focusedBorder: UnderlineInputBorder(
                        //borderSide: BorderSide(color: iBlueColor),

                        ),
                  ),
                  initialValue: '${items.checkindate}',
                ),
                TextFormField(
                  decoration: InputDecoration(
                    border: UnderlineInputBorder(),
                    enabled: false,
                    labelText: 'วันที่เข้าห้องพัก',
                    labelStyle: TextStyle(
                        // color: iBlackColor,
                        fontWeight: FontWeight.w700,
                        fontSize: 16),
                    focusedBorder: UnderlineInputBorder(
                        //borderSide: BorderSide(color: iBlueColor),

                        ),
                  ),
                  initialValue: '${items.startdateadmit}',
                ),
                TextFormField(
                  controller: _enddateadmitController,
                  decoration: InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'กรอกวันที่ออกจากห้องพัก',
                    labelStyle: TextStyle(
                        //color: iBlackColor,
                        fontWeight: FontWeight.w700,
                        fontSize: 16),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    hintText: 'DD/MM/YYY',
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'กรุณากรอกวันที่ออกจากห้องพัก';
                    }
                    return null;
                  },
                ),
                Container(
                  margin: EdgeInsets.only(top: 50),
                  width: MediaQuery.of(context).size.width,
                  height: 60,
                  child: ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        formKey.currentState!.save();
                        print('Submit');
                        var services = FirebaseServices();
                        var controllers = PatientController(services)
                            .updateAdmit(items.idcard, '${items.checkindate}',
                                '${_enddateadmitController.text}');
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PatientList()));
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFF473F97),
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0),
                      ),
                    ),
                    child: Text('อัพเดทข้อมูลเพิ่มเติม',
                        style: TextStyle(fontSize: 20, color: Colors.white)),
                  ),
                ),
                //SizedBox(height: 40),
                /*ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: ElevatedButton.icon(
                      label: Text('อัพเดทข้อมูลผู้เข้าพัก'),
                      icon: Icon(Icons.download_for_offline_outlined),
                      style: ElevatedButton.styleFrom(
                        //primary: Color(0xFF26A69A),
                        fixedSize: Size(300, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40),
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PatientUpdateForm(),
                          ),
                        );
                        /*if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
          
                          context.read<PatientModel>().end_date = enddateadmit;
                        } */
                      }),
                )
                */
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ---------------------------------------- โค้ดก่อนมิดเทอม ----------------------------

/* class PatientListPage extends StatefulWidget {
  @override
  _PatientListPageState createState() => _PatientListPageState();
}

class _PatientListPageState extends State<PatientListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF26A69A),
        title: Text('Patient Today'),
        // centerTitle: true,
        actions: [
          
          IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HospitelDetailPage(),
                  ),
                );
              },
              icon: Icon(Icons.shopping_cart_rounded)),
          IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HospitelUpdate(),
                  ),
                );
              },
              icon: Icon(Icons.settings)),
          IconButton(
              // ปุ่ม Logout
              onPressed: () {
                
              },
              icon: Icon(Icons.settings_power)),
        ],
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
            colors: [Colors.teal.shade600, Colors.amberAccent],
            begin: Alignment.bottomLeft,
            end: Alignment.bottomRight,
          )),
        ),
      ),
      //body: PatientSearch(),
      body: PatientList(),
    );
  }
}

class PatientSearch extends StatefulWidget {
  @override
  _PatientSearchState createState() => _PatientSearchState();
}

class _PatientSearchState extends State<PatientSearch> {
  final List<Map<String, dynamic>> _allPatient = [
    {"id": 1, "name": "Ganokporn", "age": 28},
    {"id": 2, "name": "Lalisa", "age": 43},
    {"id": 3, "name": "Kornkamon", "age": 25},
    {"id": 4, "name": "Kitti", "age": 35},
    {"id": 5, "name": "Chayanee", "age": 21},
    {"id": 6, "name": "Natthakarn", "age": 58},
    {"id": 7, "name": "Thanaphat", "age": 30},
    {"id": 8, "name": "Punnarat", "age": 54},
    {"id": 9, "name": "Ploypailin", "age": 18},
    {"id": 10, "name": "Kamonned", "age": 32},
    {"id": 11, "name": "Anakin", "age": 15},
    {"id": 12, "name": "Thiti", "age": 23},
    {"id": 13, "name": "Naphat", "age": 37},
    {"id": 14, "name": "Puttipong", "age": 46},
    {"id": 15, "name": "Wongsakorn", "age": 29},
    {"id": 16, "name": "Chotika", "age": 22},
    {"id": 17, "name": "Jirayu", "age": 19},
    {"id": 18, "name": "Pakorn", "age": 40},
    {"id": 19, "name": "Rinlada", "age": 68},
    {"id": 20, "name": "Patcharin", "age": 21},
  ];

  getItemAndNavigate(String item, BuildContext context) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => StatusForm(itemHolder: item)));
  }

  List<Map<String, dynamic>> _foundPatient = [];

  @override
  initState() {
    _foundPatient = _allPatient;
    super.initState();
  }

  void _runFilter(String enteredKeyword) {
    List<Map<String, dynamic>> results = [];

    if (enteredKeyword.isEmpty) {
      results = _allPatient;
    } else {
      results = _allPatient
          .where((user) =>
              user["name"].toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
    }

    setState(() {
      _foundPatient = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              TextField(
                onChanged: (value) => _runFilter(value),
                decoration: InputDecoration(
                    hintText: "Enter patient name",
                    hintStyle: TextStyle(color: Colors.amber),
                    labelText: 'Search Patient',
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    suffixIcon: Icon(Icons.search)),
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(
                child: _foundPatient.length > 0
                    ? ListView.builder(
                        itemCount: _foundPatient.length,
                        itemBuilder: (context, index) => Card(
                          key: ValueKey(_foundPatient[index]["id"]),
                          color: Colors.greenAccent.shade100,
                          elevation: 4,
                          margin: EdgeInsets.symmetric(vertical: 10),
                          child: ListTile(
                            leading: Text(
                              _foundPatient[index]["id"].toString(),
                              style: TextStyle(
                                  fontSize: 27, color: Colors.teal.shade600),
                            ),
                            title: Text(
                              _foundPatient[index]['name'],
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.teal.shade600,
                              ),
                            ),
                            subtitle: Text(
                              '${_foundPatient[index]["age"].toString()} years old',
                              style:
                                  TextStyle(fontSize: 15, color: Colors.grey),
                            ),
                            onTap: () => {
                              getItemAndNavigate(
                                  //_foundPatient.toString(), context)
                                  _foundPatient[index]['name'],
                                  context)
                            },

                            /* onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => StatusForm(),
                                ),
                              );
                            },*/
                          ),
                        ),
                      )
                    : Text(
                        'No results found',
                        style: TextStyle(fontSize: 24),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
*/