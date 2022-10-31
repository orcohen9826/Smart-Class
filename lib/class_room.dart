import 'package:afekaton_project/dialogs/ac_dialog.dart';
import 'package:afekaton_project/dialogs/input_text_dialog.dart';
import 'package:afekaton_project/dialogs/yes_no_dialog.dart';
import 'package:afekaton_project/screens/ac_temp_layout.dart';
import 'package:afekaton_project/screens/camera_screen.dart';
import 'package:afekaton_project/services/database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class ClassRoom extends StatefulWidget {
  final DocumentReference userInClass;

  ClassRoom(this.userInClass);

  @override
  _ClassRoomState createState() => _ClassRoomState();
}

class _ClassRoomState extends State<ClassRoom> {
  bool raisedHand = false;
  bool frasteraded = false;

  List<String> qustions = List.empty();

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
            flex: 6,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 8),
                      child: TextFormField(
                        decoration: new InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          suffixIcon: Icon(Icons.send),
                          border: new OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(25.0),
                            borderSide: new BorderSide(),
                          ),
                        ),
                      ),
                    )),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Align(
                // flex: 5,
                alignment: Alignment.bottomCenter,
                child: GridView.count(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  crossAxisCount: 3,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 25,
                  padding: const EdgeInsets.all(40),
                  children: [
                    GridButton(
                      //camera
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CameraSCreen()));
                      },
                      color: Colors.cyan[100],
                      icon: Icons.camera_alt,
                    ),
                    GridButton(
                      //raise hand
                      onTap: () {
                        setState(() {
                          raisedHand = !raisedHand;
                          if (raisedHand) {
                            DataBaseMethods().addRaiseHand(widget.userInClass);
                          } else {
                            DataBaseMethods()
                                .removeRaiseHand(widget.userInClass);
                          }
                        });
                      },
                      onLongPress: () {
                        showDialog(
                            context: context,
                            builder: (context) => TextInputDiglod(
                                  title: "Enter your qustion",
                                )).then((value) => qustions.add(value));
                      },
                      color: raisedHand ? Colors.deepOrange : Colors.cyan[100],
                      icon: MdiIcons.hand,
                    ),
                    GridButton(
                      //air conditioner
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) => AcDialog(),
                        );
                      },
                      onLongPress: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AcTempImg()));
                      },
                      color: Colors.cyan[100],
                      icon: MdiIcons.airConditioner,
                    ),
                    GridButton(
                      //frasterated
                      onTap: () {
                        setState(() {
                          frasteraded = !frasteraded;
                        });
                      },
                      icon: MdiIcons.emoticonFrown,
                      color: frasteraded ? Colors.deepOrange : Colors.cyan[100],
                    ),
                    GridButton(
                      //questions
                      icon: MdiIcons.chatQuestion,
                      color: Colors.cyan[100],
                    ),
                    GridButton(
                      icon: Icons.bluetooth_searching_sharp,
                      color: Colors.cyan[100],
                    )
                  ],
                )),
          )
        ],
      ),
    ));
  }
}

class GridButton extends StatelessWidget {
  final IconData icon;
  Color color = Colors.cyan;
  final Function onTap;
  final Function onLongPress;

  GridButton({
    this.icon,
    this.color = Colors.cyan,
    this.onTap,
    this.onLongPress,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onTap,
        onLongPress: onLongPress,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          elevation: 2,
          color: color,
          child: Icon(
            icon,
            size: 50,
          ),
        ));
  }
}
