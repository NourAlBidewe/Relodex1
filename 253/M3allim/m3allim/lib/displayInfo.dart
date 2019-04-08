import 'package:flutter/material.dart';
import 'package:flutter_rating/flutter_rating.dart';


import './ServiceProvider.dart';

ServiceProvider sv;

class DisplayInfo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _DisplayInfo();
  }

  DisplayInfo(ServiceProvider s) {
    sv = s;
  }
}

class _DisplayInfo extends State<DisplayInfo> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height / 5,
        child: Column(children: <Widget>[
          Align(
//              alignment: Alignment(0.8, -1),
              alignment: Alignment(0, 0),
              child: Padding(
                padding: EdgeInsets.only(top: 0),
                child: new Text(
                  sv.name,
                  textAlign: TextAlign.right,
                  textDirection: TextDirection.ltr,
                  style: TextStyle(
                      color: Colors.black87,
                      fontSize: 34,
                      fontWeight: FontWeight.bold),
                ),
              )),
          Align(
//            alignment: Alignment(0.8, -0.8),
            alignment: Alignment(0, 0),
            child: new Text(
              sv.address,
              textAlign: TextAlign.right,
              textDirection: TextDirection.ltr,
              style: TextStyle(color: Colors.black54, fontSize: 20),
            ),
          ),
          new StarRating(
            size: MediaQuery.of(context).size.width/15,
            rating: sv.average_rating,
            color: Colors.orange,
            
          ),



        ]));
  }
}
