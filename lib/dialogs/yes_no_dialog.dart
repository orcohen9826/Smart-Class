import 'package:flutter/material.dart';

class YesNoDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                color: Colors.green,
                child: Expanded(
                    child: TextButton(
                        onPressed: () {},
                        child: Text(
                          "Yes",
                          style: TextStyle(color: Colors.black),
                        ))),
              ),
              Container(
                color: Colors.red,
                child: Expanded(
                    child: TextButton(
                        onPressed: () {},
                        child: Text(
                          "No",
                          style: TextStyle(color: Colors.black),
                        ))),
              )
            ],
          ),
        ],
      ),
    );
  }
}
