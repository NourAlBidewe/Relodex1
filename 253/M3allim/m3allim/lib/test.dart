import 'package:flutter/material.dart';
import './Categories.dart';

class test extends StatelessWidget {
  int index;
  List<Categories> c = new List();
  test(list, index) {
    c = list;
    this.index = index;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      elevation: 1.0,
      child:
          /*
      Stack(
        children: <Widget>[
          */
          Column(
        children: <Widget>[
          Container(
            height: 165.0,
            width: 170.0,
            // foregroundDecoration: const BoxDecoration(
            //   image: DecorationImage(
            //     fit: BoxFit.fill,
            //     image: Image.asset([index].imageName),
            //     alignment: Alignment(1, 0),
            //   ),
            // ),
            child: Image.asset(
              c[index].imageName,
              fit: BoxFit.cover,
            ),
          ),
          Text(
            c[index].name,
            style: TextStyle(
                background: Paint()..color = Colors.transparent,
                color: Colors.black,
                fontSize: 17.0,
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
      // Container(
      //   alignment: Alignment.bottomCenter,
      //   child: new Container(
      //     width: 200.0,
      //     decoration: BoxDecoration(color: Color.fromRGBO(54, 82, 254, 1.0)),
      //     child: new Text(
      //       c[index].name,
      //       style: TextStyle(
      //           color: Colors.black,
      //           fontSize: 20.0,
      //           fontWeight: FontWeight.bold),
      //       textAlign: TextAlign.center,
      //     ),
      //   ),
      // ),
      /*
        ],
      ),
      */
    );
  }
}
