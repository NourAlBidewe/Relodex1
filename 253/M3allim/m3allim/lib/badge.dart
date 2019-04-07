import 'package:flutter/material.dart';

//import 'package:cloud_firestore/cloud_firestore.dart';
import './Servicer.dart';
import './crud.dart';


class Badge extends StatefulWidget {

  String imagePath;

  //bool badgeAlreadyPressed = false;
  int badgeNum;
  Servicer sv;
  String onClicked;
  String tag;
  String text;
  Function f;

  Badge(image, ssv, badgeNumy, newImage, tag, text) {
    this.imagePath = image;
    this.sv = ssv;
    this.onClicked = newImage;
    this.badgeNum = badgeNumy;
    this.tag = tag;
    this.text = text;
  }

  @override
  State<StatefulWidget> createState() {
    return _Badge(
        imagePath,
        onClicked,
        badgeNum,
        sv,
        tag,
        text,);
    }


}

class _Badge extends State<Badge> {

  String path = "";
  String imagePath;
  String newImagePath;
  int badgeNum;
  bool isPressed = false;
  Servicer s;
  String tag;
  String text;


//  _Badge(this.imagePath, this.newImagePath, this.badgeNum, this.s, this.tag, this.text);

  _Badge(image, newImage, badgeNumy, sv, tag, text, ) {
    this.imagePath = image;
    this.s = sv;

    this.newImagePath = newImage;
    this.badgeNum = badgeNumy;
    this.tag = tag;
    this.text = text;
    this.path = image;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        GestureDetector(
            onTap: () {
              setState(() {
                if (isPressed == true) {
                  //s.badges[badgeNum] -= 1;
                  fb.decrementServicerBadges(s, badgeNum);
                  isPressed = false;
                  path = imagePath;
                } else {
                  //s.badges[badgeNum] += 1;
                  fb.incrementServicerBadges(s, badgeNum);
                  isPressed = true;
                  path = newImagePath;
                }
              });
            },
            child: Container(
              child: Column(
                children: <Widget>[
                  Image.asset(path,
                      width: MediaQuery.of(context).size.width/3.3,height: MediaQuery.of(context).size.width/3.3),
                  Container(
                    child: Text(
                      text,
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  )
                ],
              ),
            )),
        Positioned(
          right: 0,
          top: 0,
          child: FloatingActionButton(
              heroTag: tag,
              backgroundColor: Colors.white,
              child: Text(
                (s.badges[badgeNum]).toString(),
                style: TextStyle(
                    color: Colors.indigo,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
              mini: true,
              onPressed: (){}
          ),
        ),
      ],
    );
  }

}
