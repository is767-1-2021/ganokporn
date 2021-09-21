import 'package:flutter/cupertino.dart';

class FirstFormModel extends ChangeNotifier {
  String? _firstName;
  String? _lastName;
  int? age;

  // ลากคลุมตัวแปร 3 ตัว คลิดขวา Generate getter setter + เพิ่ม notifyListeners ด้วย

  get firstName => this._firstName;

  set firstName(value) {
    this._firstName = value;
    notifyListeners();
  }

  get lastName => this._lastName;

  set lastName(value) {
    this._lastName = value;
    notifyListeners();
  }

  get getAge => this.age;

  set setAge(age) {
    this.age = age;
    notifyListeners();
  }
}
