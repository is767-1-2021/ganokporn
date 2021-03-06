import 'package:flutter/material.dart';
import 'package:midterm_app/models/midterm_form_model.dart';
import 'package:midterm_app/pages/hostpitel_info_page.dart';
import 'package:provider/provider.dart';

class MidtermForm extends StatelessWidget {
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
          child: StatusFormm()),
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
            SizedBox(height: 20),
            Text(
              'Patient Detail',
              style: TextStyle(
                color: Colors.teal.shade300,
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
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
                      labelText: 'Enter firstname',
                      icon: Icon(Icons.account_box_outlined),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter FirstName.';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _firstName = value;
                    },
                    initialValue: context.read<MidtermFormModel>().firstName,
                  ),
                  TextFormField(
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
                    initialValue: context.read<MidtermFormModel>().lastName,
                  ),
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
                    initialValue: context.read<MidtermFormModel>().pid,
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
                    initialValue: context.read<MidtermFormModel>().checkin,
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
                    initialValue: context.read<MidtermFormModel>().checkout,
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
                      context.read<MidtermFormModel>().firstName = _firstName;
                      context.read<MidtermFormModel>().lastName = _lastName;
                      context.read<MidtermFormModel>().pid = _pid;
                      context.read<MidtermFormModel>().checkin = _checkin;
                      context.read<MidtermFormModel>().checkout = _checkout;
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
