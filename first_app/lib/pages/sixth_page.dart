import 'package:flutter/material.dart';

class SixthPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Form'),
      ),
      body: MyCustomForm(),
    );
  }
}

class MyCustomForm extends StatefulWidget {
  @override
  _MyCustomFormState createState() => _MyCustomFormState();
}

class _MyCustomFormState extends State<MyCustomForm> {
  final _formKey = GlobalKey<FormState>();
  String? _fisrtName;
  String? _lastName;
  int? _age;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        // เพื่อวางเลย์เอาท์
        //  mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextFormField(
            decoration: InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Enter your firstname',
              icon: Icon(Icons.business),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter something.';
              }
              return null;
            },
            onSaved: (value) {
              _fisrtName = value;
            },
          ), // TextFormField

          TextFormField(
            decoration: InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Enter your lastname',
              icon: Icon(Icons.family_restroom),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter lastname';
              }
              return null;
            },
            onSaved: (value) {
              _lastName = value;
            },
          ),
          TextFormField(
            decoration: InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Enter your age',
              icon: Icon(Icons.ring_volume),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter age';
              }
              if (int.parse(value) < 18) {
                return 'Please enter valid age';
              }
              return null;
            },
            onSaved: (value) {
              _age = int.parse(value!);
            },
          ),

          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!
                    .save(); // Save ต้องมาหลัง Validate เพื่อเช็คว่ามันถูกต้องตามที่เราต้องการ แล้วเอาค่าไปใส่ในตัวแปรที่เราเก็บไว้

                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text('Hoorayyyyy = $_fisrtName $_lastName $_age'),
                )); // SnackBar

              }
            },
            child: Text('Validate'),
          ),
        ],
      ),
    );
  }
}
