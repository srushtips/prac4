import 'package:flutter/material.dart';
import 'dart:math';
import 'package:firebase_database/firebase_database.dart';

import 'package:firebase_auth/firebase_auth.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blueGrey,
        appBar: AppBar(
          title: Text('Firebase'),
        ),
        body: DicePage(),
      ),
    ),
  );
}

bool dText;
var leftdicenumber = 1;
var rightdicenumber = 1;
void changeDiceFace() {
  rightdicenumber = Random().nextInt(6) + 1;
  leftdicenumber = Random().nextInt(6) + 1;
}

class DicePage extends StatefulWidget {
  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: <Widget>[
          Expanded(
            child: FlatButton(
              onPressed: () {
                setState(() {
                  getData();
                });
              },
              child: Image.asset('images/dice$leftdicenumber.png'),
            ),
          ),
          Expanded(
            child: FlatButton(
              onPressed: () {
                setState(() {
                  getData();
                });
              },
              child: Image.asset('images/dice$rightdicenumber.png'),
            ),
          ),
        ],
      ),
    );
  }
}

Future<bool> getData() async {
  bool result =
      (await FirebaseDatabase.instance.reference().child("allow").once()).value;
  print(result);
//  dText = result;
  if (result) {
    changeDiceFace();
    print('hey');
  } else {
    print('hi');
  }
  return result;
}
