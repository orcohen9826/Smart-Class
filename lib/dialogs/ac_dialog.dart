import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class AcDialog extends StatefulWidget {
  @override
  _AcDialogState createState() => _AcDialogState();
}

class _AcDialogState extends State<AcDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.symmetric(horizontal: 150, vertical: 150),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(40),
      ),
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(
              MdiIcons.whiteBalanceSunny,
              size: 50,
              color: Colors.red,
            ),
            Icon(
              MdiIcons.power,
              size: 50,
              color: Colors.black,
            ),
            Icon(
              Icons.ac_unit,
              size: 50,
              color: Colors.blue,
            ),
          ],
        ),
      ),
    );
  }
}
