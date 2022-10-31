import 'package:afekaton_project/models/massage.dart';
import 'package:afekaton_project/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DataBaseMethods {
  CollectionReference users =
      FirebaseFirestore.instance.collection("/classes/Fikus101/users");
  CollectionReference msgs =
      FirebaseFirestore.instance.collection("/classes/Fikus101/messages");
  DocumentReference c =
      FirebaseFirestore.instance.collection("/classes").doc("Fikus101");

  Future<DocumentReference> uplodeUserInfo(User user) async {
    return await users.add(user.toMap());
  }

  uplodeMessage(Massage msg) async {
    await msgs.add(msg.toMap());
  }

  Future<List<Massage>> getAllMasseges() async {
    msgs.get();
  }

  addRaiseHand(DocumentReference user) async {
    DocumentReference c = user.parent.parent;

    final data = await c.get();

    List<String> hands = List.from(data["raise_hand"]);
    hands.add((await user.get())["name"]);
    print(hands);

    Map<String, dynamic> info = {"raise_hand": hands};

    c.set(info);
  }

  removeRaiseHand(DocumentReference user) async {
    DocumentReference c = user.parent.parent;

    final data = await c.get();

    List<String> hands = List.from(data["raise_hand"]);
    //hands.add((await user.get())["name"]);
    hands.remove((await user.get())["name"]);

    Map<String, dynamic> info = {"raise_hand": hands};

    c.set(info);
  }

  Future<List<String>> getAllRaiseHands() async {
    final data = await c.get();
    List<String> hands = List.from(data["raise_hand"]);
    print(hands);
    return hands;
  }

  /*int getNumOfStudents(){
    users.doc().
  }*/
}
