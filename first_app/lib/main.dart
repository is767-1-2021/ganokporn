import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // primarySwatch: Colors.blue,
        primaryColor: Colors.amber,
        accentColor: Colors.red,
        textTheme: TextTheme(
          bodyText2: TextStyle(color: Colors.purple),
        ),
      ),
      // home: MyHomePage(title: 'Ganokporn and My POPCAt'),
      initialRoute: '/first', 
      routes: <String, WidgetBuilder> {
        /* '/': (BuildContext context) {
          return Scaffold(
            appBar: AppBar(title: Text('Home Route')),
          ); // Scaffold
        },
        'about': (BuildContext context) {
          return Scaffold(
            appBar: AppBar(title: Text('About Route')),
          );
        }, */

        '/first': (context) => FirstPage(),
        '/second': (context) => SecondPage(),
        '/third': (context) => ThirdPage(),
        '/fourth': (context) => FourthPage(),
      }
    ); // MaterialApp
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  Image cat = Image.asset(
    'assets/popcat2.png',
    width: 150,
  );

   Image cat1 = Image.asset(
    'assets/popcat1.png',
    width: 150,
  ); 

  Image cat2 = Image.asset(
    'assets/popcat2.png',
    width: 150,
  ); 

  void _incrementCounter() {
    setState(() { //refresh แล้วเก็บค่าไว้ต้องใช้ setstate ทุกครั้ง
      cat = cat2;
      _counter++;
    });
  }

  void _decreaseCounter() {
    setState(() {
      cat = cat1;
      _counter--;
    });
  } 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, //กำหนดว่าข้อมูลเราจะอยู่ส่วนไหนของจอ เช่น center
          children: <Widget>[
            Container(
              height: 200.0,
              margin: EdgeInsets.only(
                left: 100.0,
                right: 100.0,
                bottom:20.0
              ),
              padding: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: Colors.amber.withOpacity(0.25),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: cat,
            ), //Container
      
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green,
                  ),
                  onPressed: _decreaseCounter, 
                  child: Text('Decrease'),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.red,
                  ),
                  onPressed: _incrementCounter, 
                  child: Text('Increase'),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.fingerprint),
      ), 
    );
  }
}

class SubmitButton extends StatelessWidget {
  final String buttonText;
  SubmitButton(this.buttonText);

  

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text(this.buttonText),
      onPressed: (){
        print('Pressing');
      },
    );
  }
}


class FirstPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Page'),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.arrow_forward)),
          IconButton(onPressed: () {}, icon: Icon(Icons.agriculture)),
          IconButton(onPressed: () {}, icon: Icon(Icons.bus_alert)),
          IconButton(onPressed: () {}, icon: Icon(Icons.medication)),
          IconButton(onPressed: () {}, icon: Icon(Icons.food_bank)),
        ], // AppBar
      ), //Scaffold
    );
  }
}

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


class ThirdPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 3,
      child: Scaffold(
      appBar: AppBar(
        title: Text('Third Page'),
        bottom: TabBar(
          tabs: [
            Tab(
              icon: Icon(Icons.cloud)
            ),
            Tab(
              icon: Icon(Icons.beach_access_outlined),
            ),
            Tab(
              icon: Icon(Icons.brightness_1_outlined),
            ),
          ],
        ),
      ),
      body: TabBarView(
        children: [
          Center(
            child: Text('Cloud'),
          ),
          Center(
            child: Text('Sunny'),
          ),
          Center(
            child: Text('Umbrella'),
          ),
        ],
      ),
    ),
  );
}
}


class FourthPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final List<String> entries = <String>['A','B','C','D','E','F','G','H','I','J','K','M','N'];
    final List<int> colorCodes = <int>[600,500,100];

    return Scaffold(
      appBar: AppBar(
        title: Text('Listview Example'),
      ),

      body: ListView.separated(
         padding: EdgeInsets.all(8.0),
         itemCount: entries.length,
         itemBuilder: (context, index) {
           return Container(
             height: 100,
             color: Colors.amber[colorCodes[index % 3]],
             child: Center(
                child: Text('Entry ${entries[index]}'),
          ),
        );
      },
      separatorBuilder: (context, index) => Divider(),
    ),
    );
  }
}