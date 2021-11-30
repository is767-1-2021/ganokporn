import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:final_app/calculator.dart';
import 'package:provider/provider.dart';
import 'package:final_app/models/history_provider.dart';
import 'package:final_app/models/calculator_provider.dart';
import 'package:final_app/services/history_service.dart';
import 'package:final_app/controllers/history_controller.dart';

class AnsHistory extends StatefulWidget {
  var service = FirebaseServiceAnsHistorylist();
  var controller;
  AnsHistory() {
    controller = AnsHistorylistController(service);
  }
  @override
  _AnsHistoryState createState() => _AnsHistoryState();
}

class _AnsHistoryState extends State<AnsHistory> {
  // AnsHistorylistServices? services;
  // AnsHistorylistController? controller;
  List<AnsHistorylist> anshistorylist = List.empty();
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    widget.controller.onSync
        .listen((bool syncState) => setState(() => isLoading = syncState));
    _getanshistorylist();
  }

  void _getanshistorylist() async {
    var newanshistorylist = await widget.controller.fecthistorylist();
    setState(() {
      //context.read<CalculatorProvider>().anstemp = anshistorylist;
      anshistorylist = newanshistorylist;
    });
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Center(
            child: CircularProgressIndicator(
            backgroundColor: Colors.grey,
            valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
          ))
        : Scaffold(
            appBar: AppBar(
              title: Text('History'),
              backgroundColor: Colors.blueGrey.shade900,
            ),
            body: Consumer<CalculatorProvider>(builder: (context, show, child) {
              return ListView.separated(
                //itemCount: context.read<AnsHistorylist>().anshistory.length,
                itemCount: anshistorylist.isEmpty ? 1 : anshistorylist.length,
                itemBuilder: (context, index) {
                  //AnsHistorylist
                  return ListTile(
                    title: Text(
                      anshistorylist[index].AnsHistory + '=',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                      textAlign: TextAlign.right,
                    ),
                    subtitle: Text(
                      anshistorylist[index].Answer,
                      style: TextStyle(color: Colors.white, fontSize: 30),
                      textAlign: TextAlign.right,
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return Divider(
                    color: Colors.black,
                  );
                },
              );
            }));
  }
}
