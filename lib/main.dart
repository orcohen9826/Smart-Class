import 'package:afekaton_project/class_room.dart';
import 'package:afekaton_project/models/massage.dart';
import 'package:afekaton_project/models/user.dart';
import 'package:afekaton_project/services/database.dart';
import 'package:afekaton_project/teacher_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setEnabledSystemUIOverlays([]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Multi Class',
      theme: ThemeData(
          // brightness: Brightness.dark,
          accentColor: Colors.blue,
          primarySwatch: Colors.cyan),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  TextEditingController tecName = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("images/theme2.jpeg"), fit: BoxFit.cover)),
      child: Column(
        children: [
          SizedBox(
            height: 100,
          ),
          Container(
            padding: const EdgeInsets.all(20),
            child: Form(
              key: _formKey,
              child: TextFormField(
                controller: tecName,
                validator: (text) {
                  if (text == null || text.isEmpty) {
                    return "Please enter your name";
                  }
                  if (!RegExp(r"^[A-Za-zא-ת0-9 ]").hasMatch(text)) {
                    return "Name has to be letters or numbers only";
                  }
                  return null;
                },
                decoration: new InputDecoration(
                  // labelText: "Enter Name",
                  hintText: "Enter Name",
                  filled: true,
                  fillColor: Colors.white,
                  border: new OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(25.0),
                    borderSide: new BorderSide(),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 50),
          SizedBox(
            height: 50,
            width: 200,
            child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    String name = tecName.text;
                    if (name == "מרצה") {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => TeacherScreen()));
                    } else {
                      DataBaseMethods()
                          .uplodeUserInfo(User(tecName.text))
                          .then((value) {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ClassRoom(value)));
                        // builder: (context) => TeacherScreen()));
                      });
                    }
                  }
                },
                child: Padding(
                    padding: EdgeInsets.all(0),
                    child: Container(
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            'Enter class',
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.grey[200],
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward,
                            color: Colors.grey[200],
                          )
                        ],
                      ),
                    ))),
          )
        ],
      ),
    ));
  }
}
