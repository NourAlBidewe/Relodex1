import 'package:flutter/material.dart';

//import 'package:cloud_firestore/cloud_firestore.dart';
import './ServiceProvider.dart';

class ActionButton extends StatelessWidget {
  IconData icon;
  String tag;
  Color c;
  Color background;
  String texty;
  Function f;
  bool change;

  ActionButton(String tagy, IconData i, Color col, Color back, String text, fun,
      bool change) {
    this.icon = i;
    this.tag = tag;
    this.c = col;
    this.background = back;
    this.texty = text;
    this.f = fun;
    this.change = change;
  }

  Color getColor() {
    return this.c;
  }

  getIconData() {
    return this.icon;
  }

  getBackGroundColor() {
    return this.background;
  }

  getTag() {
    return this.tag;
  }

  getText() {
    return this.texty;
  }

  BoxDecoration setBoarder() {
    if (change) {
      return BoxDecoration(
        border: Border.all(width: 3, color: getColor()),
        shape: BoxShape.circle,
      );
    } else {
      return BoxDecoration(
        border: Border.all(width: 1, color: getColor()),
        shape: BoxShape.circle,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(bottom: 10, left: 10, right: 10),
        child: Column(
          children: <Widget>[
            GestureDetector(
              child: Container(
                width: 50,
                height: 50,
                decoration: setBoarder(),
                child: Icon(getIconData(), color: getColor(), size: 20),
              ),
              //
              onTap: f,
            ),
            Padding(
                padding: EdgeInsets.only(bottom: 5, top: 5),
                child: Text(getText(),
                    style:
                        TextStyle(fontSize: 15, fontWeight: FontWeight.bold)))
          ],
        ));
  }
}
