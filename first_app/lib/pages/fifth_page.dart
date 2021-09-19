import 'package:flutter/material.dart';

class FifthPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Grid View'),
      ), // appBar
      body: GridView.count(
        // กำหนดความกว้างของแกนแนวนอน
        crossAxisCount: 2,
        children: List.generate(7, (index) {
          // Class List identify item
          return InkWell(
            onTap: () {
              Navigator.pushNamed(context, '/${index + 1}');
              /* ScaffoldMeessenger.of(context).showSnackBar(SnackBar( // when i press
              context: Text('Tap at $index'),
            )); // SnackBar */
            },
            child: Container(
              margin: EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                color: Theme.of(context).accentColor,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Center(
                child: Text(
                  'Page ${index + 1}',
                  style: Theme.of(context).textTheme.headline5, //
                ), // Text
              ),
            ),
          ); // Center
        }), // List.generate
      ), // Grid View
    ); // Scaffold
  }
}
