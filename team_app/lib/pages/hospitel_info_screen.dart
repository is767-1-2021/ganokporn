import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:team_app/controllers/hospitel_info_controller.dart';
import 'package:team_app/models/hospital_model.dart';
import 'package:team_app/models/hospital_clas.dart';
import 'package:team_app/models/hospitel_info_class.dart';
import 'package:team_app/pages/patient_list_page.dart';
//import 'package:team_app/services/hospital_service.dart';
import 'package:team_app/services/hospitel_info_service.dart';
import 'package:provider/provider.dart';

//import 'package:team_app/models/HospitalFormModel.dart';
//import 'package:team_app/pages/hospital_home_page.dart';
//import 'login_page.dart';

class HostpitelInfoScreen extends StatefulWidget {
  @override
  _HostpitelInfoScreenState createState() => _HostpitelInfoScreenState();
}

class _HostpitelInfoScreenState extends State<HostpitelInfoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ข้อมูลโรงพยาบาลสนาม'),
        //backgroundColor: iBlueColor,
        actions: [
          IconButton(
            onPressed: () {},
            /*onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LogInScreen()),
              );
            },*/
            icon: Icon(Icons.logout),
          ),
        ],
      ),
      body: HostpitelInfoState(),
    );
  }
}

class HostpitelInfoState extends StatefulWidget {
  @override
  _HostpitelInfoState createState() => _HostpitelInfoState();
}

class _HostpitelInfoState extends State<HostpitelInfoState> {
  final _formKey = GlobalKey<FormState>();
  int? _hospitelNumber;
  String? _hospitelName;
  String? _addressName;
  String? _phoneNumber;
  int? _numberPatient;
  int? _numberStaff;
  int listLength = 0;
  var service = HospitelInfoServices();
  var controller;
  _HostpitelInfoState() {
    controller = HospitelInfoController(service);
  }

  @override
  Widget build(BuildContext context) {
    List<Hospital> _hospitalList = [];
    if (context.read<HospitalFormModel>().hospitalList != null) {
      _hospitalList = context.read<HospitalFormModel>().hospitalList;
      listLength = _hospitalList.length;
    }
    return SingleChildScrollView(
      padding: EdgeInsets.all(8.0),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              decoration: InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'ระบุรหัสโรงพยาบาลสนาม',
                icon: Icon(Icons.business),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'ระบุรหัสโรงพยาบาลสนาม';
                }

                return null;
              },
              onSaved: (value) {
                _hospitelNumber = int.parse(value!);
              },
              initialValue:
                  context.read<HospitalFormModel>().hospitalId.toString(),
            ),
            TextFormField(
              decoration: InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'ระบุชื่อโรงพยาบาลสนาม',
                icon: Icon(Icons.business),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'ระบุชื่อโรงพยาบาลสนาม';
                }
                return null;
              },
              onSaved: (value) {
                _hospitelName = value;
              },
              initialValue: context.read<HospitalFormModel>().hospitalName,
            ),
            TextFormField(
              decoration: InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'ระบุที่อยู่โรงพยาบาล',
                icon: Icon(Icons.home_filled),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'กรุณาระบุที่อยู่';
                }
                return null;
              },
              onSaved: (value) {
                _addressName = value;
              },
              initialValue: context.read<HospitalFormModel>().addressName,
            ),
            TextFormField(
              decoration: InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'ระบุเบอร์โทรศัพท์',
                icon: Icon(Icons.ring_volume),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'กรุณาระบุเบอร์โทรศัพท์';
                }
                return null;
              },
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))
              ],
              onSaved: (value) {
                _phoneNumber = value;
              },
              initialValue: context.read<HospitalFormModel>().phoneNumber ==
                      null
                  ? ''
                  : context.read<HospitalFormModel>().phoneNumber.toString(),
            ),
            TextFormField(
              decoration: InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'ระบุจำนวนคนที่รองรับได้',
                icon: Icon(Icons.people_rounded),
              ),
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))
              ],
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'กรุณาระบุจำนวนคนที่รองรับได้';
                }
                return null;
              },
              onSaved: (value) {
                _numberPatient = int.parse(value!);
              },
              initialValue: context.read<HospitalFormModel>().allQueu == null
                  ? ''
                  : context.read<HospitalFormModel>().allQueu.toString(),
            ),
            TextFormField(
              decoration: InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'จำนวนเจ้าหน้าที่ที่ปฎิบัติงาน',
                icon: Icon(Icons.people),
              ),
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))
              ],
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'กรุณาระบุจำนวนเจ้าหน้าที่ที่ปฎิบัติงาน';
                }
                return null;
              },
              onSaved: (value) {
                _numberStaff = int.parse(value!);
              },
              initialValue: context.read<HospitalFormModel>().avaliableQueue ==
                      null
                  ? ''
                  : context.read<HospitalFormModel>().avaliableQueue.toString(),
            ),
            Container(
              margin: EdgeInsets.only(top: 250),
              width: MediaQuery.of(context).size.width,
              child: FlatButton(
                shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(30.0),
                ),
                height: 60,
                //color: iBlueColor,
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    // _formKey.currentState!.save();
                    context.read<HospitalFormModel>().hospitalId =
                        _hospitelNumber;
                    context.read<HospitalFormModel>().hospitalName =
                        _hospitelName;
                    context.read<HospitalFormModel>().addressName =
                        _addressName;
                    context.read<HospitalFormModel>().phoneNumber =
                        _phoneNumber;
                    context.read<HospitalFormModel>().numberPatient =
                        _numberPatient;
                    context.read<HospitalFormModel>().numberStaff =
                        _numberStaff;
                    context.read<HospitalFormModel>().avaliableQueue = 20;
                    context.read<HospitalFormModel>().allQueu = 100;

                    context.read<HospitalFormModel>().hospitalId =
                        listLength + 1;

                    //add to firebase
                    controller.addhospitelInfo(new BHospitel(
                        _hospitelNumber!,
                        _hospitelName!,
                        _addressName!,
                        _phoneNumber!,
                        _numberPatient!,
                        _numberStaff!));

                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => PatientList()));
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          content: Text('บันทีกข้อมูลเรียบร้อยแล้ว')),
                    );
                  }
                },
                child: Text('บันทึก',
                    style: TextStyle(fontSize: 20, color: Colors.red)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
