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

/*
class StatusForm extends StatelessWidget {
  const StatusForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'อัพเดทข้อมูลผู้เข้าพัก',
          style: TextStyle(
            fontSize: 20, fontWeight: FontWeight.w700,
            // color: iWhiteColor
            // ),
          ),
        ),
        //backgroundColor: iBlueColor,
      ),
      body: StatusFormUpdate,
    );
  }
}

class StatusFormUpdate extends StatefulWidget {
  const StatusFormUpdate({Key? key}) : super(key: key);
  @override
  _StatusFormUpdateState createState() => _StatusFormUpdateState();
}

class _StatusFormUpdateState extends State<StatusFormUpdate> {
  final _formkey = GlobalKey<FormState>();
  String? _start_date;
  String? _end_date;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formkey,
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                decoration: InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'วันที่เข้าห้องพัก',
                  labelStyle: TextStyle(
                    //color: iBlackColor,
                    fontWeight: FontWeight.w700,
                    fontSize: 23,
                  ),
                  enabledBorder: UnderlineInputBorder(
                      //borderSide: BorderSide(color: iBlueColor),
                      ),
                  focusedBorder: UnderlineInputBorder(
                      //borderSide: BorderSide(color: iBlueColor),
                      ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'โปรดระบุวันที่เข้าห้องพัก';
                  }
                  return null;
                },
                onSaved: (value) {
                  _start_date = value;
                },
                initialValue: (context.read<PatientModel>().start_date),
              ),
              TextFormField(
                decoration: InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'วันที่ออกจากห้องพัก',
                  labelStyle: TextStyle(
                    //color: iBlackColor,
                    fontWeight: FontWeight.w700,
                    fontSize: 23,
                  ),
                  enabledBorder: UnderlineInputBorder(
                      //borderSide: BorderSide(color: iBlueColor),
                      ),
                  focusedBorder: UnderlineInputBorder(
                      //borderSide: BorderSide(color: iBlueColor),
                      ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'โปรดระบุวันที่ออกจากห้องพัก';
                  }
                  return null;
                },
                onSaved: (value) {
                  _end_date = value;
                },
                initialValue: (context.read<PatientModel>().end_date),
              ),
              SizedBox(width: 20, height: 50),
              Container(
                height: 60,
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                  child: Text('อัพเดทข้อมูล'),
                  style: ElevatedButton.styleFrom(
                      //primary: iBlueColor,
                      ),
                  onPressed: () {
                    if (_formkey.currentState!.validate()) {
                      _formkey.currentState!.save();

                      List<PatientUpdate> patientlistupdate = [];

                      context.read<PatientsListModel>().start_date = 's';
                      context.read<PatientsListModel>().end_date = 's';
                      if (context.read<PatientsListModel>().start_date != null) {
                        patientlistupdate =
                            context.read<PatientsListModel>().end_date;
                        print('///');
                      }
                      // Add,Update state
                      patientlistupdate.add(Patient(
                        start_date:'';
                        end_date: '';

                      ));
                      void service = FirebaseServices();
                      Patient controller = PatientUpadateController(service);
                      controller.addPatientUpadateItem(new Patient(
                        start_date:'';
                        end_date: '';
                      ));


                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void _showDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('รับบทนางบันทึก !'),
        content: Text(
            'ระบบทำการบันทึกข้อมูลอัพเดทวันเข้า-ออกของผู้เข้าพักเรียบร้อยแล้ว'),
        actions: [
          ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => PatientList()));
              },
              child: Text('แฮปปี้'))
        ],
      );
    },
  );
}

*/
// ----------------------------------โค้ดก่อนสอบมิดเทอม----------------------------------------------------------

