import 'dart:async';

import 'package:afekaton_project/services/database.dart';
import 'package:flutter/material.dart';

class RaiseHandDialog extends StatefulWidget {
  @override
  _RaiseHandDialogState createState() => _RaiseHandDialogState();
}

class _RaiseHandDialogState extends State<RaiseHandDialog> {
  List<String> raiseHands = List.empty();

  Timer timer;

  getRaiseHands() async {
    setState(() async {
      raiseHands = await DataBaseMethods().getAllRaiseHands();
    });
  }

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(Duration(seconds: 30), (Timer t) => getRaiseHands());
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
      child: ListView.separated(
        shrinkWrap: true,
        itemCount: raiseHands.length,
        itemBuilder: (context, index) {
          String name = raiseHands[index];
          return ListTile(
            title: Center(child: Text(name)),
            //value: isSelected[widget.diners.indexOf(diner)],
          );
        },
        separatorBuilder: (context, index) => Divider(),
      ),
    );
  }
}
