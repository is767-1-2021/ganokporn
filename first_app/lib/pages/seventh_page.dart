import 'package:flutter/material.dart';

class SeventhPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Faked Animated Pic'),
      ), // appBar
      body: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MovedCat()),
          );
        },
        // child: Hero( บนซ้าย
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Hero(
              // Hero ต้องการ Tag เพื่อบอกว่าคืออะไร
              tag: 'Cat',
              child: Image.asset(
                'assets/popcat2.png',
                width: 120,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MovedCat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Center(
          child: Hero(
            tag: 'Cat',
            child: Image.asset(
              'assets/popcat2.png',
              width: 120,
            ),
          ),
        ),
      ),
    );
  }
}
