import 'package:final_app/anshistory.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:final_app/models/calculator_provider.dart';
import 'package:final_app/models/history_provider.dart';
import 'package:final_app/anshistory.dart';

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  late String answer;
  late String answerTemp;
  late String inputFull;
  late String operator;
  late bool calculateMode;

  @override
  void initState() {
    answer = "0";
    operator = "";
    answerTemp = "";
    inputFull = "";
    calculateMode = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: Icon(Icons.dehaze_outlined),
        title: Text("Standard"),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AnsHistory()));
                //MaterialPageRoute(builder: (context) => History()));
              },
              icon: Icon(Icons.history)),
        ],
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[buildAnswerWidget(), buildNumPadWidget()],
        ),
      ),
    );
  }

  Widget buildAnswerWidget() {
    return Container(
      padding: EdgeInsets.all(18),
      height: 200.0,
      color: Colors.blueGrey[800],
      child: Align(
        alignment: Alignment.bottomRight,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(inputFull + " " + operator,
                style: TextStyle(fontSize: 18, color: Colors.white)),
            Text(answer,
                style: TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                    color: Colors.white))
          ],
        ),
      ),
    );
  }

  Widget buildNumPadWidget() {
    return Column(
      children: [
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                "MC",
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w300,
                    color: Colors.grey),
              ),
              Text("MR",
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w300,
                      color: Colors.grey)),
              Text("M+",
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w300,
                      color: Colors.white)),
              Text("M-",
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w300,
                      color: Colors.white)),
              Text("MS",
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w300,
                      color: Colors.white))
            ],
          ),
        ),
        Container(
            color: Colors.blueGrey[800],
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Row(children: <Widget>[
                  buildNumberButton("%", numberButton: false, onTap: () {}),
                  buildNumberButton("CE", numberButton: false, onTap: () {
                    clearAnswer();
                  }),
                  buildNumberButton("C", numberButton: false, onTap: () {
                    clearAll();
                  }),
                  buildNumberButton("⌫", numberButton: false, onTap: () {
                    removeAnswerLast();
                  }),
                ]),
                Row(children: <Widget>[
                  buildNumberButton("1/x", numberButton: false, onTap: () {}),
                  buildNumberButton("X²", numberButton: false, onTap: () {}),
                  buildNumberButton("√x", numberButton: false, onTap: () {}),
                  buildNumberButton("÷", numberButton: false, onTap: () {
                    addOperatorToAnswer("÷");
                  }),
                ]),
                Row(children: <Widget>[
                  buildNumberButton("7", numberButton: true, onTap: () {
                    addNumberToAnswer(7);
                  }),
                  buildNumberButton("8", numberButton: true, onTap: () {
                    addNumberToAnswer(8);
                  }),
                  buildNumberButton("9", numberButton: true, onTap: () {
                    addNumberToAnswer(9);
                  }),
                  buildNumberButton("×", numberButton: false, onTap: () {
                    addOperatorToAnswer("×");
                  }),
                ]),
                Row(children: <Widget>[
                  buildNumberButton("4", numberButton: true, onTap: () {
                    addNumberToAnswer(4);
                  }),
                  buildNumberButton("5", numberButton: true, onTap: () {
                    addNumberToAnswer(5);
                  }),
                  buildNumberButton("6", numberButton: true, onTap: () {
                    addNumberToAnswer(6);
                  }),
                  buildNumberButton("-", numberButton: false, onTap: () {
                    addOperatorToAnswer("-");
                  }),
                ]),
                Row(children: <Widget>[
                  buildNumberButton("1", numberButton: true, onTap: () {
                    addNumberToAnswer(1);
                  }),
                  buildNumberButton("2", numberButton: true, onTap: () {
                    addNumberToAnswer(2);
                  }),
                  buildNumberButton("3", numberButton: true, onTap: () {
                    addNumberToAnswer(3);
                  }),
                  buildNumberButton("+", numberButton: false, onTap: () {
                    addOperatorToAnswer("+");
                  }),
                ]),
                Row(children: <Widget>[
                  buildNumberButton("±", numberButton: false, onTap: () {
                    toggleNegative();
                  }),
                  buildNumberButton("0", numberButton: true, onTap: () {
                    addNumberToAnswer(0);
                  }),
                  buildNumberButton(".", numberButton: false, onTap: () {
                    addDotToAnswer();
                  }),
                  buildNumberButton("=", numberButton: false, onTap: () {
                    context.read<CalculatorProvider>().inputfull = inputFull;
                    context.read<CalculatorProvider>().symbol = operator;
                    context.read<CalculatorProvider>().anstemp = answer;
                    calculate();
                    context.read<CalculatorProvider>().result = answer;
                  }),
                ]),
              ],
            )),
      ],
    );
  }

  void toggleNegative() {
    setState(() {
      if (answer.contains("-")) {
        answer = answer.replaceAll("-", "");
      } else {
        answer = "-" + answer;
      }
    });
  }

  void clearAnswer() {
    setState(() {
      answer = "0";
    });
  }

  void clearAll() {
    setState(() {
      answer = "0";
      inputFull = "";
      answerTemp = "";
      calculateMode = false;
      operator = "";
    });
  }

  void calculate() {
    setState(() {
      if (calculateMode) {
        bool decimalMode = false;
        double value = 0;
        if (answer.contains(".") || answerTemp.contains(".")) {
          decimalMode = true;
        }

        if (operator == "+") {
          value = (double.parse(answerTemp) + double.parse(answer));
        } else if (operator == "-") {
          value = (double.parse(answerTemp) - double.parse(answer));
        } else if (operator == "×") {
          value = (double.parse(answerTemp) * double.parse(answer));
        } else if (operator == "÷") {
          value = (double.parse(answerTemp) / double.parse(answer));
        }

        if (!decimalMode) {
          answer = value.toInt().toString();
        } else {
          answer = value.toString();
        }

        calculateMode = false;
        operator = "";
        answerTemp = "";
        inputFull = "";
      }
    });
  }

  void addOperatorToAnswer(String op) {
    setState(() {
      if (answer != "0" && !calculateMode) {
        calculateMode = true;
        answerTemp = answer;
        inputFull += operator + " " + answerTemp;
        operator = op;
        answer = "0";
      } else if (calculateMode) {
        if (answer.isNotEmpty) {
          calculate();
          answerTemp = answer;
          inputFull = "";
          operator = "";
        } else {
          operator = op;
        }
      }
    });
  }

  void addDotToAnswer() {
    setState(() {
      if (!answer.contains(".")) {
        answer = answer + ".";
      }
    });
  }

  void addNumberToAnswer(int number) {
    setState(() {
      if (number == 0 && answer == "0") {
      } else if (number != 0 && answer == "0") {
        answer = number.toString();
      } else {
        answer += number.toString();
      }
    });
  }

  void removeAnswerLast() {
    if (answer == "0") {
    } else {
      setState(() {
        if (answer.length > 1) {
          answer = answer.substring(0, answer.length - 1);
          if (answer.length == 1 && (answer == "." || answer == "-")) {
            answer = "0";
          }
        } else {
          answer = "0";
        }
      });
    }
  }

  Expanded buildNumberButton(String str,
      {bool numberButton = true, required Function() onTap}) {
    if (numberButton) {
      return Expanded(
          child: InkWell(
        onTap: onTap,
        child: Container(
            margin: EdgeInsets.all(1),
            color: Colors.black,
            height: 70,
            child: Center(
                child: Text(str,
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w300,
                        color: Colors.white)))),
      ));
    } else {
      return Expanded(
          child: InkWell(
        onTap: onTap,
        child: Container(
            margin: EdgeInsets.all(1),
            color: Colors.blueGrey.shade800,
            height: 70,
            child: Center(
                child: Text(str,
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w300,
                        color: Colors.white)))),
      ));
    }
  }
}
