import 'package:flutter/material.dart';

class PicDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
        child: Container(
      width: 200,
      height: 200,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: ExactAssetImage('images/yesno.jpeg'), fit: BoxFit.cover)),
    ));
  }
}
