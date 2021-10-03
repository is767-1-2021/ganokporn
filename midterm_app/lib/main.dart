import 'package:flutter/material.dart';
import 'package:midterm_app/models/midterm_form_model.dart';
import 'package:provider/provider.dart';
import 'package:midterm_app/pages/blank_page.dart';
import 'package:midterm_app/pages/form_midterm.dart';
import 'package:midterm_app/pages/hospitel_detail_page.dart';
import 'package:midterm_app/pages/hospitel_update_page.dart';
import 'package:midterm_app/pages/hostpitel_info_page.dart';
import 'package:midterm_app/pages/patient_list_page.dart';

void main() {
  runApp(
    // Multi Provider
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => MidtermFormModel(),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.amber,
        accentColor: Colors.yellow,
        textTheme: TextTheme(
          bodyText2: TextStyle(color: Colors.purple),
        ),
      ),
      initialRoute: '/1',
      routes: <String, WidgetBuilder>{
        '/1': (context) => Midterm(),
        '/2': (context) => PatientListPage(),
        '/3': (context) => MidtermForm(),
        '/4': (context) => HospitelInfoPage(),
        '/5': (context) => HospitelDetailPage(),
        '/6': (context) => BlankPage(),
      },
    ); // MaterialApp
  }
}

class Midterm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Home Page'),
          backgroundColor: Colors.black,
          centerTitle: true,
        ),
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage("assets/bgmidterm.jpg"),
            fit: BoxFit.cover,
          )),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ElevatedButton.icon(
                  label: Text('Patient List'),
                  icon: Icon(
                    Icons.people_alt,
                    color: Colors.black,
                    size: 30,
                  ),
                  style: ElevatedButton.styleFrom(
                    textStyle: TextStyle(
                      fontSize: 20,
                    ),
                    primary: Colors.amber.shade400,
                    fixedSize: Size(300, 80),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/2');
                  },
                ),
                ElevatedButton.icon(
                  label: Text('Patient status'),
                  icon: Icon(
                    Icons.file_copy,
                    color: Colors.black,
                    size: 30,
                  ),
                  style: ElevatedButton.styleFrom(
                    textStyle: TextStyle(
                      fontSize: 20,
                    ),
                    primary: Colors.pink.shade300,
                    fixedSize: Size(300, 80),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/3');
                  },
                ),
                ElevatedButton.icon(
                  label: Text('Information Update'),
                  icon: Icon(
                    Icons.file_download,
                    color: Colors.black,
                    size: 40,
                  ),
                  style: ElevatedButton.styleFrom(
                    textStyle: TextStyle(
                      fontSize: 20,
                    ),
                    primary: Colors.greenAccent.shade400,
                    fixedSize: Size(300, 80),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/4');
                  },
                ),
                ElevatedButton.icon(
                  label: Text('Hospitel Detail'),
                  icon: Icon(
                    Icons.lock,
                    color: Colors.black,
                    size: 30,
                  ),
                  style: ElevatedButton.styleFrom(
                    textStyle: TextStyle(
                      fontSize: 20,
                    ),
                    primary: Colors.purpleAccent,
                    fixedSize: Size(300, 80),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/5');
                  },
                ),
                ElevatedButton.icon(
                  label: Text('Blank Page'),
                  icon: Icon(
                    Icons.star_border,
                    color: Colors.black,
                    size: 40,
                  ),
                  style: ElevatedButton.styleFrom(
                    textStyle: TextStyle(
                      fontSize: 20,
                    ),
                    primary: Colors.limeAccent.shade700,
                    fixedSize: Size(300, 80),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/6');
                  },
                ),
                ElevatedButton.icon(
                  label: Text('Blank Page'),
                  icon: Icon(
                    Icons.favorite,
                    color: Colors.black,
                    size: 40,
                  ),
                  style: ElevatedButton.styleFrom(
                    textStyle: TextStyle(
                      fontSize: 20,
                    ),
                    primary: Colors.brown,
                    fixedSize: Size(300, 80),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/6');
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
