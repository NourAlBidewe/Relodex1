import 'package:flutter/material.dart';
import 'package:m3allim/User.dart';

//import 'package:cloud_firestore/cloud_firestore.dart';
import './ServiceProvider.dart';
import './crud.dart';


class Badge extends StatefulWidget {

  String imagePath;

  //bool badgeAlreadyPressed = false;
  int badgeNum;
  ServiceProvider sv;
  String onClicked;
  String tag;
  String text;
  Function f;
  User u;



  Badge(image, ssv, badgeNumy, newImage, tag, text, u) {
    this.imagePath = image;
    this.sv = ssv;
    this.onClicked = newImage;
    this.badgeNum = badgeNumy;
    this.tag = tag;
    this.text = text;
    this.u = u;
  }



  @override
  State<StatefulWidget> createState() {
    return _Badge(
        imagePath,
        onClicked,
        badgeNum,
        sv,
        tag,
        text,u);
    }



}

class _Badge extends State<Badge> {

  String path = "";
  String imagePath;
  String newImagePath;
  int badgeNum;
  bool isPressed = false;
  ServiceProvider s;
  String tag;
  String text;
  User u;


//  _Badge(this.imagePath, this.newImagePath, this.badgeNum, this.s, this.tag, this.text);

  _Badge(image, newImage, badgeNumy, sv, tag, text, u) {
    this.imagePath = image;
    this.s = sv;
    this.u = u;

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
                
                fb.incrementServiceProviderBadges(s, u, badgeNum);
                // print(badgy);
                // if(badgy==1){
                //   path = newImagePath;
                // }
                // if(badgy==0){
                //   path = imagePath;
                // }
                // else{
                //   Scaffold.of(context).showSnackBar(new SnackBar(duration: Duration(milliseconds: 400),
                //       content: Text('يمكنك اعطاء شارة واحدة فقط',),
                //   ));
                // }
                //s.badges[badgeNum-1] = fb.incrementServiceProviderBadge(s, u, badgeNum, true);
                  // print(s.badges[0]);
                  // print(s.badges[1]);
                  // print(s.badges[2]);

                // if (isPressed == true) {
                //   fb.decrementServiceProviderBadges(s, u, badgeNum);
                //   //s.badges[badgeNum] -= 1;
                //   //fb.decrementServicerBadges(s, badgeNum);
                //   isPressed = false;
                //   path = imagePath;
                // } else {
                //   fb.incrementServiceProviderBadges(s, u, badgeNum);
                //   //s.badges[badgeNum] += 1;
                //  // fb.incrementServicerBadges(s, badgeNum);
                //   isPressed = true;
                //   path = newImagePath;
                // }
              });
            },
            child: Container(
              child: Column(
                children: <Widget>[
                  Image.asset(path,
                      width: MediaQuery.of(context).size.width/3.3, height: MediaQuery.of(context).size.width/3.3),
                  Container(
                    alignment: Alignment.center,
              child: Text.rich(
                TextSpan(
                  children: <TextSpan>[
                    TextSpan(text: text, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                  ],
                ),
              ),
              width: MediaQuery.of(context).size.width/3.3,
              // height: MediaQuery.of(context).size.width/3.3,
            ),
                ],
              ),
            )),
        Positioned(
          right: -3,
          top: -3,
          child: FloatingActionButton(
              heroTag: tag,
              backgroundColor: Colors.white,
              child: Text(
                (s.badges[badgeNum-1]).toString(),
                style: TextStyle(
                    color: Colors.purple,
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
