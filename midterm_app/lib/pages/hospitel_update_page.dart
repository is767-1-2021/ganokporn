import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:midterm_app/models/midterm_form_model.dart';

class HospitelUpdate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('Hospite Update'),
        backgroundColor: Colors.teal,
      ),
      body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.white, Colors.teal],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: HospitelUpdateForm()),
    );
  }
}

class HospitelUpdateForm extends StatefulWidget {
  @override
  _HospitelUpdateFormState createState() => _HospitelUpdateFormState();
}

class _HospitelUpdateFormState extends State<HospitelUpdateForm> {
  final _formKey = GlobalKey<FormState>();
  String? _hName;
  String? _hAddress;
  String? _hTel;
  String? _hBed;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            decoration: InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'ระบุชื่อสถานพยาบาลผู้ป่วยเฉพาะกิจ',
              icon: Icon(Icons.local_hospital_outlined),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'กรุณาระบุชื่อสถานพยาบาลผู้ป่วยเฉพาะกิจ';
              }
              return null;
            },
            onSaved: (value) {
              _hName = value;
            },
            initialValue: context.read<MidtermFormModel>().hName,
          ),
          TextFormField(
            decoration: InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'ระบุที่อยู่ของสถานพยาบาลผู้ป่วยเฉพาะกิจ',
              icon: Icon(Icons.home_work_outlined),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'กรุณาระบุที่อยู่ของสถานพยาบาลผู้ป่วยเฉพาะกิจ';
              }
              return null;
            },
            onSaved: (value) {
              _hAddress = value;
            },
            initialValue: context.read<MidtermFormModel>().hAddress,
          ),
          TextFormField(
            decoration: InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'ระบุเบอร์โทรศัพท์ที่สามารถติดต่อได้',
              icon: Icon(Icons.phone_in_talk_sharp),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'กรุณาระบุเบอร์โทรศัพท์';
              }
              return null;
            },
            onSaved: (value) {
              _hTel = value;
            },
            initialValue: context.read<MidtermFormModel>().hTel,
          ),
          TextFormField(
            decoration: InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'ระบุจำนวนเตียงที่สามารถรองรับได้',
              icon: Icon(Icons.bed),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'กรุณาระบุจำนวนเตียงที่สามารถรองรับได้';
              }
              return null;
            },
            onSaved: (value) {
              _hBed = value;
            },
            initialValue: context.read<MidtermFormModel>().hBed,
          ),
          SizedBox(height: 40),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: ElevatedButton.icon(
              label: Text('Send Data'),
              icon: Icon(Icons.forward_to_inbox_sharp),
              style: ElevatedButton.styleFrom(
                  primary: Colors.teal, fixedSize: Size(300, 50)),
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();

                  context.read<MidtermFormModel>().hName = _hName;
                  context.read<MidtermFormModel>().hAddress = _hAddress;
                  context.read<MidtermFormModel>().hTel = _hTel;
                  context.read<MidtermFormModel>().hBed = _hBed;

                  Navigator.pop(context);
                }
              },
              // child: Text('Send Data'),
            ),
          )
        ],
      ),
    );
  }
}
