import 'package:flutter/material.dart';


class SecondPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Page'),
        centerTitle: true,
      ), //AppBar
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.build_sharp),
        onPressed: () {},
        ), // FloatingActionButton
        body: Center(
          // child: Text(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text (
                    'Here is the text formatted by theme data',
                ), // Text
                Table(
                  children: [
                    TableRow(
                      children: [
                        Container(
                       child: Center(child: Text('No')),
                        decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ), 
                    Container(
                      child: Center(child: Text('Name')),
                        decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    Container(
                      child: Center(child: Text('Gender')),
                        decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ]
                ),
                TableRow(
                   children: [
                      Center(child: Text('1')),
                      Center(child: Text('Ganok Map')),
                      Center(child: Text('Female'))
                  ]
                ), //TableRow
                TableRow(
                    children: [
                      Center(child: Text('2')),
                      Text('Kim Heechul'),
                      Text('Male')
                  ]
                ),
                TableRow(
                  children: [
                    Center(child: Text('3')),
                    Text('Aileen Int'),
                    Text('Female'),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}