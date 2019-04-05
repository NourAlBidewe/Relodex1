import 'package:flutter/material.dart';

//import 'package:cloud_firestore/cloud_firestore.dart';
import './serviceProvider.dart';

class ActionButton extends StatelessWidget {
  IconData icon;
  String tag;
  Color c;
  Color background;
  String texty;
  Function f;
  ActionButton(String tagy, IconData i, Color col,Color back, String text, fun) {
    this.icon = i;
    this.tag = tag;
    this.c = col;
     this.background = back;
    this.texty = text;
    this. f = fun;
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

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(bottom: 10, left: 10, right: 10),
        child: Column(
          children: <Widget>[
            // FloatingActionButton(
            //   mini: true,
            //   heroTag: getTag(),
            //   onPressed: f,
            //   child: Icon(getIconData(), color: getColor(), size: 20),
            //   backgroundColor: getBackGroundColor(),
              
            // ),
            GestureDetector(
              
              child: Container(
                //color: Colors.black,
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                 border: Border.all(width: 1,color: getColor()),
                 //borderRadius: BorderRadius.circular(100),
                 shape: BoxShape.circle,
                 //color: getColor(),
                 //backgroundBlendMode: BlendMode.clear,



              ),

              child: Icon(getIconData(), color: getColor(), size: 20),
              ),
              // 
              onTap: f,
              
            ),

            Padding(
                padding: EdgeInsets.all(5),
                child: Text(getText(),
                    style:
                        TextStyle(fontSize: 15, fontWeight: FontWeight.bold)))
          ],
        ));
  }
}