/* class StatusForm extends StatelessWidget {
  final String itemHolder;

  const StatusForm({Key? key, required this.itemHolder}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.cyan.shade100,
        elevation: 0.0,
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.chevron_left,
            color: Colors.white,
            size: 30,
          ),
        ),
        title: Text(
          'Patient Status',
          style: TextStyle(color: Colors.white, fontSize: 25),
        ),
      ),
      body: Container(
          height: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/form-bg1.jpg"), fit: BoxFit.cover),
          ),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  '${itemHolder} Detail',
                  style: TextStyle(
                    color: Colors.teal.shade700,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                StatusFormm()
              ])),
    );
  }
}

class StatusFormm extends StatefulWidget {
  @override
  _StatusFormState createState() => _StatusFormState();
}

class _StatusFormState extends State<StatusFormm> {
  final _formKey = GlobalKey<FormState>();
  String? _firstName;
  String? _lastName;
  String? _checkin;
  String? _checkout;
  // int? _id;
  String? _pid;
  bool morning = false;
  bool afternoon = false;
  bool night = false;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            /*SizedBox(height: 20),
            Text(
              'Patient Detail',
              style: TextStyle(
                color: Colors.teal.shade300,
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),*/
            SizedBox(height: 10),
            Container(
              height: 310,
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.symmetric(horizontal: 20),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.8),
                // color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(15),

                /* boxShadow: [
                  BoxShadow(
                    color: Colors.white,
                    blurRadius: 10,
                    offset: Offset(2, 3),
                  ),
                ],*/
              ),
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'Enter Full Name',
                      icon: Icon(Icons.account_box_outlined),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter Full Name';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _firstName = value;
                    },
                    initialValue: context.read<PatientFormModel>().firstName,
                  ),
                  /* TextFormField(
                    decoration: InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'Enter lastname',
                      icon: Icon(Icons.family_restroom),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter lastname.';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _lastName = value;
                    },
                    initialValue: context.read<PatientFormModel>().lastName,
                  ),*/
                  TextFormField(
                    decoration: InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'Enter ID 13 digit',
                      icon: Icon(Icons.accessibility_new_sharp),
                    ),
                    validator: (value) {
                      if (value == null ||
                          value.isEmpty ||
                          value.length != 13) {
                        return 'Please enter ID';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _pid = value;
                    },
                    initialValue: context.read<PatientFormModel>().pid,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'Check-in date',
                      hintText: 'DD/MM/YYY',
                      icon: Icon(Icons.airline_seat_flat_outlined),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter date.';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _checkin = value;
                    },
                    initialValue: context.read<PatientFormModel>().checkin,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'Check-out date',
                      hintText: 'DD/MM/YYYY',
                      icon: Icon(Icons.airline_seat_recline_extra_rounded),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter date';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _checkout = value;
                    },
                    initialValue: context.read<PatientFormModel>().checkout,
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),
            Text(
              "when did patient arrive?",
              style: TextStyle(
                color: Colors.teal.shade300,
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      morning = !morning;
                    });
                  },
                  child: naxtCard(
                    icon: Icons.cloud_rounded,
                    next: 'Morning',
                    isSelected: morning,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      afternoon = !afternoon;
                    });
                  },
                  child: naxtCard(
                    icon: Icons.wb_sunny,
                    next: 'Afternoon',
                    isSelected: afternoon,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      night = !night;
                    });
                  },
                  child: naxtCard(
                    icon: Icons.star_rate_sharp,
                    next: 'Night',
                    isSelected: night,
                  ),
                ),
              ],
            ),
            SizedBox(height: 40),
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: ElevatedButton.icon(
                label: Text('Save Data'),
                icon: Icon(Icons.download_for_offline_outlined),
                style: ElevatedButton.styleFrom(
                  primary: Colors.teal.shade300,
                  fixedSize: Size(300, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40),
                  ),
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    setState(() {
                      context.read<PatientFormModel>().firstName = _firstName;
                      context.read<PatientFormModel>().lastName = _lastName;
                      context.read<PatientFormModel>().pid = _pid;
                      context.read<PatientFormModel>().checkin = _checkin;
                      context.read<PatientFormModel>().checkout = _checkout;
                    });
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HospitelInfoPage(),
                      ),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class naxtCard extends StatelessWidget {
  const naxtCard({
    Key? key,
    required this.icon,
    required this.next,
    this.isSelected,
  }) : super(key: key);
  final IconData icon;
  final String next;
  final isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      width: 90,
      margin: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: isSelected ? Colors.green.shade700 : Colors.red.shade700,
            blurRadius: 10,
            offset: Offset(2, 3),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: isSelected ? Colors.green.shade700 : Colors.red.shade700,
            size: 30,
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            next,
            style: TextStyle(
              color: isSelected ? Colors.green.shade700 : Colors.red.shade700,
              fontSize: 14,
            ),
          )
        ],
      ),
    );
  }
}
*/
