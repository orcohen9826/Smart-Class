import 'dart:async';

import 'package:afekaton_project/class_room.dart';
import 'package:afekaton_project/dialogs/ac_dialog.dart';
import 'package:afekaton_project/dialogs/pic_dialog.dart';
import 'package:afekaton_project/services/database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class TeacherScreen extends StatefulWidget {
  final DocumentReference teacher;

  const TeacherScreen({Key key, this.teacher}) : super(key: key);

  @override
  _TeacherScreenState createState() => _TeacherScreenState();
}

class _TeacherScreenState extends State<TeacherScreen> {
  List<String> raiseHands = List.empty();

  Timer timer;
  int number = 0;

  getRaiseHands() async {
    setState(() async {
      raiseHands = await DataBaseMethods().getAllRaiseHands();
      number++;
    });
  }

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(Duration(seconds: 5), (Timer t) => getRaiseHands());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("images/theme2.jpeg"), fit: BoxFit.cover)),
      child: Column(
        children: [
          Expanded(
            flex: 7,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 22),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ListTile(
                        title: Text(
                          "STATUS: ",
                          style: TextStyle(fontSize: 30),
                        ),
                        trailing: Text("students: ##"),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Qustions: ",
                          style: TextStyle(fontSize: 22),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        itemCount: raiseHands.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text(
                              raiseHands[index],
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          );
                        },
                      ),
                      Align(
                          alignment: Alignment.bottomCenter,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 8),
                            child: TextFormField(
                              decoration: new InputDecoration(
                                hintText: "Add file",
                                filled: true,
                                fillColor: Colors.white,
                                border: new OutlineInputBorder(
                                  borderRadius: new BorderRadius.circular(25.0),
                                  borderSide: new BorderSide(),
                                ),
                              ),
                            ),
                          )),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Expanded(
              flex: 5,
              child: GridView.count(
                shrinkWrap: false,
                physics: NeverScrollableScrollPhysics(),
                crossAxisCount: 3,
                mainAxisSpacing: 20,
                crossAxisSpacing: 25,
                padding: const EdgeInsets.all(40),
                children: [
                  GridButton(
                    //air conditioner
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) => AcDialog(),
                      );
                    },
                    icon: MdiIcons.airConditioner,
                    color: Colors.cyan[100],
                  ),
                  GridButton(
                    //questions
                    icon: MdiIcons.chatQuestion,
                    color: Colors.cyan[100],
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) => PicDialog(),
                      );
                    },
                  ),
                  GridButton(
                    icon: Icons.mic,
                    color: Colors.cyan[100],
                  )
                ],
              ))
        ],
      ),
    ));
  }
}
