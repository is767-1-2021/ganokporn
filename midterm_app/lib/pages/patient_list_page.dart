import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:midterm_app/main.dart';
import 'package:midterm_app/pages/form_midterm.dart';
import 'package:midterm_app/pages/hospitel_update_page.dart';
import 'package:midterm_app/pages/hostpitel_info_page.dart';
import 'package:midterm_app/pages/blank_page.dart';
import 'package:midterm_app/pages/hospitel_detail_page.dart';

class PatientListPage extends StatefulWidget {
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
          /* IconButton(
              onPressed: () {
                showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1990),
                    lastDate: DateTime(2050));
              },
              icon: Icon(Icons.calendar_today)),
              */
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
                /* Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ...(),
                  ),
                );*/
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
      body: PatientSearch(),
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

  /* getItemAndNavigate(String item, BuildContext context) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => StatusForm(itemHolder: item)));
  }*/

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
                            /* onTap: () => {
                              getItemAndNavigate(
                                  _foundPatient.toString(), context)
                            },*/

                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Midterm(),
                                ),
                              );
                            },
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
