import 'package:first_app/models/first_form_model.dart';
import 'package:first_app/pages/second_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FirstPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  // String? _formData = 'Please click to fill the form';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Page'),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.arrow_forward)),
          IconButton(onPressed: () {}, icon: Icon(Icons.agriculture)),
          IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SecondPage(), // Routing on the fly
                  ),
                );
              },
              icon: Icon(Icons.bus_alert)),
          IconButton(
              onPressed: () {
                Navigator.pushNamed(
                    context, '/3'); // ใช้ route ที่เรามีอยู่แล้ว
              },
              icon: Icon(Icons.medication)),
          IconButton(onPressed: () {}, icon: Icon(Icons.food_bank)),
        ],
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(20.0),
              // child: Text('$_formData'),
              child: Consumer<FirstFormModel>(
                builder: (context, form, child) {
                  return Text(
                      '${form.firstName} ${form.lastName} ${form.age}'); // รับข้อมูลจาก Provider
                },
              ),
            ),
            /* ElevatedButton(
              onPressed: () async {
                var response = await Navigator.pushNamed(context, '/6');
                // ส่งค่าไปหน้า 6

                if (response != null && !response.toString().isEmpty) {
                  setState(() {
                    _formData = response.toString();
                  });
                } */
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/6');
              },
              /* ScaffoldMessenger.of(context).showSnackBar(snackBar(
              content: Text(response.toString()), 
            ));
          }, */
              child: Text('Fill the form please'),
            ),
          ],
        ),
      ),
    );
  }
}
